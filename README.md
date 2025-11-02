# 🎓 Okul Bilgi Sistemi (OBS) Çekirdeği

**Bir PostgreSQL Veritabanı ve İş Mantığı Projesi**

Bu proje, bir eğitim kurumunun temel akademik süreçlerini yönetebilecek
bir **OBS çekirdek sistemi** geliştirmeyi amaçlar. Projede, veritabanı
tasarımı ve PostgreSQL'in gelişmiş yetenekleri (Fonksiyonlar, Stored
Procedure'ler, View'lar) kullanılarak **backend odaklı** bir çözüm
oluşturulmuştur.

------------------------------------------------------------------------

## 📌 Proje Kapsamı

### ✅ Yönetilen Varlıklar

-   Öğrenciler\
-   Öğretmenler / Akademisyenler\
-   Bölümler\
-   Dersler\
-   Notlar / Ders Kayıtları

### ✅ Desteklenen İşlemler

-   Öğrenci kaydı\
-   Derse kayıt\
-   Not girişleri\
-   Transkript oluşturma\
-   Bölüm ders programı görüntüleme

------------------------------------------------------------------------

## 🛠️ Teknolojiler ve Özellikler

  Alan             Açıklama
  ---------------- -------------------------------------
  Veritabanı       PostgreSQL
  Dil              PL/pgSQL
  Özellikler       Function, Procedure, View
  Şema Kuralları   3NF, Foreign Key, Check Constraints

------------------------------------------------------------------------

## 📂 Proje Dosya Yapısı

  Dosya                        Açıklama
  ---------------------------- -------------------------------------
  `schema.sql`                 Veritabanı tabloları
  `data.sql`                   Örnek veri ekleme komutları
  `logic.sql`                  Fonksiyonlar & Stored Procedure'ler
  `views.sql`                  View tanımları
  `test_queries.sql`           Test sorguları
  `report.pdf` / `report.md`   Tasarım raporu
  `README.md`                  Proje bilgileri

------------------------------------------------------------------------

## 🧠 İş Mantığı (Functions & Procedures)

### Fonksiyonlar

  Fonksiyon                Açıklama
  ------------------------ ----------------------
  `fn_harf_notu_hesapla`   Ortalama → Harf notu
  `fn_ders_gecme_durumu`   Geçti/Kaldı hesaplar

### Prosedürler

  Prosedür                   Açıklama
  -------------------------- ----------------------------
  `sp_ogrenci_derse_kayit`   Öğrenciyi derse kayıt eder
  `sp_not_girisi`            Not ekler/günceller

------------------------------------------------------------------------

## 👁️ Görünümler (Views)

  View                        Açıklama
  --------------------------- --------------------------------
  `view_transkript`           Öğrencinin ders ve not listesi
  `view_bolum_ders_listesi`   Bölüm ders programı

------------------------------------------------------------------------

## 🚀 Kullanım

``` bash
psql -U postgres -f schema.sql
psql -U postgres -f data.sql
psql -U postgres -f logic.sql
psql -U postgres -f views.sql
psql -U postgres -f test_queries.sql
```

### Örnek Komutlar

``` sql
SELECT fn_harf_notu_hesapla(70, 80);
CALL sp_ogrenci_derse_kayit(1, 3, 2024, 1);
SELECT * FROM view_transkript WHERE ogrenci_no = '12345';
```

------------------------------------------------------------------------

## 📄 Rapor İçeriği

-   Normalizasyon açıklaması
-   İlişkisel veri modeli
-   Test senaryoları

------------------------------------------------------------------------

Hazırsanız bir sonraki adım: `schema.sql` oluşturabilirsiniz! 🎯
