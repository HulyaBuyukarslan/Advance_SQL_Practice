CREATE TABLE kitaplar
(
id int,
isim varchar(50),
yayınevi varchar(50),
sayfa_sayisi int
);

INSERT INTO kitaplar VALUES (1,'Huzur','Dergah',419);
INSERT INTO kitaplar VALUES (2,'Masumiyet Müzesi','YKY',465);
INSERT INTO kitaplar VALUES (3,'Yalnızız','Ötüken',416);
INSERT INTO kitaplar VALUES (4,'Kırmalı Etekler','Kapı',342);
INSERT INTO kitaplar VALUES (5,'Kuşlar Yasına Gider','Everest',250);

CREATE TABLE yazarlar
(id int,
 isim varchar(50),
 soyisim varchar(50)
 );

 INSERT INTO yazarlar VALUES (1,'Ahmet Hamdi','Tanpınar');
 INSERT INTO yazarlar VALUES (2,'Orhan','Pamuk');
 INSERT INTO yazarlar VALUES (3,'Peyami','Safa');
 INSERT INTO yazarlar VALUES (4,'Sevinç','Çokum');
 INSERT INTO yazarlar VALUES (5,'Hasan Ali','Toptaş');

 ---------- Practice 1 --------------
 do $$
 declare
 kitap_count integer :=0;

 begin
 select count(*)
 from kitaplar
 into kitap_count;
 raise notice 'Tablomdaki kitap sayisi % dir', kitap_count;
 end $$;

------------ Practice 2 --------------
do $$
declare
counter integer :=3;
isim1 varchar(50) :='Huzur';
isim2 varchar (50) :='Masumiyet Müzesi';
isim3 varchar (50) :='Yalnızız';

begin
raise notice 'En sevdiğim ilk % kitap %, % ve % kitaplarıdır',
    counter,
    isim1,
    isim2,
    isim3;
end $$;


--------------- Practice 3--------------------

do $$
declare
created_at time := now ();
begin
raise notice '%', created_at;
perform pg_sleep(10);
raise notice '%', created_at;
end $$;

----------------- Practice 4 --------------------
do $$
declare
kitap_yayınevi kitaplar.yayınevi%type ;

begin
select yayınevi
from kitaplar
into kitap_yayınevi
where id=3;

raise notice 'Id si 3 olan kitabın yayınevi % dir', kitap_yayınevi;
end $$;


---------------- Practice 5 ----------------
do $$
<<outher_block>>
declare
kitap_ismi varchar(50) :='';

begin
select isim
from kitaplar
into kitap_ismi
where id=4;

raise notice 'Id si 4 olan kitabın ismi % dir', kitap_ismi;

declare
yazar_ismi varchar (50) :='';
yazar_soyismi varchar (50) :='';

begin
select isim, soyisim
from yazarlar
into yazar_ismi, yazar_soyismi
where id= 4;

raise notice 'Kitabın yazarı % % dur', yazar_ismi, yazar_soyismi;

end;
end outher_block $$;


------------------ Practice 6 ----------------------
do $$
declare
kitap_tumbilgisi kitaplar%rowtype;
begin
select *
from kitaplar
into kitap_tumbilgisi
where id = 5;

raise notice 'Kitabın bilgileri : % , % yayınları , % sayfa',
				kitap_tumbilgisi.isim,
				kitap_tumbilgisi.yayınevi,
				kitap_tumbilgisi.sayfa_sayisi;

end $$;


--------------------- Practice 7 -----------------------------
do $$
declare
kitap_bazibilgiler record;

begin
select isim, sayfa_sayisi
from kitaplar
into kitap_bazibilgiler
where id = 2;

raise notice 'İstediğim kitap % dir, sayfa sayisi % dir',
			kitap_bazibilgiler.isim,
			kitap_bazibilgiler.sayfa_sayisi;
end $$;




























