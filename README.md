# Okul Bilgi Sistemi (OBS) Çekirdeği

**Bir PostgreSQL Veritabanı ve İş Mantığı Projesi**

Bu proje, bir eğitim kurumunun temel akademik süreçlerini yönetebilecek
bir **OBS çekirdek sistemi** geliştirmeyi amaçlar. Projede, veritabanı
tasarımı ve PostgreSQL'in gelişmiş yetenekleri (Fonksiyonlar, Stored
Procedure'ler, View'lar) kullanılarak **backend odaklı** bir çözüm
oluşturulmuştur.

------------------------------------------------------------------------

## Temel Özellikler

    -Öğrenci, öğretmen, ders ve bölüm yönetimi

    -Not girişi ve otomatik harf notu hesaplama

    -Transkript oluşturma

    -Stored procedure ve fonksiyonlar

    -View'lar ile karmaşık sorguların basitleştirilmesi

------------------------------------------------------------------------

## Projeyi Çalıştırma

[deepseek_bash_20251102_975758.sh](https://github.com/user-attachments/files/23289528/deepseek_bash_20251102_975758.sh)
# GitHub'dan klonlayın
git clone https://github.com/kullaniciadiniz/okul-bilgi-sistemi.git

# Veya ZIP olarak indirin ve açın
# okul-bilgi-sistemi-main.zip

------------------------------------------------------------------------


├── 📁 database/               # SQL dosyaları
│   ├── 01_schema.sql         # Veritabanı şeması
│   ├── 02_data.sql           # Örnek veriler
│   ├── 03_functions.sql      # Fonksiyonlar ve prosedürler
│   ├── 04_views.sql          # Görünümler (Views)
│   └── 05_test_queries.sql   # Test sorguları
├── 📁 docs/                  # Dokümantasyon
│   ├── kurulum-kilavuzu.md   # Detaylı kurulum rehberi
│   └── proje-raporu.md       # Proje detayları
├── 📁 images/                # Ekran görüntüleri
├── 📄 README.md              # Bu dosya
├── 📄 .gitignore            # Git ignore ayarları
└── 📄 LICENSE               # MIT Lisansıseek_text_20251102_b0c4d9.txt…]()

------------------------------------------------------------------------

## Kurulum Adımları
1. Gereksinimler

    PostgreSQL 12 veya üzeri

    DBeaver, pgAdmin veya benzeri SQL client

2. Veritabanı Kurulumu

-- 1. Veritabanını oluşturun
CREATE DATABASE okul_bilgi_sistemi;

-- 2. Veritabanına bağlanın

**Örnek verileri ekle
psql -h localhost -p 5435 -U postgres -d okul_bilgi_sistemi -f database/02_data.sql

**Fonksiyonları oluştur
psql -h localhost -p 5435 -U postgres -d okul_bilgi_sistemi -f database/03_functions.sql

**View'ları oluştur
psql -h localhost -p 5435 -U postgres -d okul_bilgi_sistemi -f database/04_views.sql

------------------------------------------------------------------------








