/*
    날짜 : 2025/07/17
    이름 : 정순권
    내용 : 5장 데이터베이스 객체
*/

// 워크북 p13
-- 실습하기
SELECT * FROM DICTIONARY;

SELECT table_name FROM user_tables;

SELECT owner, table_name from all_tables;
SELECT * from dba_tables;
select * from dba_users;

select instance_name, status, database_status, host_name from V$INSTANCE;

-- 실습하기 3-2
