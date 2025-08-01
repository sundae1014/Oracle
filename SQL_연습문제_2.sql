/*
    날짜 : 2025/07/21
    이름 : 정순권
    내용 : ORACLE TEST 2
*/

-- 실습 2-1
/*
〉 ALTER SESSION SET "_ORACLE_SCRIPT"=true;
〉 CREATE USER college IDENTIFIED BY 1234;
〉 GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO college;
*/

-- 실습 2-2
CREATE TABLE Student(
    stdNo    CHAR(8) NOT NULL PRIMARY KEY,
    Name     VARCHAR2(20) NOT NULL,
    Birth    DATE NOT NULL,
    Major    VARCHAR2(20) DEFAULT NULL,
    ENR_DATE DATE NOT NULL
);



CREATE TABLE Course(
    CS_ID NUMBER (4) NOT NULL PRIMARY KEY,
    CS_NAME VARCHAR2(40) NOT NULL,
    CS_Credit NUMBER(1) NOT NULL,
    CS_DEPT VARCHAR2(40) NOT NULL
);

CREATE TABLE Enrollment(
    ENR_NO NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    ENR_STDNO CHAR(8) NOT NULL,
    ENR_CSID NUMBER(4) DEFAULT NULL,
    MID_SCORE NUMBER DEFAULT NULL,
    FINAL_SCORE NUMBER DEFAULT NULL,
    TOTAL_SCORE NUMBER DEFAULT NULL,
    GRADE CHAR(1) DEFAULT NULL
);

-- 실습 2-3
INSERT INTO STUDENT VALUES ('20121016', '김유신', '1991-01-13', '국문학과', '2012-02-01');
INSERT INTO STUDENT VALUES ('20111126', '김춘추', '1992-04-11', '경제학과', '2011-02-01');
INSERT INTO STUDENT VALUES ('20100216', '장보고', '1991-05-23', '컴퓨터학과', '2010-02-01');
INSERT INTO STUDENT VALUES ('20120326', '강감찬', '1991-02-09', '영문학과', '2012-02-01');
INSERT INTO STUDENT VALUES ('20130416', '이순신', '1992-11-30', '경영학과', '2012-02-01');
INSERT INTO STUDENT VALUES ('20110521', '송상현', '1992-07-17', '컴퓨터학과', '2011-02-01');

INSERT INTO COURSE VALUES ('1059', '고전문학', 3, '국문학과');
INSERT INTO COURSE VALUES ('2312', '데이터베이스', 3, '컴퓨터학과');
INSERT INTO COURSE VALUES ('1203', 'Easy Writing', 3, '영문학과');
INSERT INTO COURSE VALUES ('2039', '글로벌경제학', 3, '경제학과');
INSERT INTO COURSE VALUES ('2301', '프로그래밍언어', 3, '컴퓨터학과');
INSERT INTO COURSE VALUES ('2303', '컴퓨터과학개론', 2, '컴퓨터학과');
INSERT INTO COURSE VALUES ('3012', '마케팅 전략', 2, '경영학과');

INSERT INTO ENROLLMENT (ENR_STDNO, ENR_CSID)VALUES ('20111126', 1203);
INSERT INTO ENROLLMENT (ENR_STDNO, ENR_CSID)VALUES ('20121016', 2301);
INSERT INTO ENROLLMENT (ENR_STDNO, ENR_CSID)VALUES ('20121016', 2303);
INSERT INTO ENROLLMENT (ENR_STDNO, ENR_CSID)VALUES ('20111126', 2039);
INSERT INTO ENROLLMENT (ENR_STDNO, ENR_CSID)VALUES ('20100216', 3012);
INSERT INTO ENROLLMENT (ENR_STDNO, ENR_CSID)VALUES ('20120326', 3012);
INSERT INTO ENROLLMENT (ENR_STDNO, ENR_CSID)VALUES ('20121016', 2312);
INSERT INTO ENROLLMENT (ENR_STDNO, ENR_CSID)VALUES ('20130416', 3012);

-- 실습 2-4
SELECT * FROM STUDENT
    WHERE MAJOR = '컴퓨터학과';
    
-- 실습 2-5
SELECT * FROM COURSE
    WHERE CS_DEPT = '컴퓨터학과';

-- 실습 2-6
SELECT * FROM ENROLLMENT
    WHERE ENR_STDNO = '20121016';

-- 실습 2-7
SELECT NAME, MAJOR, ENR_DATE 
    FROM STUDENT
    WHERE MAJOR = '국문학과';

-- 실습 2-8
SELECT * FROM COURSE
    WHERE CS_CREDIT = 2 AND CS_DEPT = '컴퓨터학과';

-- 실습 2-9
SELECT STDNO, NAME, BIRTH 
    FROM STUDENT
    WHERE BIRTH >= '1992-01-01';

-- 실습 2-10
UPDATE ENROLLMENT SET MID_SCORE = 36, FINAL_SCORE = 42
    WHERE ENR_STDNO = '20111126' AND ENR_CSID = 1203;
UPDATE ENROLLMENT SET MID_SCORE = 24, FINAL_SCORE = 62
    WHERE ENR_STDNO = '20121016' AND ENR_CSID = 2301;
UPDATE ENROLLMENT SET MID_SCORE = 28, FINAL_SCORE = 40
    WHERE ENR_STDNO = '20121016' AND ENR_CSID = 2303;
UPDATE ENROLLMENT SET MID_SCORE = 37, FINAL_SCORE = 57
    WHERE ENR_STDNO = '20111126' AND ENR_CSID = 2039;
UPDATE ENROLLMENT SET MID_SCORE = 28, FINAL_SCORE = 68
    WHERE ENR_STDNO = '20100216' AND ENR_CSID = 3012;
