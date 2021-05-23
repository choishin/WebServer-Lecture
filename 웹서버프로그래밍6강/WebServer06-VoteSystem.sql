create database kopoctc;
use kopoctc;

select * from hubo_table;
DELETE FROM hubo_table WHERE hubo_kiho= 1 and hubo_name='김일돌';

#hubo_table : 후보자의 기호번호, 이름 을 작성
drop table hubo_table;
create table hubo_table (
hubo_kiho int not null primary key,
hubo_name varchar(20)
);

#tupyo_table : 투표용지 테이블 지지하는후보의 기호번호, 나이대
drop table tupyo_table;
create table tupyo_table (
tupyo_kiho int not null,
tupyo_age varchar(20)
);

#report_table : 후보에 대한 연령대별 선호도와 득표수 집계하는 테이블 
drop table report_table;
create table report_table (

);