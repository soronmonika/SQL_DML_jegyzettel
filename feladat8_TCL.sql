USE 20251009kcs;

-- a.
START TRANSACTION; -- START TRANSACTION: kiindul�si allapot 
-- 
INSERT INTO emp VALUES
(8001, 'REKA', 'IT', 8000, '2025-10-14', 1400, null, 10);

-- b.
UPDATE emp
SET sal = sal + 200
WHERE empno = 8001;

-- c.
COMMIT; -- Minden eggyes DDL m�velet aut�matikus COMMIT-ot von maga ut�n: 

SELECT * FROM emp;

-- d.
START TRANSACTION;

UPDATE emp
SET sal = sal + 200
WHERE empno = 8001;

-- e.
ROLLBACK;

SELECT * FROM emp;
