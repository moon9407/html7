--[[수업 정리 부분]]
-- [컬럼 순서 변경]
alter table student3 modify sdate invisible; --사라지게하기
alter table student3 modify sdate visible;   --다시 보이게 하기

-- 범위검색(between 값and값)
select emp_name,salary from employees
where salary between 6000 and 7000;

-- 같은경우 검색 (in(값,값,값))
select emp_name,salary from employees
where salary in(6000,7000,8000);

--------------------------------------------------------------------------------
-- [like 검색]
-- %,_
-- % : 순서와 상관 없이 어떤 문자가 들어와도 검색
-- _ : 1개의 문자순서
-- like '%a%': a 포함 단어검색,'a%'첫글자가 a인 단어검색 ,'%a' 마지막글자가 a인 단어검색 , '_a%'두번째글자가 a인 단어검색
-- 특수기호 검색 : like '#_' escape '#' 로 검색
-- null 검색 : is null로 기입
select emp_name from employees
where emp_name='Donald OConnell';

select salary from employees
where salary = 6000;

select emp_name from employees
where emp_name like 'D%';

select emp_name from employees
where emp_name like '%d%';

select * from customers;
-- cust_city ge가 들어가는 도시를 검색
select cust_city from customers
where lower(cust_city) like '%g%';

--대소문자 구분없이 검색
select upper(cust_city) from customers;

select * from member;
-- 이름에 홍이 들어간 회원 출력
select * from member
where name like '%홍%';
-- 이메일에서 man 들어가 있는 회원 검색
select * from member
where email like '%man%';
-- 끝에 n 들어간 사람
select * from member
where email like '%n';
--두번째에 n이 들어간 사람
select * from member
where email like '_n%';
--세번째에 n이 들어간 사람
select * from member
where email like '__n%';


select job_id from employees;

select job_id from employees
where job_id = 'SH_CLERK';

-- 특수기호를 문자처리
select job_id from employees
where job_id like '%#_%' escape '#';


select manager_id from employees;

-- null 검색 : is null로 기입 in not null
select manager_id from employees
where manager_id is null;

-- null 다른 것으로 대체 nvl()
-- salary + (salary*commission_pct) 출력하시오.
select salary,salary+(salary*nvl(commission_pct,0)) real_salary,
(salary+(salary*nvl(commission_pct,0)))*1473 real_ksalary from employees;
-- null -> ceo
-- to_char: number 타입을 varchar2 타입으로 변경
select nvl(to_char(manager_id),'ceo') from employees;

desc employees;

select * from employees;

-- 정렬 : order by asc:순차정렬(기본값default), desc: 역순정렬

select emp_name from employees
order by emp_name asc; -- 순차정렬(오름차순)

select emp_name from employees
order by emp_name desc; --역순정렬(내림차순)

-- a가 들어가 있는 사원을 역순정렬로 출력하시오.
select emp_name from employees
where emp_name like '%a%' order by emp_name desc;

select hire_date from employees
order by hire_date desc;

-- member 테이블에서 이름을 순차정렬하시오.
select * from member
order by name desc;

--employees 에서 salary 역순정렬 하시오. -> 매니저아이디가 null ->ceo
-- 연봉이 8000이상이면서 이름에 p,P 가 들어간 사원만 출력
select emp_name,nvl(to_char(manager_id),'ceo'),salary from employees
where salary>=8000 and lower(emp_name) like '%p%'
order by salary desc;

select * from employees;

-- 대,소문자 상관없이 이름에 z 거나 email에 z 가 포함되어 있는 사원을 출력하시오.
select * from employees
where lower(emp_name) like '%z%' or lower(email) like '%z%';

select * from student;

select * from employees;
-- department_id 로 순차정렬하고, salary 역순정렬 하시오.
select * from employees
order by department_id asc, salary desc; --앞에 먼저 적용 후 동일한 값이 있을 경우 뒤에 내용 적용

-- 같은 부서 내에 입사일이 빠른 사원부터 출력하시오
select * from employees
order by department_id, hire_date;

select salary "연봉" from employees;
-- nvl() : null 값이 있을 경우 대체함수
-- null 
select commission_pct,nvl(commission_pct,0)+100 from employees;
select manager_id, nvl(manager_id,0),nvl(to_char (manager_id),'ceo') from employees;

-------------------------------------------------------------------------------
--[숫자함수]
select 10 from dual; -- 마땅한 테이블 없을 때 가상테이블 적용
-- abs() : 절대값 출력
select 10,abs(-10) from dual;  
-- floor() : 버림, ceil() : 올림
select abs(10.598), ceil(10.2) from dual; 
-- round(값,출력자리수) : 반올림    -값 하면 정수부분 반올림
select round(10.2587),round(10.2587,2),round(10.2587,3),round(35.2587,-1) from dual;
-- trunc(값,출력자리수): 버림
select trunc(34.5678,2),trunc(34.5678,3),trunc(34.5678,-1) from dual;
-- mod(값,나눌 값) : 나머지
select mod(27,2),mod(27,2) from dual;

-- 사원 번호가 홀수 인 것을 출력하시오.
--employees, employee_id
select emp_name,employee_id from employees
where mod(employee_id,2) =1;
-------------------------------------------------------------------------------
--[시퀀스 함수] : 순차적으로 순번을 증가시킬 때 사용하는 함수
create sequence member_seq -- 시퀀스 생성 이름:member_seq
increment by 1             -- 1씩 증가
start with 1               -- 1부터 시작
minvalue 1                 -- 최소값
maxvalue 9999              -- 최대값
nocycle;                   -- 9999이후에는 에러/  cycle: 9999 -> 1
--cache;                     -- 캐쉬(메모리)에 시퀸스값 미리저장/ nocache : 저장x

select member_seq.nextval from dual; -- .nextval : 번호 생성
select member_seq.currval from dual; -- .currval() : 현재 번호 확인

-- eployee_seq 생성
create sequence employee_seq
increment by 1             
start with 1               
minvalue 1                 
maxvalue 9999              
nocycle
nocache
;

select employee_seq.nextval from dual;
select employee_seq.currval from dual;
-- [시퀀스 수정]
alter sequence employee_seq restart start with 1; --초기화
alter sequence employee_seq increment by 2; -- 2씩 증가로 변경
drop sequence employee_seq;                 -- 시퀀스 삭제
--------------------------------------------------------------------------------

update stuscore set avg = total/3;
select * from stuscore;

alter table stuscore modify avg number(10,7);

commit;


select * from stuscore
order by kor desc,eng asc;


select * from stuscore;

insert into stuscore values(
    stuscore_seq.nextval,'홍길동',100,100,99,(100+100+99),(100+100+99)/3,sysdate
)
;
commit;


--[[수업 내용 정리]]
--------------------------------------------------------------------------------





