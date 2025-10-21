-- DML - adatkezel� nyelv. adatmanipul�ci�: CRUD(Create: adatot (magukba)l�trehozni/t�rolni), Read(Adatot felolvasni/visszaadni), Update(Adatot friss�teni), Delete(Adatot t�r�lni)) jelz�. 
-- SELECT: nem biztos, hogy m inden adatot l�tni szeretn�k, emiatt ezzel tudjuk sz�rni.



USE 20251009kcs;

-- Lekerdezesek
SELECT deptno, dname, loc -- mindegyik oszlopot l�tni szeretn�m, ez�rt felsorolom
FROM dept; -- ezek oszlopokb�l melyik t�bl�ra vagyok kiv�ncsi

SELECT * -- (*) az �sszes oszlopot a t�bl�r�l megfogja jelen�teni
FROM emp; -- az emp-tb�l


-- Mutasd meg az �sszes dogloz�t, aki a 30-as oszt�lyon dolgozik �S a fizet�se t�bb mint 1000 $
SELECT *
FROM emp -- emp(employee) nev� t�bl�b�l  k�rdezem le az adatokat.
WHERE sal > 1000 AND deptno = 30; -- WHERE: ez a felt�tel. vagyis csak azokat mutatja meg, amelyekre igaz: 
-- sal > 1000 -> a fizet�s 1000-n�l nagyobb || AND deptno=30-> r�szleg


-- Mutasd meg azoknak a nev�t, fizet�s�st, �s munak�r�z, akik vagy 1000-n�l t�bbet keresnek, vagy a 30-as oszt�lyon dolgoznak. Itt el�g ha csak az egyik felt�tel igaz. 
SELECT ename, sal, job -- csak a nevet, fizet�st, �s a munkak�rt k�rem le.
FROM emp -- emp t�bl�b�l. 
WHERE sal > 1000 OR deptno = 30; -- fizet�s nagyobb mint ezer VAGY a 30-as oszt�lyon dolgoznak.


-- Sorba rendez�s: ASC- n�vekv� rendez�s (alap�rtelmezett)|| DESC-cs�kken� || hiredate - legr�gebbi dolgoz�
SELECT *
FROM emp
ORDER BY job DESC, sal /*ASC*/;

SELECT *
FROM emp
-- WHERE sal > 1000
ORDER BY job DESC, sal /*ASC*/;


-- �sszevont felt�tel
SELECT job AS munkakor, MIN(sal) AS minSal, MAX(sal) AS maxSal, AVG(sal) AS avgSal, COUNT(*) AS db, SUM(sal) AS sum 
-- *-ot �rdemes nem haszn�lni. - job: ami ment�n csoportos�tunk, ut�na j�hetnek a f�ggv�nyek. �sszes�t� f�ggv�nyek: t�bb adatb�l fognak vissza adni egyet.
FROM emp
WHERE sal > 1000 -- ezzel a felt�tellel a csoportos�t�s el�tti �llapoton tudok sz�rni, ez�ltal sz�rt adatok fognak megjelenni
GROUP BY job -- munkak�r szerinti csoportos�t�s.
HAVING db > 2; -- a HAVING-el csoportos�t�s ut�ni �llapotra tudok sz�rni



CREATE TABLE lekerdezesTabla AS -- DML parancs: egy �j lek�rdez�s t�bla 
  SELECT job, MIN(sal), MAX(sal), AVG(sal), COUNT(*), SUM(sal)
  FROM emp
  WHERE sal > 1000
  GROUP BY job
  HAVING COUNT(*) > 2; -- csak azok a csoportok jelenjenek meg, ahol 2-n�l t�bb ember van. 

CREATE VIEW lekerdezesTablaView AS
  SELECT job, MIN(sal), MAX(sal), AVG(sal), COUNT(*), SUM(sal)
  FROM emp
  WHERE sal > 1000
  GROUP BY job
  HAVING COUNT(*) > 2;

SELECT * FROM lekerdezesTabla; -- 
SELECT * FROM lekerdezesTablaView;


-- 
SELECT *
FROM emp
ORDER BY sal DESC -- legeket akarok keresni. legt�bbet keresik a c�gn�l teh�t a fizet�s szerint cs�kkent�be �ll�tom, �s limit�lok 3-ra.
LIMIT 3; -- maxim�lis rekordsz�m 



-- Adatfelvitel: INSERT seg�ts�g�vel hozz� tudjuk adni az �j rekordot az adott t�bl�hoz.VALUES: �rt�ke
INSERT INTO emp VALUES 
(8000, 'LAJOS', 'IT', null, '2014-05-17', 1500, null, 10), -- az �j osztlop �rt�kei vessz�vel.
(8001, 'PETI', 'IT', 8000, '2023-08-19', 1200, 100, 10);

INSERT INTO emp(empno, ename, job, mgr, hiredate, sal) VALUES -- ebben az esetben nem felt�tlen�l minden osztlopot akarunk megadni, �s a sorrendet is mi szabjuk meg.
(8002, 'REKA', 'IT', 8000, '2017-11-14', 1400),
(8003, 'EVA', 'IT', 8000, '2016-01-17', 1400);

-- Adatmodositas. Seg�ts�g�vel m�dos�tani tudunk a megl�v� rekordok attrib�tomainak �rt�kein.
UPDATE emp -- t�bla neve
SET comm = 200, deptno = 10 -- oszlop neve = �j �rt�k, oszlop neve 2=�j �rt�k2
WHERE empno = 8003; -- a megadott lokiai felt�telnek eleget tev� rekordok m�dos�t�sa a t�bl�ba. 

-- Adattorles
DELETE FROM emp -- t�rli az �sszes rekordot az adott t�bl�b�l
WHERE empno >= 8000; -- t�rli az �sszes olyan rekordot, ami teljes�ti a felt�telt. 

SELECT *
FROM emp;