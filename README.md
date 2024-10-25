Server Wipe Script

Bu script, QBCore ve ESX framework'leri için geliştirilmiş bir server wipe aracıdır. Sunucudaki tüm oyuncu verilerini (envanter, araçlar, paralar vb.) sıfırlayarak sunucuyu temiz bir hale getirir. Sadece belirlenen yetkili gruplar bu komutu çalıştırabilir.

Özellikler
✅ QBCore ve ESX desteği: Script, her iki framework ile uyumlu olarak çalışır.
🔒 Yetkili gruplar için erişim: Komut sadece mod, admin ve superadmin gibi yetkilere sahip gruplar tarafından kullanılabilir.
📢 Detaylı loglama ve bildirim: Sıfırlama işlemi sırasında sunucudaki oyunculara ve konsola bilgilendirme mesajları gönderilir.


Kurulum
Script Dosyasını Ekle
Bu scriptin içeriğini wipe.lua dosyasına kopyalayın ve resources klasörünüze ekleyin.

fxmanifest.lua Güncellemesi
Scriptin sunucuda çalışması için fxmanifest.lua dosyasına aşağıdaki satırı ekleyin:

lua
Kodu kopyala
server_script 'wipe.lua'
dependency 'oxmysql'
oxmysql Bağımlılığı
Script, veritabanı işlemleri için oxmysql kullanır. Sunucunuzda oxmysql yüklü olduğundan emin olun. Eğer oxmysql yerine ghmattimysql kullanıyorsanız, wipe.lua içindeki oxmysql fonksiyonlarını ghmattimysql olarak güncelleyin.

Sunucuyu Yeniden Başlatın
fxmanifest.lua ve wipe.lua dosyalarını ekledikten sonra sunucunuzu yeniden başlatın.


Kullanım
/serverwipe Komutu
/serverwipe komutu, sunucudaki tüm oyuncu verilerini sıfırlar. Bu komut sadece belirli yetkilere sahip kullanıcılar tarafından kullanılabilir.
Yetkili Gruplar: Bu komutu kullanabilen gruplar mod, admin ve superadmin olarak tanımlanmıştır.
Komut çalıştırıldığında:
Belirtilen veritabanı tabloları sıfırlanır.
Sunucudaki tüm oyuncular sunucudan atılır ve "Sunucu sıfırlanıyor, lütfen tekrar bağlanın." mesajı gösterilir.
Tüm işlemler tamamlandığında bir başarı mesajı konsola yazdırılır.
Yetkili Olmayan Kullanıcılar
Yetkili olmayan kullanıcılar komutu çalıştırmaya çalışırsa, "Bu komutu kullanma yetkiniz yok." şeklinde bir mesaj alırlar.

Script Yapısı
Framework Tespiti
Script, sunucu başlatıldığında QBCore veya ESX framework'lerinin yüklenip yüklenmediğini kontrol eder. Hangisinin yüklü olduğunu algılayarak işlemleri o framework'e uygun şekilde gerçekleştirir.

Yetki Kontrol Fonksiyonu (isAuthorized)

isAuthorized fonksiyonu, oyuncunun grubu belirtilen yetkili gruplardan biri mi kontrol eder. Komut sadece mod, admin ve superadmin gruplarına özeldir.
QBCore için Player.PlayerData.job.name, ESX için xPlayer.getGroup() kullanılarak yetki kontrolü yapılır.
Sıfırlama Fonksiyonu (StartWipe)

Bu fonksiyon, sıfırlama işleminin ana fonksiyonudur.
Belirlenen tüm tablolar (oyuncu envanteri, araçlar, kıyafetler, vb.) temizlenir.
Sunucudaki tüm oyuncular sunucudan atılır ve log mesajları konsola yazdırılır.
Wipe İşlemi Sırasında Temizlenen Tablolar

players: Oyuncu ana verileri
owned_vehicles: Oyuncuya ait araçlar
player_inventory: Oyuncu envanter verileri
player_jobs: Oyuncu iş verileri
player_outfits: Oyuncu kıyafet verileri
player_houses: Oyuncu evleri
player_gangs: Oyuncu çete verileri
trunk_items: Araç bagajları
glovebox_items: Araç torpido gözleri
player_money: Oyuncu paraları


İşte bu script için GitHub README formatına uygun bir dokümantasyon:

