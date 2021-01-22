create table h_cust(hcid int primary key,name varchar(30) NOT NULL,phn numeric(10) NOT NULL UNIQUE,location varchar(20) check(location in ('Pune','Mumbai','Nagpur','Thane','Nashik')) NOT NULL,address text,password varchar(20) NOT NULL);

create table r_cust(rcid int primary key,name varchar(30) NOT NULL,phn numeric(10) NOT NULL UNIQUE,address text,bank varchar(20) NOT NULL,accno numeric(20) NOT NULL,branch varchar(30) NOT NULL,ifsc varchar(20),password varchar(20) NOT NULL);
 
create table equip(eid int primary key,ename varchar(30) NOT NULL,etype varchar(20) NOT NULL,location varchar(20) check(location in ('Pune','Mumbai','Nagpur','Thane','Nashik')) NOT NULL,status varchar(10) check(status in ('available','booked')) DEFAULT 'available',rate int NOT NULL,rcid int references r_cust ON DELETE CASCADE ON UPDATE SET NULL);

create table image(iname text,eid int references equip ON DELETE CASCADE ON UPDATE SET NULL,primary key(eid));

create table cust_equip(hcid int references h_cust ON DELETE CASCADE ON UPDATE SET NULL,eid int references equip ON DELETE CASCADE ON UPDATE SET NULL,pstatus varchar(10) check(pstatus in ('paid','balanace')) NOT NULL,sdate date NOT NULL,edate date NOT NULL,amnt int);

create table rating(rid int primary key,rno int check(rno in (1,2,3,4,5)) NOT NULL,hcid int references h_cust ON DELETE CASCADE ON UPDATE SET NULL,eid int references equip ON DELETE CASCADE ON UPDATE SET NULL);
