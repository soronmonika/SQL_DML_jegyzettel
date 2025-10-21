-- DML - adatkezelõ nyelv. adatmanipuláció: CRUD(Create: adatot (magukba)létrehozni/tárolni), Read(Adatot felolvasni/visszaadni), Update(Adatot frissíteni), Delete(Adatot törölni)) jelzõ. 
-- SELECT: nem biztos, hogy m inden adatot látni szeretnék, emiatt ezzel tudjuk szûrni.



USE 20251009kcs;

-- Lekerdezesek
SELECT deptno, dname, loc -- mindegyik oszlopot látni szeretném, ezért felsorolom
FROM dept; -- ezek oszlopokból melyik táblára vagyok kiváncsi

SELECT * -- (*) az összes oszlopot a tábláról megfogja jeleníteni
FROM emp; -- az emp-tbõl


-- Mutasd meg az összes doglozót, aki a 30-as osztályon dolgozik ÉS a fizetése több mint 1000 $
SELECT *
FROM emp -- emp(employee) nevû táblából  kérdezem le az adatokat.
WHERE sal > 1000 AND deptno = 30; -- WHERE: ez a feltétel. vagyis csak azokat mutatja meg, amelyekre igaz: 
-- sal > 1000 -> a fizetés 1000-nél nagyobb || AND deptno=30-> részleg


-- Mutasd meg azoknak a nevét, fizetésést, és munaköréz, akik vagy 1000-nél többet keresnek, vagy a 30-as osztályon dolgoznak. Itt elég ha csak az egyik feltétel igaz. 
SELECT ename, sal, job -- csak a nevet, fizetést, és a munkakört kérem le.
FROM emp -- emp táblából. 
WHERE sal > 1000 OR deptno = 30; -- fizetés nagyobb mint ezer VAGY a 30-as osztályon dolgoznak.


-- Sorba rendezés: ASC- növekvõ rendezés (alapértelmezett)|| DESC-csökkenõ || hiredate - legrégebbi dolgozó
SELECT *
FROM emp
ORDER BY job DESC, sal /*ASC*/;

SELECT *
FROM emp
-- WHERE sal > 1000
ORDER BY job DESC, sal /*ASC*/;


-- összevont feltétel
SELECT job AS munkakor, MIN(sal) AS minSal, MAX(sal) AS maxSal, AVG(sal) AS avgSal, COUNT(*) AS db, SUM(sal) AS sum 
-- *-ot érdemes nem használni. - job: ami mentén csoportosítunk, utána jöhetnek a függvények. összesítõ függvények: több adatból fognak vissza adni egyet.
FROM emp
WHERE sal > 1000 -- ezzel a feltétellel a csoportosítás elõtti állapoton tudok szûrni, ezáltal szûrt adatok fognak megjelenni
GROUP BY job -- munkakör szerinti csoportosítás.
HAVING db > 2; -- a HAVING-el csoportosítás utáni állapotra tudok szûrni



CREATE TABLE lekerdezesTabla AS -- DML parancs: egy új lekérdezés tábla 
  SELECT job, MIN(sal), MAX(sal), AVG(sal), COUNT(*), SUM(sal)
  FROM emp
  WHERE sal > 1000
  GROUP BY job
  HAVING COUNT(*) > 2; -- csak azok a csoportok jelenjenek meg, ahol 2-nél több ember van. 

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
ORDER BY sal DESC -- legeket akarok keresni. legtöbbet keresik a cégnél tehát a fizetés szerint csökkentõbe állítom, és limitálok 3-ra.
LIMIT 3; -- maximális rekordszám 



-- Adatfelvitel: INSERT segítségével hozzá tudjuk adni az új rekordot az adott táblához.VALUES: értéke
INSERT INTO emp VALUES 
(8000, 'LAJOS', 'IT', null, '2014-05-17', 1500, null, 10), -- az új osztlop értékei vesszõvel.
(8001, 'PETI', 'IT', 8000, '2023-08-19', 1200, 100, 10);

INSERT INTO emp(empno, ename, job, mgr, hiredate, sal) VALUES -- ebben az esetben nem feltétlenül minden osztlopot akarunk megadni, és a sorrendet is mi szabjuk meg.
(8002, 'REKA', 'IT', 8000, '2017-11-14', 1400),
(8003, 'EVA', 'IT', 8000, '2016-01-17', 1400);

-- Adatmodositas. Segítségével módosítani tudunk a meglévõ rekordok attribútomainak értékein.
UPDATE emp -- tábla neve
SET comm = 200, deptno = 10 -- oszlop neve = új érték, oszlop neve 2=új érték2
WHERE empno = 8003; -- a megadott lokiai feltételnek eleget tevõ rekordok módosítása a táblába. 

-- Adattorles
DELETE FROM emp -- törli az összes rekordot az adott táblából
WHERE empno >= 8000; -- törli az összes olyan rekordot, ami teljesíti a feltételt. 

SELECT *
FROM emp;