Server Wipe Script
Bu script, QBCore ve ESX framework'leri için geliştirilmiş bir server wipe aracıdır. Sunucudaki tüm oyuncu verilerini (envanter, araçlar, paralar vb.) sıfırlayarak sunucuyu temiz bir hale getirir. Sadece belirlenen yetkili gruplar bu komutu çalıştırabilir.

Özellikler
✅ QBCore ve ESX desteği: Script, her iki framework ile uyumlu olarak çalışır.
🔒 Yetkili gruplar için erişim: Komut sadece mod, admin ve superadmin gibi yetkilere sahip gruplar tarafından kullanılabilir.
📢 Detaylı loglama ve bildirim: Sıfırlama işlemi sırasında sunucudaki oyunculara ve konsola bilgilendirme mesajları gönderilir.
Kurulum
Script Dosyasını Ekle
Bu scriptin içeriğini wipe.lua dosyasına kopyalayın ve resources klasörünüze ekleyin.

fxmanifest.lua Güncellemesi
Scriptin sunucuda çalışması için fxmanifest.lua dosyasına aşağıdaki satırı ekleyin:

lua
Kodu kopyala
server_script 'wipe.lua'
dependency 'oxmysql'
oxmysql Bağımlılığı
Script, veritabanı işlemleri için oxmysql kullanır. Sunucunuzda oxmysql yüklü olduğundan emin olun. Eğer oxmysql yerine ghmattimysql kullanıyorsanız, wipe.lua içindeki oxmysql fonksiyonlarını ghmattimysql olarak güncelleyin.

Sunucuyu Yeniden Başlatın
fxmanifest.lua ve wipe.lua dosyalarını ekledikten sonra sunucunuzu yeniden başlatın.

Kullanım
/serverwipe Komutu
/serverwipe komutu, sunucudaki tüm oyuncu verilerini sıfırlar. Bu komut sadece belirli yetkilere sahip kullanıcılar tarafından kullanılabilir.
Yetkili Gruplar: Bu komutu kullanabilen gruplar mod, admin ve superadmin olarak tanımlanmıştır.
Komut çalıştırıldığında:
Belirtilen veritabanı tabloları sıfırlanır.
Sunucudaki tüm oyuncular sunucudan atılır ve "Sunucu sıfırlanıyor, lütfen tekrar bağlanın." mesajı gösterilir.
Tüm işlemler tamamlandığında bir başarı mesajı konsola yazdırılır.
Yetkili Olmayan Kullanıcılar
Yetkili olmayan kullanıcılar komutu çalıştırmaya çalışırsa, "Bu komutu kullanma yetkiniz yok." şeklinde bir mesaj alırlar.
Script Yapısı
Framework Tespiti
Script, sunucu başlatıldığında QBCore veya ESX framework'lerinin yüklenip yüklenmediğini kontrol eder. Hangisinin yüklü olduğunu algılayarak işlemleri o framework'e uygun şekilde gerçekleştirir.

Yetki Kontrol Fonksiyonu (isAuthorized)

isAuthorized fonksiyonu, oyuncunun grubu belirtilen yetkili gruplardan biri mi kontrol eder. Komut sadece mod, admin ve superadmin gruplarına özeldir.
QBCore için Player.PlayerData.job.name, ESX için xPlayer.getGroup() kullanılarak yetki kontrolü yapılır.
Sıfırlama Fonksiyonu (StartWipe)

Bu fonksiyon, sıfırlama işleminin ana fonksiyonudur.
Belirlenen tüm tablolar (oyuncu envanteri, araçlar, kıyafetler, vb.) temizlenir.
Sunucudaki tüm oyuncular sunucudan atılır ve log mesajları konsola yazdırılır.
Wipe İşlemi Sırasında Temizlenen Tablolar

players: Oyuncu ana verileri
owned_vehicles: Oyuncuya ait araçlar
player_inventory: Oyuncu envanter verileri
player_jobs: Oyuncu iş verileri
player_outfits: Oyuncu kıyafet verileri
player_houses: Oyuncu evleri
player_gangs: Oyuncu çete verileri
trunk_items: Araç bagajları
glovebox_items: Araç torpido gözleri
player_money: Oyuncu paraları


Uyarılar
⚠️ UYARI: Bu script tüm oyuncu verilerini kalıcı olarak silecektir. Sunucu veritabanınızı yedeklemeden bu komutu kullanmayın!
