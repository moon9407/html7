-- ddl 테이블 생성,수정,삭제 할때 명령어 

-- 테이블 생성
create table member(
 id varchar2(100) primary key,
 pw varchar2(100),
 name varchar2(50)
);
-- ------------------------------------------------
-- dml 테이블안에 데이터 추가,수정,삭제,검색할때 명령어

-- 테이블의 데이터 추가 - insert
insert into member (id,pw,name) values (
'aaa','1111','홍길동'
);
-- bbb,2222, 유관순
insert into member (id,pw,name) values (
'bbb','2222','유관순'
);
-- ccc,3333, 이순신
insert into member (id,pw,name) values (
'ccc','3333','이순신'
);
-- ddd,4444, 김구
insert into member (id,pw,name) values (
'ddd','4444','김구'
);
-- eee,5555 강감찬
insert into member (id,pw,name) values (
'eee','5555','강감찬'
);

insert into member(id,pw,name) values (
'fff','6666','김유신'
);

insert into member(id,pw,name) values (
'ggg','7777','홍길자'
);

-- 삭제
delete member where id='aaa';

delete member;


-- 임시저장만 됨.
-- commit : 저장완료
commit;

rollback;

-- 테이블의 데이터 검색 - select
select id,pw,name from member;

-- 테이블의 데이터 수정 - update
update member set pw='7777' where id='aaa';

select * from member;

-- 테이블의 타입 확인
desc member;

