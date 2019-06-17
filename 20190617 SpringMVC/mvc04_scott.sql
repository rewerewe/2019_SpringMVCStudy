﻿SELECT USER
FROM DUAL;
--==>> SCOTT


--○ 실습 테이블 생성(지역 : REGION)
CREATE TABLE REGION
( REGIONID      NUMBER      -- 지역 아이디 -- PK
, REGIONNAME    VARCHAR2(30)-- 지역 명
, CONSTRAINT    REGION_ID_PK PRIMARY KEY(REGIONID)
);
--==>> Table REGION이(가) 생성되었습니다.

--○ 시퀀스 생성(지역: REGION)
CREATE SEQUENCE REGIONSEQ
START WITH 0
MINVALUE 0
--==>> Sequence REGIONSEQ이(가) 생성되었습니다.
;

DROP TABLE REGION PURGE;

DROP SEQUENCE REGIONSEQ;

--○ 데이터 입력(지역 데이터 입력)
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '서울');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '경기');
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '인천');
--==>> 1 행 이(가) 삽입되었습니다. * 3

--○ 데이터 입력(지역 데이터 추가 입력) 
INSERT INTO REGION(REGIONID, REGIONNAME) VALUES(REGIONSEQ.NEXTVAL, '제주')
;
--==>> 1 행 이(가) 삽입되었습니다.

--○ 확인
SELECT REGIONID, REGIONNAME
FROM REGION;
/*
1	서울
2	경기
3	인천
4	제주
*/
--○ 한줄 구성
SELECT REGIONID, REGIONNAME FROM REGION
;

--○ 커밋
COMMIT;
--==>> 커밋 완료.



--○ 실습 테이블 생성(직위: POSITION)
CREATE TABLE POSITION
( POSITIONID    NUMBER          -- 직위 아이디 -- PK 
, POSITIONNAME  VARCHAR2(30)    -- 직위 명
, MINBASICPAY   NUMBER          -- 최소 기본급
, CONSTRAINT POSITION_ID_PK PRIMARY KEY(POSITIONID)
);
--==>> Table POSITION이(가) 생성되었습니다.

--○ 시퀀스 생성 (직위 : POSITION)
CREATE SEQUENCE POSITIONSEQ
START WITH 0
MINVALUE 0
;
--==>> Sequence POSITIONSEQ이(가) 생성되었습니다.

--○ 데이터 입력(직위 데이터 입력)
INSERT INTO POSITION (POSITIONID, POSITIONNAME, MINBASICPAY) 
VALUES (POSITIONSEQ.NEXTVAL, '사원', 1000000);        --백만
INSERT INTO POSITION (POSITIONID, POSITIONNAME, MINBASICPAY) 
VALUES (POSITIONSEQ.NEXTVAL, '대리', 2000000);        --이백만
INSERT INTO POSITION (POSITIONID, POSITIONNAME, MINBASICPAY) 
VALUES (POSITIONSEQ.NEXTVAL, '부장', 3000000);        --삼백만
--==>> 1 행 이(가) 삽입되었습니다. * 3

--○ 한줄 구성
INSERT INTO POSITION (POSITIONID, POSITIONNAME, MINBASICPAY) VALUES (POSITIONSEQ.NEXTVAL, '상무', 4000000) -- 사백만
;

--○ 확인
SELECT POSITIONID, POSITIONNAME, MINBASICPAY
FROM POSITION;

--○ 한줄 구성
SELECT POSITIONID, POSITIONNAME, MINBASICPAY FROM POSITION
;
/*
1	사원	1000000
2	대리	2000000
3	부장	3000000
4	상무	4000000
*/

--○ 커밋
COMMIT;
--==>>커밋 완료.



--○ 실습 테이블 생성(부서 : DEPARTMENT)
CREATE TABLE DEPARTMENT
( DEPARTMENTID      NUMBER          -- 부서 아이디  --PK
, DEPARTMENTNAME    VARCHAR2(30)    -- 부서 명
, CONSTRAINT DEPARTMENT_ID_PK PRIMARY KEY(DEPARTMENTID)
);
--==>> Table DEPARTMENT이(가) 생성되었습니다.

