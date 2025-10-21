USE 20251009kcs;

-- a.Mennyit keresnek �tlagosan azok a dolgoz�k, akik a 30. oszt�lyon dolgoznak?

SELECT AVG(sal) AS AtlagFizu FROM emp
WHERE deptno = 30;

-- b.Mennyit keres a legkevesebbet keres� a c�gn�l azok k�z�l, akiknek a nev�ben van �A� bet�?

SELECT MIN(sal) AS MinimumFizu FROM emp
WHERE ename LIKE '%A%';

-- c.Mennyit keres a legt�bbet keres� a 2000$ �s a 3000$ k�z�tt keres�k k�z�l?

SELECT MAX(sal) AS MaxFizu FROM emp
WHERE sal BETWEEN 2000 AND 3000;

-- d.H�ny olyan ember van, akinek a fizet�se plusz a juttat�sa nagyobb mint 3000$?

SELECT COUNT(*) FROM emp
WHERE (comm IS NOT NULL AND sal + comm > 3000) OR (comm IS NULL AND sal > 3000);
-- ahol a com nem null �s osszesen 3000 vagy ahol aahol a comm null nagyobb mint 3000 <- ezeknek kell a db sz�ma

-- e.
SELECT deptno, AVG(sal) AS AtlagFizu -- r�szleg, �tlagfizu
FROM emp -- emp t�bl�b�l
GROUP BY deptno -- csoportos�t�s deptno szerint
ORDER BY AtlagFizu DESC; -- ezek alapj�n rendezz�k cs�kken� sorrendbe a fizet�s szerint