select * from hubo_table;
select * from tupyo_table;
drop table tupyo_table;


#가상 투표결과 만들기
drop procedure if exists input_data;
delimiter $$
create procedure input_data(_limit integer)
begin
declare _cnt integer;
declare _tupyo_kiho integer;
declare _tupyo_age integer;
delete from tupyo_table where tupyo_age>0;
SET _cnt=0;
_loop :LOOP
SET _cnt=_cnt+1;
SET _tupyo_kiho = floor(rand()*4+1);
SET _tupyo_age = floor(rand()*9+1);
insert into tupyo_table value (_tupyo_kiho,_tupyo_age);
if _cnt=_limit THEN
LEAVE _loop;
END IF;
END LOOP _loop;
END $$

call input_data(1000);