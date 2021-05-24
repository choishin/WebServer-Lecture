select * from hubo_table;
select * from tupyo_table;

select count(tupyo_kiho) from tupyo_table;

#기호번호, 이름, 득표수, 득표율
select a.hubo_kiho, a.hubo_name, count(b.tupyo_kiho) as sum, (select count(b.tupyo_kiho)/count(tupyo_kiho) from tupyo_table)*100 from tupyo_table as b, hubo_table as a
where a.hubo_kiho=b.tupyo_kiho group by a.hubo_kiho;

#기호번호, 이름, 연령별 득표수, 득표율


select
b.hubo_kiho,
b.hubo_name,
(select count(*) from tupyo_table where tupyo_kiho=3 and tupyo_age=1),
(select count(*) from tupyo_table where tupyo_kiho=3 and tupyo_age=2),
(select count(*) from tupyo_table where tupyo_kiho=3 and tupyo_age=3),
(select count(*) from tupyo_table where tupyo_kiho=3 and tupyo_age=4),
(select count(*) from tupyo_table where tupyo_kiho=3 and tupyo_age=5),
(select count(*) from tupyo_table where tupyo_kiho=3 and tupyo_age=6),
(select count(*) from tupyo_table where tupyo_kiho=3 and tupyo_age=7),
(select count(*) from tupyo_table where tupyo_kiho=3 and tupyo_age=8),
(select count(*) from tupyo_table where tupyo_kiho=3 and tupyo_age=9)
from tupyo_table as b, hubo_table as a 
where a.hubo_kiho=3
group by a.hubo_kiho=3;