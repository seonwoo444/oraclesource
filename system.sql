--alter session set "_ORACLE_SCrIPT" = true;
--��й�ȣ ����
--alter user hr IDENTIFIED by hr; DDL����
-- ����DBMS => RDBMS => ORCLE, MySQL, MS-SQL
--ǥ�� ���� => SQL

--���ο� ����� ����
create user c##scott IDENTIFIED BY tiger
default tablespace users
TEMPORARY TABLESPACE temp;

--���ο� ����ڿ��� ���� �ο�
grant connect, RESOURCE to c##scott;


