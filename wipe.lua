-- wipe.lua
-- QBCore ve ESX sunucuları için yetkililere özel veri sıfırlama (wipe) scripti

local Framework = nil

-- Framework tespit fonksiyonu
CreateThread(function()
    if GetResourceState("qb-core") == "started" then
        Framework = "QBCore"
        QBCore = exports['qb-core']:GetCoreObject()
        print("^2[WIPE]^7: QBCore framework algılandı.")
    elseif GetResourceState("es_extended") == "started" then
        Framework = "ESX"
        ESX = exports['es_extended']:getSharedObject()
        print("^2[WIPE]^7: ESX framework algılandı.")
    else
        print("^1[WIPE]^7: Desteklenen bir framework bulunamadı!")
    end
end)

-- Wipe işlemini başlatan komut (sadece yetkililer için)
RegisterCommand('serverwipe', function(source)
    local src = source

    -- Yetki kontrolü
    if Framework == "QBCore" then
        local Player = QBCore.Functions.GetPlayer(src)
        if Player and isAuthorized(Player.PlayerData.job.name) then
            StartWipe()
        else
            TriggerClientEvent('chat:addMessage', src, { template = '<div class="chat-message error">Bu komutu kullanma yetkiniz yok.</div>' })
        end
    elseif Framework == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(src)
        if xPlayer and isAuthorized(xPlayer.getGroup()) then
            StartWipe()
        else
            TriggerClientEvent('chat:addMessage', src, { template = '<div class="chat-message error">Bu komutu kullanma yetkiniz yok.</div>' })
        end
    else
        print("^1[WIPE]^7: Framework bulunamadı, wipe işlemi gerçekleştirilemiyor.")
    end
end, false)

-- Yetki kontrol fonksiyonu
function isAuthorized(group)
    local authorizedGroups = { "mod", "admin", "superadmin" } -- Yetkili gruplar
    for _, authorizedGroup in ipairs(authorizedGroups) do
        if group == authorizedGroup then
            return true
        end
    end
    return false
end

-- Sıfırlama fonksiyonu
function StartWipe()
    TriggerClientEvent('chat:addMessage', -1, { template = '<div class="chat-message server">Sunucu sıfırlama işlemi başladı!</div>' })

    -- Veritabanındaki tabloları temizle
    local tablesToWipe = {
        'players',            -- Oyuncu ana verileri
        'player_vehicles',     -- Oyuncuya ait araçlar
        'player_inventory',   -- Oyuncu envanter verileri
        'player_jobs',        -- Oyuncu iş verileri
        'player_outfits',     -- Oyuncu kıyafet verileri
        'player_houses',      -- Oyuncu evleri
        'player_gangs',       -- Oyuncu çete verileri
        'trunk_items',        -- Araç bagajları
        'glovebox_items',     -- Araç torpido gözleri
        'player_money'        -- Oyuncu paraları
    }

    for _, tableName in ipairs(tablesToWipe) do
        exports.oxmysql:executeSync('DELETE FROM '..tableName)
        print('^1[WIPE]^7: '..tableName..' tablosu temizlendi.')
    end

    -- Sunucudaki tüm oyuncuları kickleyin
    for _, playerId in ipairs(GetPlayers()) do
        DropPlayer(playerId, 'Sunucu sıfırlanıyor, lütfen tekrar bağlanın.')
    end

    print("^2Sunucu sıfırlama işlemi tamamlandı!^7")
end
