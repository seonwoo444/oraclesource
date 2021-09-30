--alter session set "_ORACLE_SCrIPT" = true;
--비밀번호 변경
--alter user hr IDENTIFIED by hr; DDL구문
-- 관계DBMS => RDBMS => ORCLE, MySQL, MS-SQL
--표준 구문 => SQL

--새로운 사용자 생성
create user c##scott IDENTIFIED BY tiger
default tablespace users
TEMPORARY TABLESPACE temp;

--새로운 사용자에게 권한 부여
grant connect, RESOURCE to c##scott;


