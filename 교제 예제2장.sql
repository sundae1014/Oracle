-----------------------------------------------------------------
-- 단일행 함수 --
-- 교재 p 71 
-- INITCAP() 함수 
SELECT ename, INITCAP(ename) "INITCAP"
    FROM emp
    WHERE deptno = 10;

-- 교재 p72 / LOWER / UPPER
SELECT ename, LOWER(ename) "LOWER", UPPER(ename) "UPPER"
    FROM emp
    WHERE deptno = 10;

-- 교재 p73 / LENGTH / LENGTHB
SELECT ename, LENGTH(ename) "LENGTH", LENGTHB(ename) "LENGTH"
    FROM emp
    WHERE deptno = 20;

SELECT '서진수' "NAME" , LENGTH('서진수') "LENGTH",
                        LENGTHB('서진수') "LENGTHB"
    FROM dual;

SET verify OFF
SELECT ename, LENGTH(ename)
    FROM emp
    WHERE LENGTH(ename) > LENGTH('&ename');

-- 교재 p74 / CONCAT
SELECT CONCAT(ename, job)
    FROM emp
    WHERE deptno = 10;

-- 교재 p75 / SUBSTR
























































