USE 20251009kcs;

-- a.Sz�rjunk be 2 �j alkalmazottat a t�bl�ba, akiknek a fizet�se legyen legfeljebb 1500$

INSERT INTO emp VALUES
(8000, 'LACI', 'IT', null, '2025-01-12', 1400, null, 10),
(8001, 'PETI', 'IT', 8000, '2025-10-12', 1300, null, 10);

SELECT * FROM emp;

-- b.M�dos�tsuk a t�bl�t �gy, hogy akinek a fizet�se nem, vagy �ppen el�ri a 1500$-t az kapjon 200$-os fizet�semel�st.

UPDATE emp -- t�bla neve
SET sal = sal + 200 -- oszlop neve, �j �rt�k. vagyis a r�gi �rt�khez adunk +200-as
WHERE sal <= 1500; -- ha nem �ri el az 1500 $

SELECT * FROM emp;

-- c. M�dos�tsuk �jra a t�bl�t, hogy akinek a fizet�se el�ri a 2200$-os fizet�st, az 500$-ral kevesebbet kapjon.

UPDATE emp
SET sal = sal - 500 -- teh�t az eredetib�l kivonjuk
WHERE sal >= 2200;

SELECT * FROM emp;

-- d.T�r�lj�k ki azokat a dolgoz�kat, akik az emel�s ut�n tov�bbra sem �rik el a 1600$-os fizet�st.

DELETE FROM emp
WHERE sal < 1600;

SELECT * FROM emp;