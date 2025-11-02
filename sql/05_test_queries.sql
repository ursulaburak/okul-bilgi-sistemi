-- Temel DML ve WHERE sorguları
-- 1. Bilgisayar Mühendisliği bölümündeki öğrencileri listele
SELECT * FROM ogrenciler 
WHERE bolum_id = (SELECT bolum_id FROM bolumler WHERE bolum_adi = 'Bilgisayar Mühendisliği');

-- 2. MAT101 kodlu dersi veren öğretmeni bul
SELECT ot.ad, ot.soyad 
FROM ogretmenler ot
JOIN dersler d ON ot.ogretmen_id = d.ogretmen_id
WHERE d.ders_kodu = 'MAT101';

-- Gruplama sorguları
-- 3. Her bölümdeki toplam öğrenci sayısı
SELECT b.bolum_adi, COUNT(o.ogrenci_id) AS ogrenci_sayisi
FROM bolumler b
LEFT JOIN ogrenciler o ON b.bolum_id = o.bolum_id
GROUP BY b.bolum_id, b.bolum_adi;

-- 4. Her dersin not ortalaması (vize %40, final %60)
SELECT 
    d.ders_kodu,
    d.ders_adi,
    ROUND(AVG((od.vize_notu * 0.4) + (od.final_notu * 0.6)), 2) AS ortalama_not
FROM dersler d
JOIN ogrenci_dersleri od ON d.ders_id = od.ders_id
GROUP BY d.ders_id, d.ders_kodu, d.ders_adi;

-- JOIN sorguları
-- 5. Öğrencilerin adı ve kayıtlı oldukları bölümün adı
SELECT o.ad, o.soyad, b.bolum_adi
FROM ogrenciler o
JOIN bolumler b ON o.bolum_id = b.bolum_id;

-- 6. Öğrencinin aldığı tüm dersler ve notları
SELECT o.ad, o.soyad, d.ders_kodu, d.ders_adi, d.kredi, od.vize_notu, od.final_notu
FROM ogrenciler o
JOIN ogrenci_dersleri od ON o.ogrenci_id = od.ogrenci_id
JOIN dersler d ON od.ders_id = d.ders_id
WHERE o.ogrenci_no = '2024001';

-- 7. Dersler ve öğretmenleri
SELECT d.ders_kodu, d.ders_adi, ot.ad || ' ' || ot.soyad AS ogretmen
FROM dersler d
JOIN ogretmenler ot ON d.ogretmen_id = ot.ogretmen_id;

-- Fonksiyon testleri
-- 8. Harf notu hesaplama fonksiyonu testi
SELECT fn_harf_notu_hesapla(70, 80) AS harf_notu;

-- 9. Ders geçme durumu fonksiyonu testi
SELECT fn_ders_gecme_durumu(70, 80) AS gecme_durumu;

-- Prosedür testleri
-- 10. Öğrenci derse kayıt prosedürü testi
CALL sp_ogrenci_derse_kayit(1, 2, 2024, 'Bahar');

-- 11. Not girişi prosedürü testi
CALL sp_not_girisi(8, 75, 85);

-- View testleri
-- 12. Transkript görünümü testi
SELECT * FROM view_transkript WHERE ogrenci_no = '2024001';

-- 13. Bölüm ders listesi görünümü testi
SELECT * FROM view_bolum_ders_listesi WHERE bolum_adi = 'Bilgisayar Mühendisliği';

-- Hata testleri
-- 14. Aynı derse tekrar kayıt denemesi (hata vermeli)
CALL sp_ogrenci_derse_kayit(1, 1, 2024, 'Güz');

-- 15. Geçersiz not girişi (hata vermeli)
CALL sp_not_girisi(1, 150, 80);