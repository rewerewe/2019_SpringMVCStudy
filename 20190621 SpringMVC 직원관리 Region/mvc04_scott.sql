SELECT USER
FROM DUAL;
--==>> SCOTT


--�� �ǽ� ���̺� ����(���� : REGION)
CREATE TABLE REGION
( REGIONID      NUMBER      -- ���� ���̵� -- PK
, REGIONNAME    VARCHAR2(30)-- ���� ��
, CONSTRAINT    REGION_ID_PK PRIMARY KEY(REGIONID)
);
--==>> Table REGION��(��) �����Ǿ����ϴ�.

--�� ������ ����(����: REGION)
CREATE SEQUENCE REGIONSEQ
NOCACHE;
--==>> Sequence REGIONSEQ��(��) �����Ǿ����ϴ�.

--�� ������ �Է�(���� ������ �Է�)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '���');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '��õ');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3

--�� ������ �Է�(���� ������ �߰� �Է�) 
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '����')
;
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT REGIONID, REGIONNAME
FROM REGION;
/*
1	����
2	���
3	��õ
4	����
*/
--�� ���� ����
SELECT REGIONID, REGIONNAME FROM REGION
;

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.



--�� �ǽ� ���̺� ����(����: POSITION)
CREATE TABLE POSITION
( POSITIONID    NUMBER          -- ���� ���̵� -- PK 
, POSITIONNAME  VARCHAR2(30)    -- ���� ��
, MINBASICPAY   NUMBER          -- �ּ� �⺻��
, CONSTRAINT POSITION_ID_PK PRIMARY KEY(POSITIONID)
);
--==>> Table POSITION��(��) �����Ǿ����ϴ�.

--�� ������ ���� (���� : POSITION)
CREATE SEQUENCE POSITIONSEQ
NOCACHE;
--==>> Sequence POSITIONSEQ��(��) �����Ǿ����ϴ�.

--�� ������ �Է�(���� ������ �Է�)
INSERT INTO POSITION (POSITIONID, POSITIONNAME, MINBASICPAY) 
VALUES (POSITIONSEQ.NEXTVAL, '���', 1000000);        --�鸸
INSERT INTO POSITION (POSITIONID, POSITIONNAME, MINBASICPAY) 
VALUES (POSITIONSEQ.NEXTVAL, '�븮', 2000000);        --�̹鸸
INSERT INTO POSITION (POSITIONID, POSITIONNAME, MINBASICPAY) 
VALUES (POSITIONSEQ.NEXTVAL, '����', 3000000);        --��鸸
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3

--�� ���� ����
INSERT INTO POSITION (POSITIONID, POSITIONNAME, MINBASICPAY) VALUES (POSITIONSEQ.NEXTVAL, '��', 4000000) -- ��鸸
;

--�� Ȯ��
SELECT POSITIONID, POSITIONNAME, MINBASICPAY
FROM POSITION;

--�� ���� ����
SELECT POSITIONID, POSITIONNAME, MINBASICPAY FROM POSITION
;
/*
1	���	1000000
2	�븮	2000000
3	����	3000000
4	��	4000000
*/

--�� Ŀ��
COMMIT;
--==>>Ŀ�� �Ϸ�.



--�� �ǽ� ���̺� ����(�μ� : DEPARTMENT)
CREATE TABLE DEPARTMENT
( DEPARTMENTID      NUMBER          -- �μ� ���̵�  --PK
, DEPARTMENTNAME    VARCHAR2(30)    -- �μ� ��
, CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(DEPARTMENTID)
);
--==>> Table DEPARTMENT��(��) �����Ǿ����ϴ�.

--�� ������ ����(�μ� : DEPARTMENT)
CREATE SEQUENCE DEPARTMENTSEQ
NOCACHE;
--==>> Sequence DEPARTMENTSEQ��(��) �����Ǿ����ϴ�.

DROP TABLE DEPARTMENT PURGE;

DROP SEQUENCE DEPARTMENTSEQ;


