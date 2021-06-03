show databases;

create table member(
	id varchar(50) not null primary key,
	pw varchar(16) not null,
	name varchar(10) not null,
	reg_date datetime not null
);

create table test(
	num_id int not null primary key auto_increment,
	title varchar(50) not null,
	content text not null
);

show tables;

select * from member;