UPDATE ENROLLMENT SET MID_SCORE = 16, FINAL_SCORE = 65
    WHERE ENR_STDNO = '20120326' AND ENR_CSID = 3012;
UPDATE ENROLLMENT SET MID_SCORE = 18, FINAL_SCORE = 38
    WHERE ENR_STDNO = '20121016' AND ENR_CSID = 2312;
UPDATE ENROLLMENT SET MID_SCORE = 25, FINAL_SCORE = 58
    WHERE ENR_STDNO = '20130416' AND ENR_CSID = 3012;
    
SELECT * FROM ENROLLMENT;

-- 실습 2-11
UPDATE ENROLLMENT SET
    TOTAL_SCORE = MID_SCORE + FINAL_SCORE,
    GRADE = CASE
                WHEN (MID_SCORE + FINAL_SCORE) >= 90 THEN 'A'
                WHEN (MID_SCORE + FINAL_SCORE) >= 80 THEN 'B'
                WHEN (MID_SCORE + FINAL_SCORE) >= 70 THEN 'C'
                WHEN (MID_SCORE + FINAL_SCORE) >= 60 THEN 'D'
                ELSE 'F'
            END;

SELECT * FROM ENROLLMENT;

-- 실습 2-12
SELECT * FROM ENROLLMENT 
    ORDER BY TOTAL_SCORE DESC;

-- 실습 2-13
SELECT * FROM ENROLLMENT 
    WHERE ENR_CSID = '3012'
    ORDER BY TOTAL_SCORE DESC;
    
-- 실습 2-14
SELECT CS_ID, CS_NAME FROM COURSE
    WHERE CS_NAME = '데이터베이스' OR CS_NAME = '프로그래밍언어';

-- 실습 2-15
SELECT CS_NAME, CS_DEPT FROM COURSE;

-- 실습 2-16
SELECT STDNO, NAME FROM STUDENT
    ORDER BY NAME ASC;

-- 실습 2-17
SELECT DISTINCT ENR_STDNO FROM ENROLLMENT;

-- 실습 2-18
SELECT MAX(TOTAL_SCORE) AS "가장_큰_총점" FROM ENROLLMENT;

-- 실습 2-19
SELECT MAJOR, COUNT(*) AS "학생수"
    FROM STUDENT
    GROUP BY MAJOR;

-- 실습 2-20
SELECT ENR_CSID, COUNT(*) AS "수강_학생수"
    FROM ENROLLMENT
    GROUP BY ENR_CSID 
    HAVING COUNT(*) >= 2;

-- 실습 2-21
SELECT
    STDNO,
    NAME,
    MAJOR,
    ENR_CSID,
    MID_SCORE,
    FINAL_SCORE,
    TOTAL_SCORE,
    GRADE
FROM STUDENT S
LEFT JOIN ENROLLMENT E ON S.STDNO = E.ENR_STDNO;

-- 실습 2-22
SELECT NAME, STDNO, ENR_CSID
    FROM STUDENT S
    JOIN ENROLLMENT E
    ON S.STDNO = E.ENR_STDNO
    WHERE ENR_CSID = '3012';

-- 실습 2-23
SELECT
        STDNO,
        NAME,
        COUNT(STDNO) AS "수강신청 건수",
        SUM(TOTAL_SCORE) AS "종합점수",
        SUM(TOTAL_SCORE) / COUNT(STDNO) AS "평균"
    FROM STUDENT S
    JOIN ENROLLMENT E ON S.STDNO = E.ENR_STDNO
    GROUP BY STDNO, NAME
    ORDER BY S.STDNO ASC;

-- 실습 2-24
SELECT ENR_NO, ENR_STDNO, CS_ID, CS_NAME, CS_CREDIT FROM ENROLLMENT E
    JOIN COURSE C ON E.ENR_CSID = C.CS_ID;

-- 실습 2-25
SELECT
    COUNT(*) AS "마케팅_전략_수강_신청건수",
    AVG(TOTAL_SCORE) AS "마케팅_전략_편균"
FROM ENROLLMENT E
JOIN COURSE C ON E.ENR_CSID = C.CS_ID
WHERE CS_NAME = '마케팅 전략';

-- 실습 2-26
SELECT
        ENR_STDNO, CS_NAME
    FROM ENROLLMENT E
    JOIN COURSE C ON E.ENR_CSID = C.CS_ID
    WHERE GRADE = 'A';

-- 실습 2-27
SELECT
    STDNO,
    NAME,
    MAJOR,
    ENR_CSID,
    CS_NAME,
    CS_CREDIT,
    TOTAL_SCORE,
    GRADE
FROM STUDENT S
JOIN ENROLLMENT E ON S.STDNO = E.ENR_STDNO 
JOIN COURSE C ON E.ENR_CSID = C.CS_ID
ORDER BY ENR_NO;


-- 실습 2-28
SELECT 
        STDNO,
        NAME,
        CS_NAME,
        TOTAL_SCORE,
        GRADE
    FROM STUDENT S
    JOIN ENROLLMENT E ON S.STDNO = E.ENR_STDNO
    JOIN COURSE C ON E.ENR_CSID = C.CS_ID
    WHERE GRADE = 'F';

-- 실습 2-29
SELECT
        STDNO,
        NAME,
        SUM(CS_CREDIT) AS "이수학점"
    FROM STUDENT S
    JOIN ENROLLMENT E ON S.STDNO = E.ENR_STDNO
    JOIN COURSE C ON E.ENR_CSID = C.CS_ID 
    WHERE GRADE != 'F'
    GROUP BY STDNO, NAME;

-- 실습 2-30
SELECT
    S.STDNO,
    S.NAME,
    S.MAJOR
FROM STUDENT S
WHERE S.STDNO NOT IN (
    SELECT ENR_STDNO FROM ENROLLMENT
);
