 create table sales_people(
 Snum int not null,
 sname varchar(255),
 city varchar(255),
 comm int,
 primary key(snum),
 unique(sname)
);
insert into sales_people
values
(1001,'peel','london',12),
(1002,'Serres','Sanjose',13),
(1004,'Motika','London',11),
(1007,'Rifkin','Barcelona',15),
(1003,'Axelrod','Newyork',10);


create table customers(
    cnum int not null,
    cname varchar(255),
    city varchar(255) not null,
    primary key(cnum),
    snum int,
    FOREIGN KEY (snum) REFERENCES sales_people(snum)
);

insert into customers
values
(2001,'Hoffman','London',1001),
(2002,'Giovanni','Rome',1003),
(2003,'Liu','Sanjose',1002),
(2004,'Grass','Berlin',1002),
(2006,'Clemens','London',1001),
(2008,'Cisneros','Sanjose',1007),
(2007,'Pereira','Rome',1004);

create table orders(
    onum int primary key,
    amt float,
    odate date,
    cnum int,
    FOREIGN KEY (cnum)
    REFERENCES customers(cnum),
    snum int,
    FOREIGN KEY (snum) 
    REFERENCES sales_people(snum)
);

insert into orders
values
(3001,18.69,'1990-10-03',2008,1007),
(3003,767.19,'1990-10-03',2001,1001),
(3002,1900.10,'1990-10-03',2007,1004),
(3005,5160.45,'1990-10-03',2003,1002),
(3006,1098.16,'1990-10-03',2008,1007),
(3009,1713.23,'1990-10-04',2002,1003),
(3007,75.75,'1990-10-04',2004,1002),
(3008,4273.00,'1990-10-05',2006,1001),
(3010,1309.95,'1990-10-06',2004,1002),
(3011,9891.88,'1990-10-06',2006,1001);


-- ANSWERS
    -- 1.
        select sum(case when sname like 'a%' then 1 else 0 end) 'a' from sales_people;

    -- 2.
       select * from sales_people where snum in (select snum from orders group by snum having sum(Amt) > 2000);
    
    -- 3.
        select count(city) from sales_people where city='newyork';

    -- 4.
         select count(sname) from sales_people where city='london' or city='paris';
    
    -- 5.
        select sn.sname,sn.city, count( os.onum) as Total_Orders,os.odate from sales_people sn join orders os on sn.snum=os.snum group by sn.snum;
    
