USE 20251009kcs;

-- gyakorl�s: DML tov�bbi r�sz�t(dml2):

-- a.Milyen(distinct) r�szlegeken dolgoznak az emberek? Csak az azonos�t�t adjuk meg!

SELECT DISTINCT deptno FROM emp; -- 

-- b.Ki az, aki nem kap fizet�sen fel�li juttat�st?

SELECT * FROM emp
WHERE comm = 0 OR comm IS /*NOT*/ NULL;

-- c.Akinek a nev�ben van �N� bet�

SELECT * FROM emp
WHERE ename LIKE '%N%'; -- ahol az ename olyan amiben van N bet�(b�rmennyi b�rmilyen karakter)

-- d.Akinek a fizet�se 1800$ �s 2600$ k�z�tt van.

SELECT * FROM emp
WHERE sal BETWEEN 1800 AND 2600; -- sal k�z�p esik az 1800-nak �s 2600

-- e.Aki vagy CLERK, vagy SALESMAN, vagy PRESIDENT

SELECT * FROM emp
WHERE job IN ('CLERK', 'SALESMAN', 'PRESIDENT'); -- aki benne van a halmazba(...)

-- f.Akinek a munk�j�ban van �E� bet�, �s nem kap juttat�st, �s a fizet�se pedig 4000$ �s 6000$ k�z� esik.

SELECT * FROM emp
WHERE (job LIKE '%E%') AND (comm = 0 OR comm IS NULL) AND (sal BETWEEN 4000 AND 6000);