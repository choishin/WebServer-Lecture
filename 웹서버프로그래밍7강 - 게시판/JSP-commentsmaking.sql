use kopoctc;

create table comments (
post_id int not null,
comment_name varchar(20),
comment_contents varchar(200),
comment_date datetime);

select * from gongji;
select * from comments;

select now();
select curtime();
SELECT date_format(now(),'%Y-%m-%d %I:%i:%s');
insert into comments(post_id,comment_name,comment_contents,comment_date) value (3153,'작성자','댓글',date_format(now(),'%Y-%m-%d %I:%i:%s'));
SELECT * FROM gongji WHERE title LIKE '%공지%' or content like '%공지%';

-- 시간대 맞추기 
select @@global.time_zone, @@session.time_zone;
set global time_zone='Asia/Seoul';
set time_zone = 'Asia/Seoul';

-- alter 
alter table gongji modify date datetime;
alter table comments modify comment_date datetime;
alter table gongji add viewcnt int;

-- update 
UPDATE comments SET comment_id =1 WHERE post_id = 3154;
update gongji set viewcnt = viewcnt+1 where id=1;

-- delete
delete from gongji where title='null';
delete from comments where post_id=5;
