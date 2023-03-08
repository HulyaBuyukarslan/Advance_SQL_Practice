CREATE TABLE kitaplar2
(
id int,
isim varchar(50),
yayınevi varchar(50),
sayfa_sayisi int,
tür varchar(50)
);

INSERT INTO kitaplar2 VALUES (1,'Memleketimden İnsan Manzaraları','YKY',537,'Şiir');
INSERT INTO kitaplar2 VALUES (2,'Masumiyet Müzesi','YKY',465,'Roman');
INSERT INTO kitaplar2 VALUES (3,'Hamlet','İş Bankası',188,'Tiyatro');
INSERT INTO kitaplar2 VALUES (4,'Çocuk Kalbi','İş Bankası',328,'Çocuk');
INSERT INTO kitaplar2 VALUES (5,'Bir Dinozorun Anıları','YKY',353,'Anı');

------------- Practice 1 -------------

do $$
declare
her_kitap_fiyati constant numeric := 99.99;

begin
raise notice 'Her kitabın fiyatı : % dur', her_kitap_fiyati;

--- her_kitap_fiyati :=120.99;

end $$;

----------- Practice 2 --------------
do $$
declare
başlama_ani constant time := now();

begin
raise notice 'Çalışma anı : %', başlama_ani;

end $$;


-------------- Practice 3 -------------
-- Huzursuzluk isimli kitabı bulalım eğer yoksa ekrana uyarı yazısı verelim
 do $$
 declare
 istenilen_kitap kitaplar2%rowtype;
 istenilen_kitapismi kitaplar2.isim%type := 'Huzursuzluk';

 begin
 	select * from kitaplar2
	where isim = istenilen_kitapismi
	into istenilen_kitap;

if not found then
	raise notice 'İstenilen isimde kitap yoktur : %', istenilen_kitapismi;
end if;

end $$;

------------- Practice 4 --------------
-- Hamlet isimli kitap varsa tür bilgisini yazınız yoksa uyarı yazısını ekrana basınız

do $$
declare
istenilen_kitap kitaplar2%rowtype;
istenilen_kitapismi kitaplar2.isim%type :='Hamlet';

begin

select * from kitaplar2
where isim = istenilen_kitapismi
into istenilen_kitap;

if not found then
raise notice 'İstenilen isimde kitap yoktur : %', istenilen_kitapismi;
else
raise notice 'İstenilen isimdeki kitabın türü : %', istenilen_kitap.tür;
end if;
end $$;


------------- Practice 5 --------------

/* Masumiyet Müzesi isimli bir kitap varsa;
   sayfa_sayisi 200'ün altında ise 'İnce',
   200<sayfa_sayisi<350 arasında ise 'Orta',
   sayfa_sayisi>350 den fazla ise 'Kalın' yazalım
*/

do $$
declare
istenilen_kitap kitaplar2%rowtype;
kitap_uzunluk varchar(50);

begin
select * from kitaplar2
where isim ='Masumiyet Müzesi'
into istenilen_kitap;

if not found then
raise notice 'İstediğiniz kitap bulunamadı';
else
    if istenilen_kitap.sayfa_sayisi>0 and istenilen_kitap.sayfa_sayisi<=200 then
    kitap_uzunluk = 'İnce';
	elseif istenilen_kitap.sayfa_sayisi>200 and istenilen_kitap.sayfa_sayisi<=350 then
	kitap_uzunluk = 'Orta';
	elseif istenilen_kitap.sayfa_sayisi>350 then
	kitap_uzunluk = 'Kalın';
	else
	kitap_uzunluk = 'Tanımlanamıyor';
	end if;
raise notice '% kitabının uzunlugu : %', istenilen_kitap.isim,kitap_uzunluk;
end if;
end $$;


----------- Practice 6 --------
-- Çocuk Kalbi kitabının türüne göre çocuklara uygun olup olmadığını ekrana yazalım.

do $$
declare
kitapturu kitaplar2.tür%type;
uyari varchar(50);

begin
select tür from kitaplar2
into kitapturu
where isim='Çocuk Kalbi';


begin
if found then
case kitapturu
	when 'Roman' then uyari='Çocuklar için uygun değildir';
	when 'Şiir' then uyari='Çocuklar için uygun değildir';
    when 'Anı' then uyari='Çocuklar için uygun değildir';
    when 'Tiyatro' then uyari='Çocuklar için uygun değildir';
    when 'Çocuk' then uyari='Çocuklar için uygundur';
else
   uyari ='Tanımlanamıyor';
end case;
raise notice '%', uyari;
end if;
end $$;





















