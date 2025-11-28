-- [[ 수업 정리 ]]

--- 컬럼순서 변경
alter table student3 modify sdate invisible;
alter table student3 modify sdate visible;

-- 범위검색 (between - and)
select salary from employees
where salary between 6000 and 7000;

-- 같은경우검색 (in)
select salary from employees
where salary in(6000,7000,8000);

-------------------------------
-- like 검색 %,_
-- % 순서와 상관없이 어떤 문자가 들어와도 검색
-- _ 1개의 문자순서
-- like '%a%' : a가 포함되어 있는 것, 'a%' : 첫글자가 a가 들어가 있는 것
-- '%a' : a가 마지막에 들어가 있는 것, '_a%' : 두번째에 a가 들어가 있는 것 
select emp_name from employees
where emp_name like 'Do%';

select emp_name from employees
where emp_name like '%d%';

select * from member
where email like '%n';

select * from member
where email like '__n%';

-- _ 를 검색할때 #을 붙이고 escape을 추가하면 _문자 검색가능
select job_id from employees
where job_id like '%#_M%' escape '#';

-- null검색 : is null, is not null
select manager_id from employees
where manager_id is null;

-- null다른 것으로 대체 nvl()
-- salary + (salary*commission_pct) 출력하시오.
select salary,salary+(salary*nvl(commission_pct,0)) real_salary ,
(salary+(salary*nvl(commission_pct,0)))*1473 real_ksalary from employees;

-- null -> to_char : number타입을 varchar2타입으로 변경
select manager_id,nvl(manager_id,0),
nvl(to_char(manager_id),'ceo') from employees;

-- 숫자함수

select 10 from dual;
-- abs 절대값
select 10,abs(-10) abs from dual;
--floor 버림, round 반올림,ceil 올림
select floor(10.598),round(10.598),ceil(10.2) from dual;

-- round 반올림 : round(값,반올림자리수)
select round(10.2587),round(10.2587,2),round(10.2587,3),round(35.2587,-1) from dual;

-- trunc : 버림 trunc(값,자리수)
select trunc(34.5678,2),trunc(34.5678,3),trunc(34.5678,-1) from dual;

-- mode : 나머지
select mod(27,2), mod(27,5) from dual;

-- 사원번호가 홀수 인것을 출력하시오.
-- employees, employee_id
select employee_id from employees
where mod(employee_id,2)=0;

-- 시퀀스함수 : 순차적으로 순번을 증가시킬때 사용하는 함수
-- nextval : 번호생성-번호증가됨 , currval : 번호확인
-- 시퀀스 생성
create sequence employee_seq    -- 시퀀스 생성 이름 : member_seq
increment by 1   -- 증감 1
start with 1     -- 1부터 시작
minvalue 1       -- 최소값
maxvalue 9999    -- 최대값
nocycle          -- 9999이후에는 에러
nocache          -- 숫자를 미리 할당 ( 속도느림 ) 
; 
-- 시퀀스 수정
alter sequence employee_seq increment by 2;
-- 시퀀스 삭제
drop sequence employee_seq;


-- [[ 수업정리 끝 ]]
----------------------------------------------------




-- sdate컬럼을 name컬럼 뒤에 배치하시오.
alter table student3 modify sdate invisible;
alter table student3 modify kor invisible;
alter table student3 modify eng invisible;
alter table student3 modify math invisible;
alter table student3 modify total invisible;
alter table student3 modify avg invisible;

alter table student3 modify sdate visible;
alter table student3 modify kor visible;
alter table student3 modify eng visible;
alter table student3 modify math visible;
alter table student3 modify total visible;
alter table student3 modify avg visible;

update student3 set total = kor+eng+math,avg = (kor+eng+math)/3;
commit;

drop table student3;

select * from employees;

-- select,update,delete,insert 
select * from student3;

insert into student3 (sno,name,kor,eng,math,sdate,total,avg) values(
5,'강감찬',75,70,79,sysdate,(75+70+79),(75+70+79)/3
);

commit;


