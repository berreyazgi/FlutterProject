## Wood Decor 🪵✨
**Wood Decor**, el yapımı ve zanaat ürünü ahşap süs eşyalarının (figürler, özel kutular, sanatsal objeler) sergilendiği ve satıldığı, modern ve minimalist tasarıma sahip bir **Flutter** mobil e-ticaret uygulamasıdır. 

Proje, temiz kod prensipleri ve sürdürülebilir yazılım mimarisi hedeflenerek mobil odaklı (Android & iOS) olarak geliştirilmiştir.
<img width="403" height="871" alt="WhatsApp Image 2026-05-16 at 16 29 03" src="https://github.com/user-attachments/assets/bebddac4-e317-4b71-a1ec-5736f550043f" />
<img width="403" height="871" alt="WhatsApp Image 2026-05-16 at 16 29 24" src="https://github.com/user-attachments/assets/97984e02-ebc0-47f5-b298-1a1ff1fb58bf" />
<img width="403" height="871" alt="WhatsApp Image 2026-05-16 at 16 29 56" src="https://github.com/user-attachments/assets/223cdf9c-17a2-4c29-9ff2-8454e6e7ddfe" />
<img width="403" height="871" alt="WhatsApp Image 2026-05-16 at 16 29 11" src="https://github.com/user-attachments/assets/a0e037e2-71f4-4765-8af3-655499d7d1aa" />

## Proje Kazanımları 

* **Çoklu Platform Optimizasyonu:** Cross-platform projelerde kullanılmayan native klasörlerin (`windows`, `macos`, `linux`, `web`) güvenli bir şekilde temizlenmesi ve projenin sadece mobil (Android & iOS) platformlara optimize edilerek hafifletilmesi sağlandı.
* **Durum Yönetimi:** Arama filtreleri ve sepet etkileşimleri gibi dinamik arayüz elementlerinin birbiriyle haberleşmesi için reaktif programlama prensipleri uygulandı.
* **Esnek ve Responsive Tasarım:** `GridView.builder` ve `ListView.builder` kullanılarak farklı ekran boyutlarına uyum sağlayan, kaydırılabilir ve performans dostu arayüzler inşa edildi.
* **Clean Architecture Proneprensipleri:** İş mantığı (Domain), veri yönetimi (Data) ve arayüz (Presentation) katmanları birbirinden tamamen soyutlanarak kodun test edilebilirliği ve sürdürülebilirliği artırıldı.

---

## Çekirdek İşlevler ve Bileşen Mimarisi

### 1. Alışveriş Sepeti & Sepete Ekle  Mantığı

Uygulamanın sepet yönetimi, kullanıcı deneyimini (UX) en üst düzeyde tutacak şekilde tasarlanmıştır:

* **"Add to Cart" Butonu:** Ürün detay ekranında yer alan buton, tetiklendiğinde ilgili ürüne ait benzersiz ID, ağaç türü, boyut ve fiyat bilgilerini bir `CartEntity` modeline dönüştürerek durum yönetimine (State) iletir.
* **Dinamik Sepet İkonu:** Sağ üst köşede yer alan sepet ikonu, uygulamanın durumunu (State) sürekli dinler. Sepete yeni bir ürün eklendiğinde ikon üzerindeki sayaç (badge) asenkron olarak güncellenir ve kullanıcının sayfayı yenilemesine gerek kalmadan görsel geri bildirim sağlar.

### 2. Arama İkonu ve Filtreleme Entegrasyonu

Ana ekranda yer alan arama ve filtreleme yapısı, kullanıcıların aradıkları ahşap dekor ürünlerine hızlıca ulaşmasını sağlar:

* **Arama Çubuğu (Search Bar):** Arama çubuğunun sol tarafında yer alan büyüteç (Search) ikonu, kullanıcılara sezgisel bir arama deneyimi sunar. Kullanıcı metin girdikçe (Debounce mekanizması ile optimize edilmiş şekilde) ürün listesi dinamik olarak filtrelenir.
* **Kategori Çipleri (Filter Chips):** Ağaç türlerine (Ceviz, Meşe vb.) göre hazırlanan çipler, arama barı ile entegre çalışır. Örneğin; kullanıcı hem "Ceviz" çipini seçip hem de arama barına bir kelime yazdığında, her iki filtre de mantıksal `VE (AND)` süzgecinden geçerek sonuçları anlık olarak günceller.


## Teknolojiler ve Mimari

Bu projede kodun okunabilirliğini, test edilebilirliğini ve modülerliğini artırmak amacıyla **Clean Architecture** (Temiz Mimari) prensipleri benimsenmiştir.

* **Framework:** [Flutter](https://flutter.dev/) (Dart)
* **Durum Yönetimi (State Management):** BLoC / Riverpod (Modüler yapıya uygun)
* **Platform Desteği:** Android ve iOS (Proje klasörleri optimize edilerek masaüstü ve web kalabalığından arındırılmıştır).

### Klasör Yapısı (`lib/`)


```
```text
lib/
│
├── core/                         # Uygulama genelinde paylaşılan sabitler, temalar ve araçlar
│   ├── constants/                # Renk, boyut ve string sabitleri
│   └── theme/                    # Ahşap konseptine uygun sıcak/minimalist tema tanımları
│
├── data/                         # Veri katmanı (Veri kaynakları, modeller ve repoların somutlamaları)
│   ├── datasources/              # Lokal veya uzak veri kaynakları (Mock ürün listesi)
│   └── models/                   # Ürün (Product) veri modelleri ve JSON dönüşümleri
│
├── domain/                       # İş mantığı katmanı (Tamamen Dart/Saf kod, framework bağımsız)
│   ├── entities/                 # Ürün entity'leri (Ağaç türü, boyut, fiyat vb.)
│   └── repositories/             # Veri katmanı ile haberleşmeyi sağlayan soyut sınıflar
│
└── presentation/                 # Arayüz katmanı (Ekranlar, widget'lar ve state yönetimi)
    ├── bloc/                     # Arama ve filtreleme mantığını yöneten state yapıları
    ├── screens/                  
    │   ├── main_screen.dart      # Arama çubuğu, filtreler ve 2x2 gridin bulunduğu ana ekran
    │   └── detail_screen.dart    # Ağaç türü, boyut bilgisi ve sepet butonunu içeren detay ekranı
    └── widgets/                  # Ürün kartları, filtre çipleri gibi tekrar kullanılabilir bileşenler

```

---

## Kurulum ve Çalıştırma

Projeyi yerel ortamınızda çalıştırmak için aşağıdaki adımları takip edebilirsiniz:

1. **Depoyu Klonlayın:**
```bash
git clone [https://github.com/kullanici_adi/wood-decor.git](https://github.com/kullanici_adi/wood-decor.git)
cd wood-decor

```


2. **Bağımlılıkları Yükleyin:**
```bash
flutter pub get

```


3. **Gerekli Native Platform Klasörlerini Oluşturun / Güncelleyin (Gerekirse):**
```bash
flutter create .

```


4. **Uygulamayı Çalıştırın:**
```bash
flutter run

```
