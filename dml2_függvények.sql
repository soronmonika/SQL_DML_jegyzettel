USE 20251009kcs;


-- DML további része:

-- DISTINCT:

SELECT DISTINCT job FROM emp; -- DISTINCT: kiválasztott oszlopokból egyszer tûnjön fel. ne legyen ismétlés: vagyis 1x fog megjelenni az osztlopba.

-- =================================

-- BETWEEN:
SELECT * FROM emp -- RÉGI MÓD
WHERE sal >= 1700 AND sal <= 2200;

SELECT * FROM emp
WHERE sal BETWEEN 1700 AND 2200; -- BETWEEN: tartomány tesztelés, az adott tesztelendõ érték a két érték közé esik-e.

-- =================================
-- LIKE: szövegen belüli: 
-- LIKE ’szá%’ -> szám, számítógép, szánkó, szárnyas…
-- …LIKE ’v_r’ ? vár, vér, ver…

SELECT * FROM emp
WHERE ename LIKE 'L%'; -- ename olyan mint akinek L betûvel kezdõdik a neve

-- tagadása:
SELECT * FROM emp
WHERE ename NOT LIKE 'L_CI'; -- ename nem olyan mint akinek L_CI betûvel kezdõdik a neve


SELECT * FROM emp
WHERE ename LIKE 'L_C%';-- ename olyan mint akinek L_C betûvel kezdõdik a neve

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