--○ 시퀀스 생성(부서 : DEPARTMENT)
CREATE SEQUENCE DEPARTMENTSEQ
START WITH 0
MINVALUE 0
;
--==>> Sequence DEPARTMENTSEQ이(가) 생성되었습니다.

DROP TABLE DEPARTMENT PURGE;

DROP SEQUENCE DEPARTMENTSEQ;


--○ 데이터 입력(부서 데이터 입력)
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES (DEPARTMENTSEQ.NEXTVAL, '개발부');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES (DEPARTMENTSEQ.NEXTVAL, '마케팅');
INSERT INTO DEPARTMENT(DEPARTMENTID, DEPARTMENTNAME) VALUES (DEPARTMENTSEQ.NEXTVAL, '영업부');
--==>> 1 행 이(가) 삽입되었습니다. * 3

--○ 커밋
COMMIT;
--==>> 커밋 완료.

SELECT DEPARTMENTID, DEPARTMENTNAME FROM DEPARTMENT
;



--○ 실습 테이블 생성(부서 : EMPLOYEE)
CREATE TABLE EMPLOYEE
( EMPLOYEEID    NUMBER                  -- 사원 번호 --PK
, NAME          VARCHAR2(30)            -- 사원 명
, SSN           VARCHAR2(20)            -- 주민 번호 -- 암호화 기능 적용(TYPE CHECK)
, BIRTHDAY      DATE                    -- 생년월일
, LUNAR         NUMBER(1)   DEFAULT 0   -- 양음력     --양력 0 음력 1
, TELEPHONE     VARCHAR2(40)             -- 전화 번호 
, DEPARTMENTID  NUMBER                  -- 부서 아이디 
, POSITIONID    NUMBER                  -- 직위 아이디
, REGIONID      NUMBER                  -- 지역 아이디 
, BASICPAY      NUMBER                  -- 기본급
, EXTRAPAY      NUMBER                  -- 수당
, CONSTRAINT EMPLOYEE_ID_PK PRIMARY KEY(EMPLOYEEID)
, CONSTRAINT EMPLOYEE_DEPARTMENT_FK FOREIGN KEY(DEPARTMENTID)
             REFERENCES DEPARTMENT(DEPARTMENTID)
, CONSTRAINT EMPLOYEE_POSITIONID_FK FOREIGN KEY(POSITIONID)
             REFERENCES POSITION(POSITIONID)
, CONSTRAINT EMPLOYEE_REGION_FK FOREIGN KEY(REGIONID)
            REFERENCES REGION(REGIONID)
, CONSTRAINT EMPLOYEE_LUNAR_CK CHECK(LUNAR=0 OR LUNAR=1)
);
--==>> Table EMPLOYEE이(가) 생성되었습니다.

--○ 시퀀스 생성
CREATE SEQUENCE EMPLOYEESEQ
START WITH 0
MINVALUE 0
;

--==>> Sequence EMPLOYEESEQ이(가) 생성되었습니다.

DROP TABLE EMPLOYEE PURGE;

DROP SEQUENCE EMPLOYEESEQ;


--○ 데이터 입력(직원 데이터 입력)
INSERT INTO EMPLOYEE ( EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR
                     , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                     , BASICPAY, EXTRAPAY)
VALUES( EMPLOYEESEQ.NEXTVAL, '곽한얼', CRYPTPACK.ENCRYPT('9309171234567','9309171234567'), TO_DATE('1993-09-17', 'YYYY-MM-DD'), 0
        , '010-9379-5209', 1, 1, 1
        , 15000000, 150000);
        
--○ 한줄 구성 
INSERT INTO EMPLOYEE(EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY) VALUES(EMPLOYEESEQ.NEXTVAL,'곽한얼',CRYPTPACK.ENCRYPT('9309171234567','9309171234567'),TO_DATE('1993-09-17','YYYY-MM-DD'), 0,'010-9379-5209',1,1,1,1500000, 150000)
;