-------------------------
-- employees테이블에서 월급6000이상~7000이하 사원을 검색하시오.
-- 비교연산자, between and
select salary from employees
where salary>=6000 and salary<=7000;

select salary from employees
where salary between 6000 and 7000;

-- 6000,7000,8000 사원을 검색하시오.
select salary from employees
where salary in(6000,7000,8000);

select salary from employees
where salary=6000 or salary=7000 or salary=8000;

-------------------------------
-- like 검색 %,_
-- % 순서와 상관없이 어떤 문자가 들어와도 검색
-- _ 1개의 문자순서
-- like '%a%' : a가 포함되어 있는 것, 'a%' : 첫글자가 a가 들어가 있는 것
-- '%a' : a가 마지막에 들어가 있는 것, '_a%' : 두번째에 a가 들어가 있는 것 
select emp_name from employees
where emp_name like 'Do%';

select emp_name from employees
where emp_name like '%d%';

select * from member
where email like '%n';

select * from member
where email like '__n%';

-- _ 를 검색할때 #을 붙이고 escape을 추가하면 _문자 검색가능
select job_id from employees
where job_id like '%#_M%' escape '#';

select salary from employees
where salary = 6000;

select emp_name from employees
where emp_name='Donald OConnell';





select * from customers;
-- cust_city ge가 들어가는 도시를 검색하시오.
select cust_city from customers
where lower(cust_city) like '%g%';

-- 대소문자 구분없이 검색
select lower(cust_city) from customers;

select * from member;

-- 이름 홍이 들어가 있는 회원을 검색하시오.
select * from member
where name like '%홍%';

-- 이메일에서 man 들어가 있는 회원을 검색하시오.
select * from member
where email like '%man%';




select * from employees;

select job_id from employees;

select job_id from employees
where job_id = 'SH_CLERK';


select * from employees;

select manager_id from employees;

-- null검색 : is null, is not null
select manager_id from employees
where manager_id is null;

-- null다른 것으로 대체 nvl()
-- salary + (salary*commission_pct) 출력하시오.
select salary,salary+(salary*nvl(commission_pct,0)) real_salary ,
(salary+(salary*nvl(commission_pct,0)))*1473 real_ksalary from employees;

-- null -> to_char : number타입을 varchar2타입으로 변경
select manager_id,nvl(manager_id,0),
nvl(to_char(manager_id),'ceo') from employees;

desc employees;

select * from employees;

-- 정렬 : order by asc : 순차정렬,오름차순정렬 desc : 역순정렬,내림차순정렬

select emp_name from employees
order by emp_name asc; -- 순차정렬

select emp_name from employees
order by emp_name desc; -- 역순정렬

--- a가 들어가 있는 사원을 역순정렬로 출력하시오.
select emp_name from employees
where emp_name like '%a%'
order by emp_name desc;

select hire_date from employees
order by hire_date asc;

-- member테이블에서 이름을 순차정렬하시오.
select * from member
order by name ;

-- employees salary 역순정렬하시오. -> null,ceo
-- 8000이상이면서 이름에 p,P 들어가는 사원 출력하시오.

select emp_name,nvl(to_char(manager_id),'ceo'),salary from employees
where salary>=8000 and lower(emp_name) like '%p%'
order by salary desc
;

select * from employees;

-- 이름에 z,Z 거나 email z,Z가 들어가 있는 사원을 출력하시오.
select * from employees
where lower(emp_name) like '%z%' or lower(email) like '%z%';

select * from student;

select * from employees;
--- department_id 로 순차정렬하고, salary 역순정렬을 하시오.

select department_id,salary from employees
order by department_id asc,salary desc;

-- 같은 부서내에 입사일이 빠른 사원부터 출력하시오.
-- department_id, hire_date
select department_id,hire_date from employees
order by department_id asc,hire_date asc;

select salary 년봉 from employees;

--nvl() : null값이 있을경우 대체함수
-- null 
select commission_pct,nvl(commission_pct,0)+100 from employees;
select manager_id,nvl(manager_id,0),nvl(to_char(manager_id),'ceo') from employees;

--------------------------------

