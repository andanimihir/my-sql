create database shop;


use shop;

create table sale
(
sale_code char(4) not null primary key,
product_name varchar(50) not null,
sale_date date not null,
customer_id int not null,
product_selling int default 0 

);

insert into sale
values
("1010","tv 32'","2022-3-3",124,30),
("1012","tv 55'","2022-3-5",125,35) ,
("8794","ac 1 tan" ,"2022-3-11",164,70),
("2012","leptop hp","2022-3-15",138,2),
("4578","tv 32'","2022-3-15",356,40),
("5689","computer 15.6'","2022-3-20",357,20),
("5648","fan ","2022-3-25",548,52);


create table employ 
(
employ_id int not null primary key,
employ_name varchar(50) not null,
employ_email varchar(500) not null
);

insert into employ (employ_id,employ_name,employ_email)
values
(101,"mihir","mihira123@gmail.com"),
(102,"khushir","khushir5487@gmail.com"),
(103,"punit","punit@gmail.com"),
(180,"rajesh","rajesh4569@gmail.com"),
(190,"pooja","pooja@gmail.com");

create table employsallery
(
employ_idd int not null,
employ_post varchar(50) not null,
employ_sallery int not null,
primary key(employ_idd),
foreign key (employ_idd) references employ(employ_id)
);

insert into employsallery
values
(101,"clack",5000),
(102,"manager",25000),
(180,"saleman",15000),
(190,"account",15000),
(103,"clack",6000);


-- list the three stores with the highest number of customer transaction  --

select sum(product_selling) as product_sall ,product_name
 from sale
group by product_name
order by product_sall desc
limit 3 ;


-- extract employee ids for all employees who earned a three or high  --

select *
from employ 
inner join employsallery
on employ.employ_id = employsallery.employ_idd
order by employ_sallery desc
limit 3;


-- calculate the average monthly sales by product displayed in descending order  --

select * from sale
order by sale_date ;


--  find and remove duplicate in the table without creating another -- 

(select min(sale_code ) as sale_codes,product_name
from sale
group by product_name );




-- identify the common record between two tables --

select *
from employ 
inner join employsallery
on employ.employ_id = employsallery.employ_idd;
 


select e.employ_id,e.employ_name,e.employ_email,s.employ_post,s.employ_sallery
from employ as e
inner join employsallery as s
on e.employ_id = s.employ_idd;
 