--○ 커밋
COMMIT;
--==>> 커밋 완료.



--※ 세션 설정 변경
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

--○ 확인
SELECT * FROM EMPLOYEE;

COMMIT;


--○ 직원 정보 조회 쿼리문 구성
CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID
      ,E.NAME
      ,E.SSN
      ,TO_CHAR(E.BIRTHDAY,'YYYY-MM-DD') AS BIRTHDAY
      ,E.LUNAR
      ,DECODE(E.LUNAR,0,'양력',1,'음력') AS LUNARNAME
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
--==>> View EMPLOYEEVIEW이(가) 생성되었습니다.

--○ 지역 데이터 조회 쿼리문 구성(지역 데이터 삭제 가능여부 확인)
SELECT REGIONID, REGIONNAME
    , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE REGIONID = R.REGIONID) AS DELCHECK
FROM REGION R;
/*
1	서울  	1
2	경기	0
3	인천	0
4	제주	    0   
--> 『서울』의 지역 데이터는 삭제 불가능한 상황이며,
    『경기』,『인천』, 『제주』 지역 데이터는 삭제 가능한 상황임을 
    판별할 수 있는 쿼리문 
/*

/*
SELECT REGIONID, REGIONNAME
FROM REGION
'곽한얼' 직원이 참조하고 있기에 삭제 불가함. 
1	서울
2	경기
3	인천
4	제주
*/

--○ 뷰 생성 (REGIONVIEW)
CREATE OR REPLACE VIEW REGIONVIEW
AS
SELECT REGIONID, REGIONNAME
    , (SELECT COUNT(*)
        FROM EMPLOYEE
        WHERE REGIONID = R.REGIONID) AS DELCHECK
FROM REGION R;
--==>> View REGIONVIEW이(가) 생성되었습니다.

--○ 직위 데이터 조회 쿼리문 구성(직위 데이터 삭제 가능여부 확인)
SELECT P.POSITIONID, p.positionname, p.minbasicpay
      , (SELECT COUNT(*)
         FROM POSITION
         WHERE POSITIONID = P.POSITIONID) AS DELCHECK
FROM POSITION P;
/*
1	사원	1000000	1
2	대리	2000000	1
3	부장	    3000000	1
4	상무	    4000000	1
*/

--○ 뷰 생성(POSITIONVIEW)
CREATE OR REPLACE VIEW POSITIONVIEW
AS 
SELECT P.POSITIONID, p.positionname, p.minbasicpay
      , (SELECT COUNT(*)
         FROM POSITION
         WHERE POSITIONID = P.POSITIONID) AS DELCHECK
FROM POSITION P;
--==>> View POSITIONVIEW이(가) 생성되었습니다.


