USE 20251009kcs;

-- gyakorlás: DML további részét(dml2):

-- a.Milyen(distinct) részlegeken dolgoznak az emberek? Csak az azonosítót adjuk meg!

SELECT DISTINCT deptno FROM emp; -- 

-- b.Ki az, aki nem kap fizetésen felüli juttatást?

SELECT * FROM emp
WHERE comm = 0 OR comm IS /*NOT*/ NULL;

-- c.Akinek a nevében van ‚N’ betû

SELECT * FROM emp
WHERE ename LIKE '%N%'; -- ahol az ename olyan amiben van N betû(bármennyi bármilyen karakter)

-- d.Akinek a fizetése 1800$ és 2600$ között van.

SELECT * FROM emp
WHERE sal BETWEEN 1800 AND 2600; -- sal közép esik az 1800-nak és 2600

-- e.Aki vagy CLERK, vagy SALESMAN, vagy PRESIDENT

SELECT * FROM emp
WHERE job IN ('CLERK', 'SALESMAN', 'PRESIDENT'); -- aki benne van a halmazba(...)

-- f.Akinek a munkájában van ‚E’ betû, és nem kap juttatást, és a fizetése pedig 4000$ és 6000$ közé esik.

SELECT * FROM emp
WHERE (job LIKE '%E%') AND (comm = 0 OR comm IS NULL) AND (sal BETWEEN 4000 AND 6000);