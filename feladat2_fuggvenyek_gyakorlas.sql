USE 20251009kcs;

-- a.Mennyit keresnek átlagosan azok a dolgozók, akik a 30. osztályon dolgoznak?

SELECT AVG(sal) AS AtlagFizu FROM emp
WHERE deptno = 30;

-- b.Mennyit keres a legkevesebbet keresõ a cégnél azok közül, akiknek a nevében van ‚A’ betû?

SELECT MIN(sal) AS MinimumFizu FROM emp
WHERE ename LIKE '%A%';

-- c.Mennyit keres a legtöbbet keresõ a 2000$ és a 3000$ között keresõk közül?

SELECT MAX(sal) AS MaxFizu FROM emp
WHERE sal BETWEEN 2000 AND 3000;

-- d.Hány olyan ember van, akinek a fizetése plusz a juttatása nagyobb mint 3000$?

SELECT COUNT(*) FROM emp
WHERE (comm IS NOT NULL AND sal + comm > 3000) OR (comm IS NULL AND sal > 3000);
-- ahol a com nem null és osszesen 3000 vagy ahol aahol a comm null nagyobb mint 3000 <- ezeknek kell a db száma

-- e.
SELECT deptno, AVG(sal) AS AtlagFizu -- részleg, átlagfizu
FROM emp -- emp táblából
GROUP BY deptno -- csoportosítás deptno szerint
ORDER BY AtlagFizu DESC; -- ezek alapján rendezzük csökkenõ sorrendbe a fizetés szerint