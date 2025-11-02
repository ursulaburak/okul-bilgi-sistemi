-- Transkript görünümü
CREATE OR REPLACE VIEW view_transkript AS
SELECT 
    o.ogrenci_no,
    o.ad || ' ' || o.soyad AS ogrenci_ad_soyad,
    d.ders_kodu,
    d.ders_adi,
    d.kredi,
    od.vize_notu,
    od.final_notu,
    fn_harf_notu_hesapla(od.vize_notu, od.final_notu) AS harf_notu,
    fn_ders_gecme_durumu(od.vize_notu, od.final_notu) AS gecme_durumu,
    od.yil,
    od.donem
FROM ogrenciler o
JOIN ogrenci_dersleri od ON o.ogrenci_id = od.ogrenci_id
JOIN dersler d ON od.ders_id = d.ders_id
ORDER BY o.ogrenci_no, od.yil, od.donem;

-- Bölüm ders listesi görünümü
CREATE OR REPLACE VIEW view_bolum_ders_listesi AS
SELECT 
    b.bolum_adi,
    d.ders_kodu,
    d.ders_adi,
    d.kredi,
    ot.ad || ' ' || ot.soyad AS ogretmen_ad_soyad
FROM bolumler b
JOIN dersler d ON b.bolum_id = (SELECT bolum_id FROM ogretmenler WHERE ogretmen_id = d.ogretmen_id)
JOIN ogretmenler ot ON d.ogretmen_id = ot.ogretmen_id
ORDER BY b.bolum_adi, d.ders_kodu;