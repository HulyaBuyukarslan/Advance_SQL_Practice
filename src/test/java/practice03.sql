---------- Practice 1 -----------
-- 1 den 100 e kadar 5 e tam bölünen sayıları yazınız.
do $$
declare
sayi numeric :=1;
begin
while sayi<=100 loop
if mod (sayi,5)=0 and mod (sayi,3)=0 then
	   raise notice '5 e tam bölünen sayılar : %', sayi;
 end if;
	   sayi := sayi+1;
end loop;
end $$;
---------- Practice 2 -----------
-- 1 den 100 e kadar 5 e  ve 3 e tam bölünen tek sayıları yazınız.
do $$
declare
sayi numeric :=1;
begin
while sayi<=100 loop
if mod(sayi,5)=0 and mod(sayi,3)=0 and mod(sayi,2)!=0 then
	   raise notice '5 e ve 3 e tam bölünen tek sayılar : %', sayi;
 end if;
	   sayi := sayi+1;
end loop;
end $$;

---------- Practice 3 -----------
-- 1 den 50 e kadar ardışık tek sayıları yazınız.
do $$
declare
ardisik_tek_sayi integer :=1;
begin
while ardisik_tek_sayi<50 loop
if mod(ardisik_tek_sayi,2) !=0  then
raise notice 'ardışık tek sayılar : %', ardisik_tek_sayi;
end if;
ardisik_tek_sayi :=ardisik_tek_sayi+1;
end loop;
end $$;


---------- Practice 4 -----------
-- 1 den 50 e kadar ardışık çift sayıları yazınız.
do $$
declare
ardisik_cift_sayi integer :=1;
begin
while ardisik_cift_sayi<50 loop
if mod(ardisik_cift_sayi,2) =0  then
raise notice 'ardışık çift sayılar : %', ardisik_cift_sayi;
end if;
ardisik_cift_sayi :=ardisik_cift_sayi+1;
end loop;
end $$;



---------- Practice 5 -----------
-- 1 den 50 e kadar olan asal sayıları yazınız.






---------- Practice 6 -----------
-- 1 den 10 a kadar olan sayıların karelerini yazınız.