--�� ������ �Է�(�μ� ������ �Է�)
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES (DEPARTMENTSEQ.NEXTVAL, '���ߺ�');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES (DEPARTMENTSEQ.NEXTVAL, '������');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES (DEPARTMENTSEQ.NEXTVAL, '������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

SELECT DEPARTMENTID, DEPARTMENTNAME FROM DEPARTMENT
;



--�� �ǽ� ���̺� ����(�μ� : EMPLOYEE)
CREATE TABLE EMPLOYEE
( EMPLOYEEID    NUMBER                  -- ��� ��ȣ --PK
, NAME          VARCHAR2(30)            -- ��� ��
, SSN           VARCHAR2(20)            -- �ֹ� ��ȣ -- ��ȣȭ ��� ����(TYPE CHECK)
, BIRTHDAY      DATE                    -- �������
, LUNAR         NUMBER(1)   DEFAULT 0   -- ������     --��� 0 ���� 1
, TELEPHONE     VARCHAR2(40)             -- ��ȭ ��ȣ 
, DEPARTMENTID  NUMBER                  -- �μ� ���̵� 
, POSITIONID    NUMBER                  -- ���� ���̵�
, REGIONID      NUMBER                  -- ���� ���̵� 
, BASICPAY      NUMBER                  -- �⺻��
, EXTRAPAY      NUMBER                  -- ����
, CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY(EMPLOYEEID)
, CONSTRAINT EMPLOYEE_DEPARTMENT_FK FOREIGN KEY(DEPARTMENTID)
             REFERENCES DEPARTMENT(DEPARTMENTID)
, CONSTRAINT EMPLOYEE_POSITIONID_FK FOREIGN KEY(POSITIONID)
             REFERENCES POSITION(POSITIONID)
, CONSTRAINT EMPLOYEE_REGION_FK FOREIGN KEY(REGIONID)
            REFERENCES REGION(REGIONID)
, CONSTRAINT EMPLOYEE_LUNAR_CK CHECK(LUNAR=0 OR LUNAR=1)
);
--==>> Table EMPLOYEE��(��) �����Ǿ����ϴ�.

--�� ������ ����
CREATE SEQUENCE EMPLOYEESEQ
NOCACHE;
--==>> Sequence EMPLOYEESEQ��(��) �����Ǿ����ϴ�.

DROP TABLE EMPLOYEE PURGE;

DROP SEQUENCE EMPLOYEESEQ;


--�� ������ �Է�(���� ������ �Է�)
INSERT INTO EMPLOYEE ( EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR
                     , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                     , BASICPAY, EXTRAPAY)
VALUES( EMPLOYEESEQ.NEXTVAL, '���Ѿ�', CRYPTPACK.ENCRYPT('9309171234567','9309171234567'), TO_DATE('1993-09-17', 'YYYY-MM-DD'), 0
        , '010-9379-5209', 1, 1, 1
        , 15000000, 150000);
        
--�� ���� ���� 
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY) VALUES(EMPLOYEESEQ.NEXTVAL,'���Ѿ�',CRYPTPACK.ENCRYPT('9309171234567','9309171234567'),TO_DATE('1993-09-17','YYYY-MM-DD'), 0,'010-9379-5209',1,1,1,1500000, 150000)
;

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.



--�� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

--�� Ȯ��
SELECT * FROM EMPLOYEE;

COMMIT;


--�� ���� ���� ��ȸ ������ ����
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID
      ,E.NAME
      ,E.SSN
      ,TO_CHAR(E.BIRTHDAY,'YYYY-MM-DD') AS BIRTHDAY
      ,E.LUNAR
      ,DECODE(E.LUNAR,0,'���',1,'����') AS LUNARNAME
      ,E.TELEPHONE
      ,E.DEPARTMENTID
      ,(SELECT DEPARTMENTNAME FROM DEPARTMENT WHERE DEPARTMENTID=E.DEPARTMENTID) AS DEPARTMENTNAME
      ,E.POSITIONID
      ,(SELECT POSITIONNAME FROM POSITION WHERE POSITIONID=E.POSITIONID) AS POSITIONNAME
      ,E.REGIONID
      ,(SELECT REGIONNAME FROM REGION WHERE REGIONID=E.REGIONID) AS REGIONNAME
      ,E.BASICPAY
      ,E.EXTRAPAY
      ,NVL(E.BASICPAY,0) + NVL(E.EXTRAPAY,0) AS PAY
