USE 20251009kcs;

-- Allekérdezések: 
    -- Bizonyos esetekben a rekordhalmaz kiválasztásánál, más rekordhalmazból kiszámolt értékek alapján szeretnénk kiválasztani.
-- Skalár visszatérésû allekérdezések:Szabványosan:
-- …WHERE <oszlop> =,<>,<,>,>=,<= (<lekérdezés>)…
-- <függvény>(…,(<lekérdezés>),..)



-- a.Válasszuk ki az összes olyan dolgozót, akinek KING a fõnöke.

SELECT * FROM emp
WHERE mgr = ( -- kint a fõnök
  SELECT empno FROM emp 
  WHERE ename = 'KING'
);

-- b.Válasszuk ki az összes olyan dolgozót, akinek a juttatása nagyobb mint ALLEN-é.

SELECT * FROM emp
WHERE comm > ( -- fizetésen felüli juttatás
  SELECT comm FROM emp
  WHERE ename = 'ALLEN'
);

-- c.Válasszuk ki az összes olyan dolgozót, aki többet keres, mint az összes olyan dolgozó, akit 1982-ben vettünk fel.

SELECT * FROM emp -- az össze ilyen dolgozót.
WHERE sal > ALL ( -- neki a fizuja
  SELECT sal FROM emp  -- 1982-vel vettek fel
  WHERE YEAR(hiredate) = 1982
);

-- d.Válasszuk ki az összes olyan dolgozót, aki a RESEARCH osztályon dolgozik.

SELECT * FROM emp
WHERE deptno = (
  SELECT deptno FROM dept --
  WHERE dname = 'RESEARCH'
);

-- e.Kérdezzük le az összes olyan dolgozót, aki többet keres, mint bármelyik a PRESIDENT alá közvetlen beosztott ember.

/*õk az összes olyan dolgozók.*/SELECT * FROM emp -- õ alé
WHERE sal > ANY ( -- de csak azokat, akinek megegyezik az allekérdezésben
 /*president alatt dolgozók-azonosítóval*/ SELECT sal FROM emp -- lekérdezzük azokat akik a president alatt dolgoznak közvetlen
  WHERE mgr = ( -- akik többet keresnek bármelyik az allekérdezés allekérdés után.
  /*president azonosítója*/  SELECT empno FROM emp
    WHERE job = 'PRESIDENT'
  )
);