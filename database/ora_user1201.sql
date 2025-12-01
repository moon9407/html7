select * from (
select rownum rnum, a.* from(select * from member order by id asc)a
)
where rnum>=11 and rnum<=20
;

-- select * from 테이블명
-- select * from (select 조건문)
-- 1. employees테이블에서 이름에 a가 들어가 있는 사람을 출력하시오.
select * from employees where emp_name like '%a%';
-- 2. 그 가운데, 월급이 7000$ 이상인 사람을 출력하시오
select * from (select * from employees where emp_name like '%a%')
where salary >= 7000;

select * from (select * from (select * from employees where emp_name like '%a%')
where salary >= 7000)
where hire_date>='2004/01/01';

select * from employees
where emp_name like '%a%' and salary >= 7000;



select * from(
select row_number() over(order by id asc) rnum,a.* from member a
)
where rnum>=11 and rnum<=20
;

select rownum,a.* from member a
order by id asc;

select  rownum,a.* from
(select * from member) a
;

-- 정렬이 없는 경우
select rownum,a.* from member a

;

-- 정렬이 있는 경우
select row_number() over(order by id asc),a.* from member a;

------------------------------------------------------
-- rank() over(), dense_rank() over()
select rank() over(order by total desc),dense_rank() over(order by total desc)
,name,total from stuscore;

select rank() over(order by name asc) ranks,name,avg from stuscore;

--------------------------------------------------------
select * from stuscore;

