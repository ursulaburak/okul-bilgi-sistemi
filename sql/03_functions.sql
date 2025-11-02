-- Harf notu hesaplama fonksiyonu
CREATE OR REPLACE FUNCTION fn_harf_notu_hesapla(
    vize NUMERIC, 
    final NUMERIC
) 
RETURNS VARCHAR(2)
LANGUAGE plpgsql
AS $$
DECLARE
    ortalama NUMERIC;
    harf_notu VARCHAR(2);
BEGIN
    -- Ortalama hesapla
    ortalama := (vize * 0.4) + (final * 0.6);
    
    -- Harf notunu belirle
    IF ortalama >= 90 THEN
        harf_notu := 'AA';
    ELSIF ortalama >= 85 THEN
        harf_notu := 'BA';
    ELSIF ortalama >= 80 THEN
        harf_notu := 'BB';
    ELSIF ortalama >= 75 THEN
        harf_notu := 'CB';
    ELSIF ortalama >= 70 THEN
        harf_notu := 'CC';
    ELSIF ortalama >= 65 THEN
        harf_notu := 'DC';
    ELSIF ortalama >= 60 THEN
        harf_notu := 'DD';
    ELSIF ortalama >= 50 THEN
        harf_notu := 'FD';
    ELSE
        harf_notu := 'FF';
    END IF;
    
    RETURN harf_notu;
END;
$$;

-- Ders geçme durumu fonksiyonu
CREATE OR REPLACE FUNCTION fn_ders_gecme_durumu(
    vize NUMERIC, 
    final NUMERIC
) 
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
    ortalama NUMERIC;
    durum TEXT;
BEGIN
    -- Ortalama hesapla
    ortalama := (vize * 0.4) + (final * 0.6);
    
    -- Geçme durumunu belirle
    IF ortalama >= 50 AND final >= 45 THEN
        durum := 'Geçti';
    ELSE
        durum := 'Kaldı';
    END IF;
    
    RETURN durum;
END;
$$;

-- Öğrenci derse kayıt prosedürü
CREATE OR REPLACE PROCEDURE sp_ogrenci_derse_kayit(
    p_ogrenci_id INT,
    p_ders_id INT,
    p_yil INT,
    p_donem VARCHAR
)
LANGUAGE plpgsql
AS $$
DECLARE
    kayit_sayisi INT;
BEGIN
    -- Öğrencinin bu dersi daha önce alıp almadığını kontrol et
    SELECT COUNT(*) INTO kayit_sayisi
    FROM ogrenci_dersleri
    WHERE ogrenci_id = p_ogrenci_id 
    AND ders_id = p_ders_id 
    AND yil = p_yil 
    AND donem = p_donem;
    
    IF kayit_sayisi > 0 THEN
        RAISE EXCEPTION 'Öğrenci bu dersi % % döneminde zaten almış', p_yil, p_donem;
    END IF;
    
    -- Yeni kayıt ekle
    INSERT INTO ogrenci_dersleri (ogrenci_id, ders_id, yil, donem)
    VALUES (p_ogrenci_id, p_ders_id, p_yil, p_donem);
    
    RAISE NOTICE 'Öğrenci başarıyla derse kaydedildi';
END;
$$;

-- Not girişi prosedürü
CREATE OR REPLACE PROCEDURE sp_not_girisi(
    p_kayit_id INT,
    p_vize NUMERIC,
    p_final NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Notların geçerliliğini kontrol et
    IF p_vize < 0 OR p_vize > 100 OR p_final < 0 OR p_final > 100 THEN
        RAISE EXCEPTION 'Notlar 0-100 aralığında olmalıdır';
    END IF;
    
    -- Notları güncelle
    UPDATE ogrenci_dersleri 
    SET vize_notu = p_vize, final_notu = p_final
    WHERE kayit_id = p_kayit_id;
    
    IF NOT FOUND THEN
        RAISE EXCEPTION 'Belirtilen kayıt ID bulunamadı: %', p_kayit_id;
    END IF;
    
    RAISE NOTICE 'Notlar başarıyla güncellendi';
END;
$$;