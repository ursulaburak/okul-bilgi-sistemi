-- Bölümler ekleme
INSERT INTO bolumler (bolum_adi) VALUES 
('Bilgisayar Mühendisliği'),
('Elektrik-Elektronik Mühendisliği'),
('Makine Mühendisliği'),
('Matematik');

-- Öğretmenler ekleme
INSERT INTO ogretmenler (ad, soyad, bolum_id) VALUES 
('Ahmet', 'Yılmaz', 1),
('Ayşe', 'Demir', 1),
('Mehmet', 'Kaya', 2),
('Zeynep', 'Şahin', 3),
('Ali', 'Çelik', 4);

-- Öğrenciler ekleme
INSERT INTO ogrenciler (ogrenci_no, ad, soyad, bolum_id) VALUES 
('2024001', 'Mustafa', 'Akar', 1),
('2024002', 'Elif', 'Yıldız', 1),
('2024003', 'Burak', 'Öztürk', 2),
('2024004', 'Seda', 'Korkmaz', 3),
('2024005', 'Cem', 'Arslan', 1);

-- Dersler ekleme
INSERT INTO dersler (ders_kodu, ders_adi, kredi, ogretmen_id) VALUES 
('BIL101', 'Programlamaya Giriş', 4, 1),
('BIL201', 'Veri Yapıları', 5, 1),
('BIL301', 'Veritabanı Sistemleri', 5, 2),
('MAT101', 'Matematik I', 6, 5),
('ELE201', 'Devre Teorisi', 5, 3),
('MAK101', 'Statik', 4, 4);

-- Öğrenci ders kayıtları
INSERT INTO ogrenci_dersleri (ogrenci_id, ders_id, vize_notu, final_notu, yil, donem) VALUES 
(1, 1, 75, 80, 2024, 'Güz'),
(1, 4, 60, 70, 2024, 'Güz'),
(2, 1, 85, 90, 2024, 'Güz'),
(2, 3, 70, 75, 2024, 'Güz'),
(3, 5, 65, 60, 2024, 'Güz'),
(4, 6, 80, 85, 2024, 'Güz'),
(5, 1, 55, 65, 2024, 'Güz');