FROM EMPLOYEE E
ORDER BY E.EMPLOYEEID;
--==>> View EMPLOYEEVIEW��(��) �����Ǿ����ϴ�.

--�� ���� ������ ��ȸ ������ ����(���� ������ ���� ���ɿ��� Ȯ��)
SELECT REGIONID, REGIONNAME
    , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE REGIONID = R.REGIONID) AS DELCHECK
FROM REGION R;
/*
1	����  	1
2	���	0
3	��õ	0
4	����	    0   
--> ������� ���� �����ʹ� ���� �Ұ����� ��Ȳ�̸�,
    ����⡻,����õ��, �����֡� ���� �����ʹ� ���� ������ ��Ȳ���� 
    �Ǻ��� �� �ִ� ������ 
/*

/*
SELECT REGIONID, REGIONNAME
FROM REGION
'���Ѿ�' ������ �����ϰ� �ֱ⿡ ���� �Ұ���. 
1	����
2	���
3	��õ
4	����
*/

--�� �� ���� (REGIONVIEW)
CREATE OR REPLACE VIEW REGIONVIEW
AS
SELECT REGIONID, REGIONNAME
    , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE REGIONID = R.REGIONID) AS DELCHECK
FROM REGION R;
--==>> View REGIONVIEW��(��) �����Ǿ����ϴ�.

--�� ���� ������ ��ȸ ������ ����(���� ������ ���� ���ɿ��� Ȯ��)
SELECT P.POSITIONID, p.positionname, p.minbasicpay
      , (SELECT COUNT(*)
         FROM POSITION
         WHERE POSITIONID = P.POSITIONID) AS DELCHECK
FROM POSITION P;
/*
1	���	1000000	1
2	�븮	2000000	1
3	����	    3000000	1
4	��	    4000000	1
*/

--�� �� ����(POSITIONVIEW)
CREATE OR REPLACE VIEW POSITIONVIEW
AS 
SELECT P.POSITIONID, p.positionname, p.minbasicpay
      , (SELECT COUNT(*)
         FROM POSITION
         WHERE POSITIONID = P.POSITIONID) AS DELCHECK
FROM POSITION P;
--==>> View POSITIONVIEW��(��) �����Ǿ����ϴ�.

SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK FROM POSITIONVIEW
;


