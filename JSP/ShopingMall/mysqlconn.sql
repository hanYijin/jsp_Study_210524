create table member(
	id varchar(50) not null primary key,
	passwd varchar(16) not null,
	name varchar(10) not null,
	reg_date datetime not null
);

create table test(
	num_id int not null primary key auto_increment,
	title varchar(50) not null,
	content text not null
);

drop table test;

show tables;

insert into member(id, passwd, name, reg_date)
values ("gksdlwls123@naver.com", "1234","한이진",now());

select * from member;

update member set passwd='2930' where id='gksdlwls123@naver.com';