USE 20251009kcs;

-- a.Szúrjunk be 2 új alkalmazottat a táblába, akiknek a fizetése legyen legfeljebb 1500$

INSERT INTO emp VALUES
(8000, 'LACI', 'IT', null, '2025-01-12', 1400, null, 10),
(8001, 'PETI', 'IT', 8000, '2025-10-12', 1300, null, 10);

SELECT * FROM emp;

-- b.Módosítsuk a táblát úgy, hogy akinek a fizetése nem, vagy éppen eléri a 1500$-t az kapjon 200$-os fizetésemelést.

UPDATE emp -- tábla neve
SET sal = sal + 200 -- oszlop neve, új érték. vagyis a régi értékhez adunk +200-as
WHERE sal <= 1500; -- ha nem éri el az 1500 $

SELECT * FROM emp;

-- c. Módosítsuk újra a táblát, hogy akinek a fizetése eléri a 2200$-os fizetést, az 500$-ral kevesebbet kapjon.

UPDATE emp
SET sal = sal - 500 -- tehát az eredetibõl kivonjuk
WHERE sal >= 2200;

SELECT * FROM emp;

-- d.Töröljük ki azokat a dolgozókat, akik az emelés után továbbra sem érik el a 1600$-os fizetést.

DELETE FROM emp
WHERE sal < 1600;

SELECT * FROM emp;