--�� �μ� ������ ��ȸ ������ ����(�μ� ������ ���� ���ɿ��� Ȯ��)
SELECT d.departmentid, d.departmentname
     , (SELECT COUNT(*)
        FROM DEPARTMENT
        WHERE DEPARTMENTID = D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
/*
1	���ߺ�	1
2	������	1
3	������	1
*/

--�� �� ����(DEPARTMENTVIEW)
CREATE OR REPLACE VIEW DEPARTMENTVIEW
AS
SELECT d.departmentid, d.departmentname
     , (SELECT COUNT(*)
        FROM DEPARTMENT
        WHERE DEPARTMENTID = D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
--==>> View DEPARTMENTVIEW��(��) �����Ǿ����ϴ�.

SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK 
FROM DEPARTMENTVIEW
ORDER BY DEPARTMENTID
;

--�� ������ �ּ� �⺻�� �˻� ������ ����
SELECT MINBASICPAY
FROM POSITION
WHERE POSITIONID=1;     -- ���
--> ���� ����
SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=1
;
--==>> 1000000

--------------------------------------------------------------------------------------------------------------------------------

--�� �α���, �α׾ƿ�

-- ID �� PW �÷� �����͸� ��� �ִ� ���̺��� ������ �������� �ʴ� ��Ȳ�̴�.
-- �̿� �����Ͽ� EMPLOYEE(��� ���̵�) �� SSN(�ֹι�ȣ) ���ڸ�
-- 7�ڸ��� ���ڸ� �̿��� �� �ֵ��� �����Ѵ�.

--�� ���� ���̺� ���� ���� 
-- ��
-- EMPLOYEE(���� ���̺�)�� SSN(�ֹι�ȣ) �÷��� �и��Ѵ�.
-- SSN ------------------> SSN1, SSN2
-- SSN1 �� �ֹι�ȣ �� 6�ڸ�
-- SSN2 �� �ֹι�ȣ �� 7�ڸ� �� ��ȣȭ ����

-- ��
-- EMPLOYEE(���� ���̺�)�� GREAD(���) �÷��� �߰��Ѵ�.
-- GREAD �� ������ 0, �Ϲݻ�� 1

--�� �÷� ���� SSN �� SSN1, SSN2
-- �÷� �߰�
ALTER TABLE EMPLOYEE
ADD(SSN1 CHAR(6), SSN2 VARCHAR2(50));
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.

SELECT *
FROM EMPLOYEE;
/*
1	���Ѿ�	???????\?$	1993-09-17	0	010-9379-5209	1	1	1	15000000	150000		
*/

UPDATE EMPLOYEE
SET SSN1 = SUBSTR( CRYPTPACK.DECRYPT(SSN, '9309171234567'), 1, 6)
/*                 -------------------------------------- ��ȣ ������ �� SUBSTR. �����ؼ� �߶� 930917 �� SSN1 �� ��ڴ�. */
  , SSN2 = CRYPTPACK.ENCRYPT ( SUBSTR( CRYPTPACK.DECRYPT(SSN, '9309171234567'), 7, 7)
/*                                     -------------------------------------- ��ȣȭ ��ü���� 7���� 7�ڸ� 1234567     */
                             , SUBSTR( CRYPTPACK.DECRYPT(SSN, '9309171234567'), 7, 7) );
/*  -------------------------------------- ��ȣȭ ��ü���� 7���� 7�ڸ� 1234567 �� �ٽ� ��ȣȭ �ؼ� SSN2 �� ��ڴ�. */


UPDATE EMPLOYEE
SET SSN1 = SUBSTR( CRYPTPACK.DECRYPT(SSN, '9309171234567'), 1, 6)
, SSN2 = CRYPTPACK.ENCRYPT ( SUBSTR( CRYPTPACK.DECRYPT(SSN, '9309171234567'), 7, 7)
, SUBSTR( CRYPTPACK.DECRYPT(SSN, '9309171234567'), 7, 7) )     
, NAME='���Ѿ�'
, BIRTHDAY='93-09-17'
, LUNAR=0
, TELEPHONE='010-9379-5209'
, REGIONID=1
, BASICPAY=1500000
, EXTRAPAY=150000
WHERE EMPLOYEEID=1;
--==> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
                             
--** ���� �ֹι�ȣ �÷�(SSN) ����
ALTER TABLE EMPLOYEE
DROP COLUMN SSN;
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.

SELECT *
FROM EMPLOYEE;
/*
1	���Ѿ�	1993-09-17	0	010-9379-5209	1	1	1	15000000	150000	930917	=o??

--> SS1�� ������� 6�ڸ�. SSN2�� �ֹι�ȣ �� 7�ڸ� ��ȣȭ ó��. ���� SSN �� ���ŵ�.
*/

--** �÷� �߰� �� GRADE - �⺻���� 1(�Ϲ� ���)�� ����
ALTER TABLE EMPLOYEE
ADD GRADE NUMBER(1) DEFAULT 1;
--==>> Table EMPLOYEE��(��) ����Ǿ����ϴ�.

--�� ssn2 �� ��ȣȭ�� ������Ʈ
UPDATE EMPLOYEE
SET SSN2 = CRYPTPACK.ENCRYPT('3434345','3434345')
WHERE EMPLOYEEID=3;

select *
from employee;


UPDATE EMPLOYEE
SET GRADE=0
WHERE EMPLOYEEID=1;

COMMIT;
/*
EMPLOYEEID NAME                           BIRTHDAY        LUNAR TELEPHONE                                DEPARTMENTID POSITIONID   REGIONID   BASICPAY   EXTRAPAY SSN1   SSN2                                                    GRADE
---------- ------------------------------ ---------- ---------- ---------------------------------------- ------------ ---------- ---------- ---------- ---------- ------ -------------------------------------------------- ----------
         1 ���Ѿ�                         1993-09-17          0 010-9379-5209                                       1          1          1   15000000     150000 930917 =o??                                                     1
*/


-- ���Ѿ� ����� �����ڷ� �Ӹ�
UPDATE EMPLOYEE
SET GRADE=0
WHERE EMPLOYEEID=2;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM EMPLOYEE;

/*
EMPLOYEEID NAME                           BIRTHDAY        LUNAR TELEPHONE                                DEPARTMENTID POSITIONID   REGIONID   BASICPAY   EXTRAPAY SSN1   SSN2                                                    GRADE
---------- ------------------------------ ---------- ---------- ---------------------------------------- ------------ ---------- ---------- ---------- ---------- ------ -------------------------------------------------- ----------
         1 ���Ѿ�                         1993-09-17          0 010-9379-5209                                       1          1          1   15000000     150000 930917 =o??                                                     0

*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.
--�� ���̺� ������ �����Ͽ��� ������
--   �̿� ������ ��(EMPLOYEEVIEW) �� ������ ���� �ۼ�(����)

CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID AS EMPLOYEEID
      ,E.NAME AS NAME
      ,E.SSN1 AS SSN 
      ,TO_CHAR(E.BIRTHDAY,'YYYY-MM-DD') AS BIRTHDAY
      ,E.LUNAR AS LUNAR
      ,DECODE(E.LUNAR,0,'���',1,'����') AS LUNARNAME
      ,E.TELEPHONE AS TELEPHONE
      ,E.DEPARTMENTID AS DEPARTMENTID
      ,(SELECT DEPARTMENTNAME FROM DEPARTMENT WHERE DEPARTMENTID=E.DEPARTMENTID) AS DEPARTMENTNAME
      ,E.POSITIONID AS POSITIONID
      ,(SELECT POSITIONNAME FROM POSITION WHERE POSITIONID=E.POSITIONID) AS POSITIONNAME
      ,E.REGIONID AS REGIONID
      ,(SELECT REGIONNAME FROM REGION WHERE REGIONID=E.REGIONID) AS REGIONNAME
      ,E.BASICPAY AS BASICPAY
      ,E.EXTRAPAY AS EXTRAPAY
      ,NVL(E.BASICPAY,0) + NVL(E.EXTRAPAY,0) AS PAY
      ,E.GRADE AS GRADE
FROM EMPLOYEE E
ORDER BY E.EMPLOYEEID;
--==>> View EMPLOYEEVIEW ��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM EMPLOYEEVIEW;
/*
EMPLOYEEID NAME                           SSN    BIRTHDAY        LUNAR LU TELEPHONE                                DEPARTMENTID DEPARTMENTNAME                 POSITIONID POSITIONNAME                     REGIONID REGIONNAME                       BASICPAY   EXTRAPAY        PAY      GRADE
---------- ------------------------------ ------ ---------- ---------- -- ---------------------------------------- ------------ ------------------------------ ---------- ------------------------------ ---------- ------------------------------ ---------- ---------- ---------- ----------
         1 ���Ѿ�                         930917 1993-09-17          0 ��� 010-9379-5209                                       1 ���ߺ�                                  1 ���                                    1 ����                             15000000     150000   15150000          0
*/


DESC EMPLOYEEVIEW;

/*
�̸�             ��?       ����           
-------------- -------- ------------ 
EMPLOYEEID     NOT NULL NUMBER       
NAME                    VARCHAR2(30) 
SSN                     CHAR(6)      
BIRTHDAY                VARCHAR2(10) 
LUNAR                   NUMBER(1)    
LUNARNAME               VARCHAR2(6)  
TELEPHONE               VARCHAR2(40) 
DEPARTMENTID            NUMBER       
DEPARTMENTNAME          VARCHAR2(30) 
POSITIONID              NUMBER       
POSITIONNAME            VARCHAR2(30) 
REGIONID                NUMBER       
REGIONNAME              VARCHAR2(30) 
BASICPAY                NUMBER       
EXTRAPAY                NUMBER       
PAY                     NUMBER       
GRADE                   NUMBER(1)    
*/

desc employee;

--�� ���� ������ �Է� ������ ����(������ ����)
INSERT INTO EMPLOYEE( EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR
                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                    , BASICPAY, EXTRAPAY)
VALUES (EMPLOYEESEQ.NEXTVAL, '��ȫ��', '950410', CRYPTPACK.ENCRYPT('2323234', '2323234')
      , TO_DATE('1995-04-10', 'YYYY-MM-DD'), 0, '010-9962-9626', 1, 1, 1
      , 1500000, 150000 )
;  -- ����ʸ�, �ʿ���
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--> ���� ����
INSERT INTO EMPLOYEE( EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNA, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY) VALUES (EMPLOYEESEQ.NEXTVAL, '��ȫ��', '950410', CRYPTPACK.ENCRYPT('2323234', '2323234'), TO_DATE('1995-04-10', 'YYYY-MM-DD'), 0, '010-9962-9626', 1, 1, 1, 1500000, 150000 )
; 



SELECT *
FROM EMPLOYEE;
/*
<EMPLOYEE>
EMPLOYEEID NAME                           BIRTHDAY        LUNAR TELEPHONE                                DEPARTMENTID POSITIONID   REGIONID   BASICPAY   EXTRAPAY SSN1   SSN2                                                    GREDE      GRADE
---------- ------------------------------ ---------- ---------- ---------------------------------------- ------------ ---------- ---------- ---------- ---------- ------ -------------------------------------------------- ---------- ----------
         1 ���Ѿ�                         1993-09-17          0 010-9379-5209                                       1          1          1   15000000     150000 930917 =o??                                                     0          0
         2 ��ȫ��                         1995-04-10          0 010-9962-9626                                       1          1          1    1500000     150000 950410 ?P4?                                                     1          1

<EMPLOYEEVIEW>
EMPLOYEEID NAME                           SSN    BIRTHDAY        LUNAR LU TELEPHONE                                DEPARTMENTID DEPARTMENTNAME                 POSITIONID POSITIONNAME                     REGIONID REGIONNAME                       BASICPAY   EXTRAPAY        PAY      GRADE
---------- ------------------------------ ------ ---------- ---------- -- ---------------------------------------- ------------ ------------------------------ ---------- ------------------------------ ---------- ------------------------------ ---------- ---------- ---------- ----------
         1 ���Ѿ�                         930917 1993-09-17          0 ��� 010-9379-5209                                       1 ���ߺ�                                  1 ���                                    1 ����                             15000000     150000   15150000          0
         2 ��ȫ��                         950410 1995-04-10          0 ��� 010-9962-9626                                       1 ���ߺ�                                  1 ���                                    1 ����                              1500000     150000    1650000          1
*/

--�� �Ϲ� ��� �α��� ������ ����(ID �� EMPLOYEEID, PW �� SSN2)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID='ID���ڿ�'
  AND SSN2 = ( SELECT SSN2
               FROM EMPLOYEE
               WHERE EMPLOYEEID='ID���ڿ�');
               
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = ( SELECT SSN2
               FROM EMPLOYEE
               WHERE EMPLOYEEID=2);
--==>> ��ȫ��

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND ( SELECT SSN2
        FROM EMPLOYEE
        WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('2323232', '2323232');
--==>> ��ȸ ��� ���� �� �α��� ����

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND ( SELECT SSN2
        FROM EMPLOYEE
        WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('2323234', '2323234');
--==>> ��ȸ ��� : ��ȫ�� �� �α��� ���� 

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('2323234', '2323234');
--    ---- �� �κи� ����.  
--==>> ��ȸ ��� : ��ȫ�� �� �α��� ���� 

SELECT NAME 
FROM EMPLOYEE 
WHERE EMPLOYEEID='ID���ڿ�' 
  AND SSN2 = CRYPTPACK.ENCRYPT('PW���ڿ�', 'PW���ڿ�');

--> ���ٱ���
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID='ID���ڿ�' AND SSN2 = CRYPTPACK.ENCRYPT('PW���ڿ�', 'PW���ڿ�');

--�� ������ �α��� ������ ����(ID �� EMPLOYEEID, PW �� SSN2, GRADE=0) 
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('2323234', '2323234')
  AND GRADE = 0;
--==>> ��ȸ ��� ���� �� �α��� ���� 

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567', '1234567')
  AND GRADE = 0;
--==>> ��ȸ ��� : ���Ѿ� �� �α��� ����

--> ������ �α��� ������ ���ٱ���
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID='ID���ڿ�' AND SSN2 = CRYPTPACK.ENCRYPT('PW���ڿ�', 'PW���ڿ�') AND GRADE = '�����ڵ�޹��ڿ�';

--�� ���� ������ ���� ������ ����
DELETE 
FROM EMPLOYEE
WHERE EMPLOYEEID=2;
--> ���� ����
DELETE FROM EMPLOYEE WHERE EMPLOYEEID=2
;


rollback;
--�� ���� ������ ���� ������ ����
UPDATE EMPLOYEE
SET NAME='���Ѿ�'
  , BIRTHDAY=TO_DATE('2001-01-01', 'YYYY-MM-DD')
  , LUNAR=0
  , TELEPHONE='010-1111-2222'
  , DEPARTMENTID=2
  , POSITIONID=2
  , REGIONID=2
  , BASICPAY=2000000    -- �̹鸸
  , EXTRAPAY=200000     -- �̽ʸ�
  , SSN1='010101'
  , SSN2=CRYPTPACK.ENCRYPT('3234567', '3234567')
  , GRADE=0
WHERE EMPLOYEEID=1;
--> ���� ����
UPDATE EMPLOYEE SET NAME='���Ѿ�', BIRTHDAY=TO_DATE('2001-01-01', 'YYYY-MM-DD'), LUNAR=0, TELEPHONE='010-1111-2222', DEPARTMENTID=2, POSITIONID=2, REGIONID=2, BASICPAY=2000000, EXTRAPAY=200000, SSN1='010101', SSN2=CRYPTPACK.ENCRYPT('3234567', '3234567'), GRADE=1 WHERE EMPLOYEEID=1
;

SELECT *
FROM EMPLOYEE;

ROLLBACK;

COMMIT;

DESC EMPLOYEEVIEW;

SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, LUNARNAME				
       , TELEPHONE, DEPARTMENTID, DEPARTMENTNAME, POSITIONID, POSITIONNAME	
       , REGIONID, REGIONNAME, BASICPAY, EXTRAPAY, PAY						
FROM EMPLOYEEVIEW	
;

SELECT *					
FROM EMPLOYEEVIEW;

--�� �μ� ������ ���� (POSITION UPDATE) 
UPDATE DEPARTMENT
SET DEPARTMENTNAME = ?
WHERE DEPARTMENTID = ?;

SELECT REGIONID, REGIONNAME, DELCHECK
FROM REGIONVIEW
ORDER BY REGIONID
;
-- ���� ������ ��� ������ ����(REGION)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES (REGIONSEQ.NEXTVAL, ? )
;

-- ���� ������ ���� ������ ����(REGION)
DELETE FROM REGION WHERE REGIONID = ?;

-- ���� ������ ���� ������ ����(REGION)
UPDATE REGION 
SET REGIONNAME='����' 
WHERE REGIONID= 4;

-- ���� ������ �Է� ������ ����(Position)
INSERT INTO POSITION(POSITIONID, POSITIONNAME, MINBASICPAY) VALUES(POSITIONSEQ.NEXTVAL, ? , ?)
;

-- ���� ������ ���� ������ ����(Position)
DELETE FROM POSITION WHERE POSITIONID=?
;

-- ���� ������ ���� ������ ����(Position)
UPDATE POSITION SET POSITIONNAME= ?, MINBASICPAY= ? WHERE POSITIONID= ?
;

ROLLBACK;

DESC EMPLOYEEVIEW;

SELECT *
FROM REGION;

commit;

SELECT REGIONNAME
FROM REGION
WHERE REGIONID=1;