--○ 부서 데이터 조회 쿼리문 구성(부서 데이터 삭제 가능여부 확인)
SELECT d.departmentid, d.departmentname
     , (SELECT COUNT(*)
        FROM DEPARTMENT
        WHERE DEPARTMENTID = D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
/*
1	개발부	1
2	마케팅	1
3	영업부	1
*/

--○ 뷰 생성(DEPARTMENTVIEW)
CREATE OR REPLACE VIEW DEPARTMENTVIEW
AS
SELECT d.departmentid, d.departmentname
     , (SELECT COUNT(*)
        FROM DEPARTMENT
        WHERE DEPARTMENTID = D.DEPARTMENTID) AS DELCHECK
FROM DEPARTMENT D;
--==>> View DEPARTMENTVIEW이(가) 생성되었습니다.


--○ 직위별 최소 기본급 검색 쿼리문 구성
SELECT MINBASICPAY
FROM POSITION
WHERE POSITIONID=1;     -- 사원
--> 한줄 구성
SELECT MINBASICPAY FROM POSITION WHERE POSITIONID=1
;
--==>> 1000000

--------------------------------------------------------------------------------------------------------------------------------

--○ 로그인, 로그아웃

-- ID 와 PW 컬럼 데이터를 담고 있는 테이블이 별도로 존재하지 않는 상황이다.
-- 이와 관련하여 EMPLOYEE(사원 아이디) 와 SSN(주민번호) 뒷자리
-- 7자리의 숫자를 이용할 수 있도록 구성한다.

--※ 기존 테이블 구조 변경 
-- ①
-- EMPLOYEE(직원 테이블)의 SSN(주민번호) 컬럼을 분리한다.
-- SSN ------------------> SSN1, SSN2
-- SSN1 → 주민번호 앞 6자리
-- SSN2 → 주민번호 뒷 7자리 → 암호화 적용

-- ②
-- EMPLOYEE(직원 테이블)에 GREAD(등급) 컬럼을 추가한다.
-- GREAD → 관리자 0, 일반사원 1

--○ 컬럼 분할 SSN → SSN1, SSN2
-- 컬럼 추가
ALTER TABLE EMPLOYEE
ADD(SSN1 CHAR(6), SSN2 VARCHAR2(50));
--==>> Table EMPLOYEE이(가) 변경되었습니다.

SELECT *
FROM EMPLOYEE;
/*
1	곽한얼	???????\?$	1993-09-17	0	010-9379-5209	1	1	1	15000000	150000		
*/

UPDATE EMPLOYEE
SET SSN1 = SUBSTR( SSN, 1, 6)
  , SSN2 =  SUBSTR(SSN, 7, 7)
;
--==> 1 행 이(가) 업데이트되었습니다.
                             
--** 기존 주민번호 컬럼(SSN) 제거
ALTER TABLE EMPLOYEE
DROP COLUMN SSN;
--==>> Table EMPLOYEE이(가) 변경되었습니다.

SELECT *
FROM EMPLOYEE;
/*
1	곽한얼	1993-09-17	0	010-9379-5209	1	1	1	15000000	150000	930917	=o??

--> SS1은 생년월일 6자리. SSN2는 주민번호 뒷 7자리 암호화 처리. 기존 SSN 은 제거됨.
*/

--** 컬럼 추가 → GRADE - 기본값을 1(일반 사원)로 구성
ALTER TABLE EMPLOYEE
ADD GRADE NUMBER(1) DEFAULT 1;
--==>> Table EMPLOYEE이(가) 변경되었습니다.

COMMIT;

SELECT * 
FROM EMPLOYEE;
/*
EMPLOYEEID NAME                           BIRTHDAY        LUNAR TELEPHONE                                DEPARTMENTID POSITIONID   REGIONID   BASICPAY   EXTRAPAY SSN1   SSN2                                                    GRADE
---------- ------------------------------ ---------- ---------- ---------------------------------------- ------------ ---------- ---------- ---------- ---------- ------ -------------------------------------------------- ----------
         1 곽한얼                         1993-09-17          0 010-9379-5209                                       1          1          1   15000000     150000 930917 =o??                                                     1
*/

-- 곽한얼 사원을 관리자로 임명
UPDATE EMPLOYEE
SET GRADE=0
WHERE EMPLOYEEID=1;
--==>> 1 행 이(가) 업데이트되었습니다.

SELECT *
FROM EMPLOYEE;

/*
EMPLOYEEID NAME                           BIRTHDAY        LUNAR TELEPHONE                                DEPARTMENTID POSITIONID   REGIONID   BASICPAY   EXTRAPAY SSN1   SSN2                                                    GRADE
---------- ------------------------------ ---------- ---------- ---------------------------------------- ------------ ---------- ---------- ---------- ---------- ------ -------------------------------------------------- ----------
         1 곽한얼                         1993-09-17          0 010-9379-5209                                       1          1          1   15000000     150000 930917 =o??                                                     0

*/

--○ 커밋
COMMIT;
--==>> 커밋 완료.
--※ 테이블 구조를 변경하였기 때문에
--   이와 관련한 뷰(EMPLOYEEVIEW) 의 내용을 새로 작성(수정)

CREATE OR REPLACE VIEW EMPLOYEEVIEW
AS
SELECT E.EMPLOYEEID AS EMPLOYEEID
      ,E.NAME AS NAME
      ,E.SSN1 AS SSN 
      ,TO_CHAR(E.BIRTHDAY,'YYYY-MM-DD') AS BIRTHDAY
      ,E.LUNAR AS LUNAR
      ,DECODE(E.LUNAR,0,'양력',1,'음력') AS LUNARNAME
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
--==>> View EMPLOYEEVIEW 이(가) 생성되었습니다.

--○ 확인
SELECT *
FROM EMPLOYEEVIEW;
/*
EMPLOYEEID NAME                           SSN    BIRTHDAY        LUNAR LU TELEPHONE                                DEPARTMENTID DEPARTMENTNAME                 POSITIONID POSITIONNAME                     REGIONID REGIONNAME                       BASICPAY   EXTRAPAY        PAY      GRADE
---------- ------------------------------ ------ ---------- ---------- -- ---------------------------------------- ------------ ------------------------------ ---------- ------------------------------ ---------- ------------------------------ ---------- ---------- ---------- ----------
         1 곽한얼                         930917 1993-09-17          0 양력 010-9379-5209                                       1 개발부                                  1 사원                                    1 서울                             15000000     150000   15150000          0
*/


DESC EMPLOYEEVIEW;

/*
이름             널?       유형           
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

--○ 직원 데이터 입력 쿼리문 구성(수정된 내용)
INSERT INTO EMPLOYEE( EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNAR
                    , TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID
                    , BASICPAY, EXTRAPAY)
VALUES (EMPLOYEESEQ.NEXTVAL, '권홍비', '950410', '2323234'
      , TO_DATE('1995-04-10', 'YYYY-MM-DD'), 0, '010-9962-9626', 1, 1, 1
      , 1500000, 150000 )
;  -- 백오십만, 십오만
--==>> 1 행 이(가) 삽입되었습니다.

--> 한줄 구성
INSERT INTO EMPLOYEE( EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY, LUNA, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID, BASICPAY, EXTRAPAY) VALUES (EMPLOYEESEQ.NEXTVAL, '권홍비', '950410', CRYPTPACK.ENCRYPT('2323234', '2323234'), TO_DATE('1995-04-10', 'YYYY-MM-DD'), 0, '010-9962-9626', 1, 1, 1, 1500000, 150000 )
; 



SELECT *
FROM EMPLOYEE;
/*
<EMPLOYEE>
EMPLOYEEID NAME                           BIRTHDAY        LUNAR TELEPHONE                                DEPARTMENTID POSITIONID   REGIONID   BASICPAY   EXTRAPAY SSN1   SSN2                                                    GREDE      GRADE
---------- ------------------------------ ---------- ---------- ---------------------------------------- ------------ ---------- ---------- ---------- ---------- ------ -------------------------------------------------- ---------- ----------
         1 곽한얼                         1993-09-17          0 010-9379-5209                                       1          1          1   15000000     150000 930917 =o??                                                     0          0
         2 권홍비                         1995-04-10          0 010-9962-9626                                       1          1          1    1500000     150000 950410 ?P4?                                                     1          1

<EMPLOYEEVIEW>
EMPLOYEEID NAME                           SSN    BIRTHDAY        LUNAR LU TELEPHONE                                DEPARTMENTID DEPARTMENTNAME                 POSITIONID POSITIONNAME                     REGIONID REGIONNAME                       BASICPAY   EXTRAPAY        PAY      GRADE
---------- ------------------------------ ------ ---------- ---------- -- ---------------------------------------- ------------ ------------------------------ ---------- ------------------------------ ---------- ------------------------------ ---------- ---------- ---------- ----------
         1 곽한얼                         930917 1993-09-17          0 양력 010-9379-5209                                       1 개발부                                  1 사원                                    1 서울                             15000000     150000   15150000          0
         2 권홍비                         950410 1995-04-10          0 양력 010-9962-9626                                       1 개발부                                  1 사원                                    1 서울                              1500000     150000    1650000          1
*/

--○ 일반 사원 로그인 쿼리문 구성(ID → EMPLOYEEID, PW → SSN2)
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID='ID문자열'
  AND SSN2 = ( SELECT SSN2
               FROM EMPLOYEE
               WHERE EMPLOYEEID='ID문자열');
               
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = ( SELECT SSN2
               FROM EMPLOYEE
               WHERE EMPLOYEEID=2);
--==>> 권홍비

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND ( SELECT SSN2
        FROM EMPLOYEE
        WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('2323232', '2323232');
--==>> 조회 결과 없음 → 로그인 실패

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND ( SELECT SSN2
        FROM EMPLOYEE
        WHERE EMPLOYEEID=2) = CRYPTPACK.ENCRYPT('2323234', '2323234');
--==>> 조회 결과 : 권홍비 → 로그인 성공 

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('2323234', '2323234');
--    ---- 이 부분만 수정.  
--==>> 조회 결과 : 권홍비 → 로그인 성공 

SELECT NAME 
FROM EMPLOYEE 
WHERE EMPLOYEEID='ID문자열' 
  AND SSN2 = CRYPTPACK.ENCRYPT('PW문자열', 'PW문자열');

--> 한줄구성
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID='ID문자열' AND SSN2 = CRYPTPACK.ENCRYPT('PW문자열', 'PW문자열');

--○ 관리자 로그인 쿼리문 구성(ID → EMPLOYEEID, PW → SSN2, GRADE=0) 
SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=2
  AND SSN2 = CRYPTPACK.ENCRYPT('2323234', '2323234')
  AND GRADE = 0;
--==>> 조회 결과 없음 → 로그인 실패 

SELECT NAME
FROM EMPLOYEE
WHERE EMPLOYEEID=1
  AND SSN2 = CRYPTPACK.ENCRYPT('1234567', '1234567')
  AND GRADE = 0;
--==>> 조회 결과 : 곽한얼 → 로그인 성공

--> 관리자 로그인 쿼리문 한줄구성
SELECT NAME FROM EMPLOYEE WHERE EMPLOYEEID='ID문자열' AND SSN2 = CRYPTPACK.ENCRYPT('PW문자열', 'PW문자열') AND GRADE = '관리자등급문자열';

--○ 직원 데이터 삭제 쿼리문 구성
DELETE 
FROM EMPLOYEE
WHERE EMPLOYEEID=2;
--> 한줄 구성
DELETE FROM EMPLOYEE WHERE EMPLOYEEID=2
;


--○ 직원 데이터 수정 쿼리문 구성
UPDATE EMPLOYEE
SET NAME='곽한얼'
  , BIRTHDAY=TO_DATE('2001-01-01', 'YYYY-MM-DD')
  , LUNAR=0
  , TELEPHONE='010-1111-2222'
  , DEPARTMENTID=2
  , POSITIONID=2
  , REGIONID=2
  , BASICPAY=2000000    -- 이백만
  , EXTRAPAY=200000     -- 이십만
  , SSN1='010101'
  , SSN2=CRYPTPACK.ENCRYPT('3234567', '3234567')
  , GRADE=1
WHERE EMPLOYEEID=1;
--> 한줄 구성
UPDATE EMPLOYEE SET NAME='곽한얼', BIRTHDAY=TO_DATE('2001-01-01', 'YYYY-MM-DD'), LUNAR=0, TELEPHONE='010-1111-2222', DEPARTMENTID=2, POSITIONID=2, REGIONID=2, BASICPAY=2000000, EXTRAPAY=200000, SSN1='010101', SSN2=CRYPTPACK.ENCRYPT('3234567', '3234567'), GRADE=1 WHERE EMPLOYEEID=1
;

SELECT *
FROM EMPLOYEE;

ROLLBACK;


DESC EMPLOYEEVIEW;

SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, LUNARNAME				
       , TELEPHONE, DEPARTMENTID, DEPARTMENTNAME, POSITIONID, POSITIONNAME	
       , REGIONID, REGIONNAME, BASICPAY, EXTRAPAY, PAY						
FROM EMPLOYEEVIEW	
;

SELECT *					
FROM EMPLOYEEVIEW;