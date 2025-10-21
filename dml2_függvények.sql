USE 20251009kcs;


-- DML tov�bbi r�sze:

-- DISTINCT:

SELECT DISTINCT job FROM emp; -- DISTINCT: kiv�lasztott oszlopokb�l egyszer t�nj�n fel. ne legyen ism�tl�s: vagyis 1x fog megjelenni az osztlopba.

-- =================================

-- BETWEEN:
SELECT * FROM emp -- R�GI M�D
WHERE sal >= 1700 AND sal <= 2200;

SELECT * FROM emp
WHERE sal BETWEEN 1700 AND 2200; -- BETWEEN: tartom�ny tesztel�s, az adott tesztelend� �rt�k a k�t �rt�k k�z� esik-e.

-- =================================
-- LIKE: sz�vegen bel�li: 
-- LIKE �sz�%� -> sz�m, sz�m�t�g�p, sz�nk�, sz�rnyas�
-- �LIKE �v_r� ? v�r, v�r, ver�

SELECT * FROM emp
WHERE ename LIKE 'L%'; -- ename olyan mint akinek L bet�vel kezd�dik a neve

-- tagad�sa:
SELECT * FROM emp
WHERE ename NOT LIKE 'L_CI'; -- ename nem olyan mint akinek L_CI bet�vel kezd�dik a neve


SELECT * FROM emp
WHERE ename LIKE 'L_C%';-- ename olyan mint akinek L_C bet�vel kezd�dik a neve

-- =================================
SELECT * FROM emp
WHERE comm = 0 OR comm IS /*NOT*/ NULL;

-- =================================
SELECT * FROM emp
WHERE job = 'IT' OR job = 'SALESMAN';

SELECT * FROM emp
WHERE job IN ('IT', 'SALESMAN');

-- =================================
SELECT AVG(sal) AS AtlagFizetes FROM emp;
SELECT COUNT(*) AS Db FROM emp;
SELECT MIN(sal) AS MinFizetes FROM emp;
SELECT MAX(sal) AS MaxFizetes FROM emp;
SELECT SUM(sal) AS FizetesOsszeg FROM emp;

-- =================================
SELECT * FROM emp
WHERE sal > (
  SELECT AVG(sal) FROM emp
);

-- =================================
SELECT * FROM emp
WHERE job <> 'MANAGER' AND sal IN (
  SELECT sal FROM emp
  WHERE job = 'MANAGER'
);

SELECT * FROM emp
WHERE hiredate < ALL (
  SELECT hiredate FROM emp
  WHERE job = 'MANAGER'
);

SELECT * FROM emp
WHERE hiredate < (
  SELECT MIN(hiredate) FROM emp
  WHERE job = 'MANAGER'
);

SELECT * FROM emp
WHERE sal > ANY (
  SELECT sal FROM emp
  WHERE job = 'SALESMAN'
);

SELECT * FROM emp
WHERE sal > (
  SELECT MIN(sal) FROM emp
  WHERE job = 'SALESMAN'
);