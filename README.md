## Ev Dekorasyon ve Tasarım 
Bu projede, müşterilerin mobilyaları çevrimiçi mağazalardan satın almasına olanak tanıyarak, daha geniş bir ürün yelpazesi, fiyat karşılaştırma imkanı ve evden alışveriş kolaylığı sağlar. Mobilya e-ticaret platformları genellikle koltuklar, masalar, sandalyeler, dolaplar, yataklar ve diğer aksesuarlar gibi çeşitli mobilya türlerini içeren kapsamlı bir ürün kataloğuna sahiptir. E-ticaret web siteleri genellikle ayrıntılı ürün açıklamaları, fotoğraflar ve fiyat bilgileri sunar ve müşterilere çeşitli ödeme yöntemleri ile ürün teslimat seçenekleri sağlar.

Bu sistemin oluşturulma amacı, Laravel'in 10. versiyonunda öğrenme amaçlı bir proje geliştirmektir. Bu uygulama, Laravel v10 kullanılarak oluşturulmuş olup, minimum PHP v8.1 sürümünü gerektirmektedir. Bu nedenle, kurulum veya kullanım sürecinde hata ya da sorunlarla karşılaşılması durumunda, bunun desteklenmeyen bir PHP sürümünden kaynaklanmış olması muhtemeldir.

## Özellikler
users: Kullanıcı bilgilerini içerir.
products: Ürünlerin bilgilerini depolar.
categories: Ürün kategorilerini tanımlar.
showcases: Gösterimdeki ürünler ve içerikleri içerir.
carts: Kullanıcıların alışveriş sepetlerini saklar.
transactions: Kullanıcıların satın alma işlemlerini kaydeder.
transaction_items: Satın alınan ürünlerin detaylarını içerir.
deliveries: Sipariş teslimat bilgilerini saklar.
rewards: Kullanıcı ödülleri ve puan sistemini içerir.
payments: Ödeme işlemleriyle ilgili bilgileri saklar.

## Teknolojiler
- Veritabanı: MySQL
- Backend Framework: Laravel
- Frontend: HTML, CSS, JavaScript (Bootstrap)

# Kurulum
## Bu projeyi yerel makinenizde çalıştırmak için aşağıdaki adımları takip edebilirsiniz:

Projeyi klonlayın:

```
git clone https://github.com/EnginSahin-comu/db-1.git
```


Gerekli bağımlılıkları yükleyin:
```
composer install
npm install
```

.env dosyasını yapılandırın:

```
cp .env.example .env
```

.env dosyasındaki veritabanı ayarlarını kendi sisteminize göre düzenleyin.

Veritabanını oluşturun ve migrasyonları çalıştırın:

```
php artisan migrate
```
Uygulamayı başlatın:
```
php artisan serve
```
Tarayıcınızda http://localhost:8000 adresine giderek uygulamayı görüntüleyebilirsiniz.