select 10 from dual;
-- abs 절대값
select 10,abs(-10) abs from dual;
--floor 버림, round 반올림,ceil 올림
select floor(10.598),round(10.598),ceil(10.2) from dual;

-- round 반올림 : round(값,반올림자리수)
select round(10.2587),round(10.2587,2),round(10.2587,3),round(35.2587,-1) from dual;

-- trunc : 버림 trunc(값,자리수)
select trunc(34.5678,2),trunc(34.5678,3),trunc(34.5678,-1) from dual;

-- mode : 나머지
select mod(27,2), mod(27,5) from dual;

-- 사원번호가 홀수 인것을 출력하시오.
-- employees, employee_id
select employee_id from employees
where mod(employee_id,2)=0;


-- 시퀀스함수 : 순차적으로 순번을 증가시킬때 사용하는 함수
-- nextval : 번호생성-번호증가됨 , currval : 번호확인
create sequence member_seq    -- 시퀀스 생성 이름 : member_seq
increment by 1   -- 증감 1
start with 1     -- 1부터 시작
minvalue 1       -- 최소값
maxvalue 9999    -- 최대값
nocycle          -- 9999이후에는 에러
--cache
;           -- 메모리에 시퀀스값 미리 할당


select member_seq.nextval from dual;

select member_seq.currval from dual;

-- employee_seq 생성

-- 시퀀스 생성
create sequence employee_seq    -- 시퀀스 생성 이름 : member_seq
increment by 1   -- 증감 1
start with 1     -- 1부터 시작
minvalue 1       -- 최소값
maxvalue 9999    -- 최대값
nocycle          -- 9999이후에는 에러
nocache          -- 숫자를 미리 할당 ( 속도느림 ) 
; 

-- 시퀀스 수정
alter sequence employee_seq increment by 2;

-- 시퀀스 삭제
drop sequence employee_seq;


create table board (
bno number(4) primary key,
btitle varchar2(2000),
bcontent clob,   -- 4Gb varchar2(4000byte)
id varchar2(100),
bgroup number(4),
bstep number(4),
bindent number(4),
bhit number(4),
bfile varchar2(1000),
bdate date
);

-- drop table board;


insert into board values(
board_seq.nextval,'제목입니다.','내용입니다.',board_seq.currval,
0,0,0,'1.jpg',sysdate
);

insert into board values(
board_seq.nextval,'제목입니다.2','내용입니다.2',board_seq.currval,
0,0,0,'1.jpg',sysdate
);

insert into board values(
board_seq.nextval,'제목입니다.3','내용입니다.3',board_seq.currval,
0,0,0,'1.jpg',sysdate
);


select board_seq.nextval from dual;

select * from board;











create table board (
	bno number(4),
	btitle VARCHAR2(2000),
	bcontent clob,
	id varchar2(100),
	bgroup number(4),
	bstep number(4),
	bindent number(4),
	bhit number(4),
	bfile varchar2(1000),
	bdate DATE
);

insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (1, 'Navigators, The', '1200 E. WARRENVILLE RD', 'aaa', 1, 0, 0, 0, '1.jpg', '2025-11-16');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (2, 'The African', '2ND FLOOR', 'aaa', 2, 0, 0, 0, '1.jpg', '2025-07-23');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (3, 'Mon oncle d''Amérique', '1 RUE VICTOR BASCH CS 70001', 'bbb', 3, 0, 0, 0, '1.jpg', '2025-04-30');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (4, 'Graduation Day', 'Bahnhofstraße 21-29', 'aaa', 4, 0, 0, 0, '1.jpg', '2025-04-07');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (5, 'Why Man Creates', 'VA2-430-01-01', 'bbb', 5, 0, 0, 0, '1.jpg', '2025-04-05');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (6, 'Witch Way Love (Un amour de sorcière)', '1620 DODGE STREET', 'ccc', 6, 0, 0, 0, '1.jpg', '2024-12-24');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (7, 'Ghost Rider', 'PO BOX 550', 'bbb', 7, 0, 0, 0, '1.jpg', '2025-06-13');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (8, 'B*A*P*S', 'Goethestraße 36', 'aaa', 8, 0, 0, 0, '1.jpg', '2025-02-07');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (9, 'Asphalt', '6TH FLOOR', 'aaa', 9, 0, 0, 0, '1.jpg', '2025-03-25');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (10, 'Khroustaliov, My Car! (Khrustalyov, mashinu!)', '205 S FIFTH STREET', 'bbb', 10, 0, 0, 0, '1.jpg', '2025-10-03');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (11, 'Eternity and a Day (Mia aoniotita kai mia mera)', '3 Main Street, Wicklow Town,', 'ccc', 11, 0, 0, 0, '1.jpg', '2024-12-16');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (12, 'Flushed Away', 'Mönchstraße 24', 'ccc', 12, 0, 0, 0, '1.jpg', '2025-08-02');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (13, 'Forest Warrior', 'PIAZZA DEL CALENDARIO, 3', 'ccc', 13, 0, 0, 0, '1.jpg', '2025-08-18');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (14, 'To the Devil a Daughter', 'Friedrich Wilhelm Raiffeisen-Straße, 1', 'aaa', 14, 0, 0, 0, '1.jpg', '2025-06-20');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (15, 'Empire Records', 'PIAZZA FILIPPO MEDA 4', 'aaa', 15, 0, 0, 0, '1.jpg', '2025-06-08');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (16, 'Charlie Chan''s Courage', 'PIAZZA FILIPPO MEDA 4', 'bbb', 16, 0, 0, 0, '1.jpg', '2025-10-14');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (17, 'Story of Dr. Wassell, The', '101 NORTH CHICAGO STREET', 'aaa', 17, 0, 0, 0, '1.jpg', '2024-11-29');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (18, 'Miss Julie', 'Havenlaan, 2', 'bbb', 18, 0, 0, 0, '1.jpg', '2025-09-28');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (19, 'Spider-Man 2', 'Bahnhofstraße 9', 'ccc', 19, 0, 0, 0, '1.jpg', '2025-03-04');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (20, 'Back Street', 'PIAZZA AGLIARDI, 1', 'aaa', 20, 0, 0, 0, '1.jpg', '2025-09-07');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (21, 'House Party 3', 'PIAZZA SAN CARLO, 156', 'bbb', 21, 0, 0, 0, '1.jpg', '2025-09-02');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (22, 'Last Witness, The', 'Sarsfield Street, Mountmellick,', 'aaa', 22, 0, 0, 0, '1.jpg', '2025-03-15');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (23, 'Threesome', '7, rue du Saint Esprit', 'aaa', 23, 0, 0, 0, '1.jpg', '2024-12-17');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (24, 'Walker', '105 CITY AVE. N', 'aaa', 24, 0, 0, 0, '1.jpg', '2025-08-18');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (25, 'Traces of Red', 'ACH OPERATIONS 100-99-04-10', 'aaa', 25, 0, 0, 0, '1.jpg', '2025-10-20');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (26, 'Concert for George, The', '5050 KINGSLEY DRIVE', 'ccc', 26, 0, 0, 0, '1.jpg', '2025-11-25');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (27, 'Dark House', 'SUITE 330', 'aaa', 27, 0, 0, 0, '1.jpg', '2025-11-24');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (28, 'Volunteers', '811 MAIN', 'ccc', 28, 0, 0, 0, '1.jpg', '2025-04-03');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (29, 'Day of the Locust, The', 'P O BOX 291', 'bbb', 29, 0, 0, 0, '1.jpg', '2025-02-02');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (30, '100 Men and a Girl (One Hundred Men and a Girl)', 'Nesselwanger Straße 20', 'ccc', 30, 0, 0, 0, '1.jpg', '2025-01-26');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (31, 'Pekka ja Pätkä puistotäteinä', 'PIAZZA FILIPPO MEDA 4', 'ccc', 31, 0, 0, 0, '1.jpg', '2025-02-09');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (32, 'This Above All', 'Pz de San Nicolás, 4', 'bbb', 32, 0, 0, 0, '1.jpg', '2025-10-12');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (33, 'Bambi', 'VIA DEL MACELLO, 55', 'bbb', 33, 0, 0, 0, '1.jpg', '2025-09-03');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (34, 'Power of Nightmares, The: The Rise of the Politics of Fear', '220 S DETROIT ST', 'ccc', 34, 0, 0, 0, '1.jpg', '2025-01-22');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (35, 'Olympian Holiday (Loma) ', '110 S FERRALL STREET', 'bbb', 35, 0, 0, 0, '1.jpg', '2025-01-28');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (36, 'Mutant Action (Acción Mutante)', 'Bahnhofstraße, 9', 'bbb', 36, 0, 0, 0, '1.jpg', '2025-06-02');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (37, 'Renaissance Man', '245 COMMERCIAL STREET', 'ccc', 37, 0, 0, 0, '1.jpg', '2025-03-19');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (38, 'Cowboys & Aliens', 'Main Street, Rathfarnham,', 'bbb', 38, 0, 0, 0, '1.jpg', '2025-03-11');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (39, 'My Favorite Brunette', '202 E 11TH STREET', 'bbb', 39, 0, 0, 0, '1.jpg', '2025-07-02');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (40, 'Other People''s Money', 'PIAZZA FILIPPO MEDA 4', 'bbb', 40, 0, 0, 0, '1.jpg', '2025-08-13');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (41, 'Juwanna Mann', '320 N MAIN', 'ccc', 41, 0, 0, 0, '1.jpg', '2025-08-22');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (42, 'Time That Remains, The', '9600 W. BRYN MAWR', 'aaa', 42, 0, 0, 0, '1.jpg', '2025-03-18');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (43, 'Mishen (Target)', '2910 W. JACKSON ST', 'ccc', 43, 0, 0, 0, '1.jpg', '2025-05-20');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (44, 'Garden of Words, The (Koto no ha no niwa)', '200 WEST CONGRESS STREET', 'bbb', 44, 0, 0, 0, '1.jpg', '2024-12-09');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (45, 'Tuesday, After Christmas (Marti, dupa craciun)', '313 FREDERICA ST', 'aaa', 45, 0, 0, 0, '1.jpg', '2025-08-11');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (46, 'Prince of the City', 'Coolsingel 139', 'aaa', 46, 0, 0, 0, '1.jpg', '2025-04-17');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (47, 'Superstar: The Karen Carpenter Story', 'Schulstraße 38', 'aaa', 47, 0, 0, 0, '1.jpg', '2025-08-06');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (48, 'Empire of Silver (Bai yin di guo)', '12 PLACE DES ETATS UNIS CS 20001', 'bbb', 48, 0, 0, 0, '1.jpg', '2025-11-04');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (49, 'Pompeii', '1433 OXFORD STREET', 'aaa', 49, 0, 0, 0, '1.jpg', '2025-07-26');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (50, 'Land and Freedom (Tierra y libertad)', 'Teichstraße 24', 'bbb', 50, 0, 0, 0, '1.jpg', '2025-02-22');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (51, 'Mackintosh Man, The', '800 BROADWAY', 'ccc', 51, 0, 0, 0, '1.jpg', '2025-05-30');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (52, 'Dark Side of the Sun, The', '245 BELGRADE AVE', 'aaa', 52, 0, 0, 0, '1.jpg', '2025-11-08');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (53, 'Duck Season (Temporada de patos)', '610 W. RANDOL MILL RD.', 'aaa', 53, 0, 0, 0, '1.jpg', '2025-01-05');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (54, 'I''m Still Here', 'Bergstraße 6', 'ccc', 54, 0, 0, 0, '1.jpg', '2025-03-25');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (55, 'Mike Birbiglia: What I Should Have Said Was Nothing', '310 HOWARD STREET', 'ccc', 55, 0, 0, 0, '1.jpg', '2025-07-26');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (56, 'Mulan', 'DRAWER 840', 'bbb', 56, 0, 0, 0, '1.jpg', '2025-08-15');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (57, 'Afflicted', 'Luitpoldstraße 14', 'aaa', 57, 0, 0, 0, '1.jpg', '2025-05-26');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (58, 'X-Files: I Want to Believe, The', 'Main Street, Manorhamilton,', 'bbb', 58, 0, 0, 0, '1.jpg', '2025-03-28');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (59, 'Are All Men Pedophiles', '118 JEFFERSON STREET', 'aaa', 59, 0, 0, 0, '1.jpg', '2025-09-09');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (60, 'Tenth Man, The', '333 E MAIN STREET', 'bbb', 60, 0, 0, 0, '1.jpg', '2025-04-27');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (61, 'Night They Raided Minsky''s, The (Night They Invented Striptease, The)', 'VIA NAZIONALE APPULA, 29', 'ccc', 61, 0, 0, 0, '1.jpg', '2025-08-13');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (62, 'Mistaken for Strangers', 'Bažnyčios g. 11', 'ccc', 62, 0, 0, 0, '1.jpg', '2025-07-08');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (63, 'Flintstones in Viva Rock Vegas, The', 'MAC N9301-041', 'bbb', 63, 0, 0, 0, '1.jpg', '2025-06-24');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (64, 'Hanna', '1220 E WARRENVILLE RD', 'aaa', 64, 0, 0, 0, '1.jpg', '2025-05-30');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (65, 'The Second Best Exotic Marigold Hotel', '80 SUGAR CREEK CENTER BLVD', 'bbb', 65, 0, 0, 0, '1.jpg', '2025-11-05');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (66, 'Man of Her Dreams (a.k.a. The Fiancé)', 'PIAZZA FILIPPO MEDA 4', 'aaa', 66, 0, 0, 0, '1.jpg', '2025-10-09');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (67, 'America''s Most Haunted Inns', '333 E MAIN ST', 'aaa', 67, 0, 0, 0, '1.jpg', '2024-12-31');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (68, 'Carnosaur 3: Primal Species', '28, Boulevard de Kockelscheuer', 'aaa', 68, 0, 0, 0, '1.jpg', '2024-12-09');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (69, 'Lucky Break (a.k.a. Paperback Romance)', '5050 KINGSLEY DRIVE', 'ccc', 69, 0, 0, 0, '1.jpg', '2025-10-29');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (70, 'Act of Killing, The', '1460 VALLEY RD', 'ccc', 70, 0, 0, 0, '1.jpg', '2025-10-24');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (71, 'Angst', '100 N. MARKET ST.', 'ccc', 71, 0, 0, 0, '1.jpg', '2025-06-06');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (72, 'Way Out West', 'VIALE ALTIERO SPINELLI, 30', 'ccc', 72, 0, 0, 0, '1.jpg', '2025-10-03');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (73, 'Hoodoo Ann', 'SUITE 5', 'bbb', 73, 0, 0, 0, '1.jpg', '2025-04-14');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (74, 'Sergeant York', 'PO BOX 1578', 'aaa', 74, 0, 0, 0, '1.jpg', '2025-08-08');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (75, 'Early Years: Erik Nietzsche Part 1, The (De unge år: Erik Nietzsche)', 'Landsvägen 40', 'bbb', 75, 0, 0, 0, '1.jpg', '2025-06-19');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (76, 'Syriana', 'Marktstraße 16', 'bbb', 76, 0, 0, 0, '1.jpg', '2024-12-26');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (77, 'Go-Between, The', 'THIRD FLOOR', 'aaa', 77, 0, 0, 0, '1.jpg', '2025-07-22');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (78, 'Sandlot, The', '12 PLACE DES ETATS UNIS', 'bbb', 78, 0, 0, 0, '1.jpg', '2025-09-06');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (79, 'Still Alice', 'VIA CERNAIA, 7', 'ccc', 79, 0, 0, 0, '1.jpg', '2025-04-06');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (80, 'Five Fingers', '1460 VALLEY ROAD', 'bbb', 80, 0, 0, 0, '1.jpg', '2025-10-08');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (81, 'Flesh for Frankenstein (a.k.a. Andy Warhol''s Frankenstein)', '1300 11TH STREET', 'ccc', 81, 0, 0, 0, '1.jpg', '2025-02-13');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (82, 'Officer and a Gentleman, An', 'Augustaanlage 61', 'aaa', 82, 0, 0, 0, '1.jpg', '2025-06-16');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (83, 'Boo to You Too! Winnie the Pooh', 'VIA GIANFRANCESCO MALFATTI, 2', 'bbb', 83, 0, 0, 0, '1.jpg', '2024-12-05');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (84, 'The Butterfly Effect', 'NY-31-17-0119', 'aaa', 84, 0, 0, 0, '1.jpg', '2025-11-16');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (85, 'Skyline', 'P.O. BOX 67', 'bbb', 85, 0, 0, 0, '1.jpg', '2025-06-09');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (86, 'Horror of Dracula (Dracula)', 'Raiffeisenplatz 1', 'bbb', 86, 0, 0, 0, '1.jpg', '2024-12-15');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (87, 'As You Like It', 'Hans-Strothoff-Platz 1', 'bbb', 87, 0, 0, 0, '1.jpg', '2025-11-18');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (88, 'Casshern', 'SUITE 600', 'bbb', 88, 0, 0, 0, '1.jpg', '2024-12-25');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (89, 'Squall, The', '1 PENNS WAY', 'ccc', 89, 0, 0, 0, '1.jpg', '2025-08-06');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (90, 'Skippy', 'Wallstraße 1', 'ccc', 90, 0, 0, 0, '1.jpg', '2024-12-31');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (91, 'Date with Judy, A', 'Am Ratsplatz 1', 'ccc', 91, 0, 0, 0, '1.jpg', '2025-03-28');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (92, 'Woodsman and the Rain (Kitsutsuki to ame)', 'PO BOX 1578', 'ccc', 92, 0, 0, 0, '1.jpg', '2025-11-12');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (93, 'Sheep Eaters (Lampaansyöjät)', 'Bridgetown, Kerrykeel, Letterkenny,', 'bbb', 93, 0, 0, 0, '1.jpg', '2025-04-06');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (94, 'Nicholas on Holiday', 'NY-31-17-0119', 'ccc', 94, 0, 0, 0, '1.jpg', '2025-09-21');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (95, 'Corridor, The (Koridorius)', 'VA2-430-01-01', 'bbb', 95, 0, 0, 0, '1.jpg', '2025-10-26');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (96, 'Deadly Voyage', 'VIA IV NOVEMBRE, 13', 'ccc', 96, 0, 0, 0, '1.jpg', '2025-07-09');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (97, 'Wonderful and Loved by All (Underbar och älskad av alla)', 'Teréz körút 55-57.', 'ccc', 97, 0, 0, 0, '1.jpg', '2025-02-17');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (98, 'King Kong Lives', '18 AVENUE FRANCOISE GIROUD', 'aaa', 98, 0, 0, 0, '1.jpg', '2025-10-02');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (99, '28 Hotel Rooms', '8001 VILLA PARK DRIVE', 'bbb', 99, 0, 0, 0, '1.jpg', '2025-05-07');
insert into board (bno, btitle, bcontent, id, bgroup, bstep, bindent, bhit, bfile, bdate) values (100, 'Magnificent Obsession', 'Junghofstraße 26', 'ccc', 100, 0, 0, 0, '1.jpg', '2025-05-26');

commit;

insert into board values(
board_seq.nextval,'제목입니다.','내용입니다.','aaa',board_seq.currval,
0,0,0,'1.jpg',sysdate
);

select board_seq.nextval from dual;


select * from board order by bno desc;

select bno from board
order by bno desc;



select * from member;

select * from member where name like '%홍%'
;

-- 월급이 6000달러 이상인 사람을 출력하시오.
select * from employees where salary>=6000
;

select * from employees where salary in (6000,7000,8000)
;


update stuscore set avg = total/3;

select * from stuscore;

alter table stuscore modify avg number(10,7);

commit;


select * from stuscore
order by kor desc,eng asc
;

select * from stuscore;

insert into stuscore values (
    stuscore_seq.nextval,'홍길동',100,100,99,(100+100+99),(100+100+99)/3,sysdate
)
;

select * from stuscore;

commit;
-----------------------------------------
-----------------------------------------









