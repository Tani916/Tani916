create database bank_db;
use bank_db;
create table customers (
customer_id integer not null,
c_name varchar (30),
phone integer ,
email varchar (30),
address varchar (30) );

create table accounts (
account_id integer not null,
customer_id integer,
account_type varchar (30),
balance integer (30),
branch_name varchar (30),
created_at date );

create table transactions (
txn_id integer not null,
account_id integer,
customer_id integer,
txn_type varchar (30),
amount integer,
txn_time date,
dtn varchar(30) );

create table loans (
loan_id integer not null,
customer_id integer,
loan_type char(30),
principal_amt integer,
interest_rate decimal (5,2),
start_date date,
loan_status varchar(30)
);
alter table customers 
modify phone varchar(30)
;


alter table customers 
add primary key (customer_id);
alter table accounts
add primary key (account_id);
alter table transactions
add primary key (txn_id);
alter table loans
add primary key (loan_id);
alter table accounts
add constraint fk_accounts_customer
foreign key (customer_id) references customers(customer_id);
alter table transactions
add constraint fk_transaction_accounts
foreign key (account_id) references accounts(account_id);
alter table loans
add constraint fk_loans_customers
foreign key (customer_id) references customers(customer_id);

alter table accounts
modify balance int ;
alter table transactions
drop column customer_id;
alter table transactions
modify txn_time datetime;
alter table loans
modify loan_type varchar(30);
alter table transactions
change dtn discription varchar(30);
alter table transactions
modify discription varchar(50);

insert into customers
(customer_id,c_name,phone,email,address) values
(1,'ram',9864562121,'ram123@gmailcom','solan'),
(2,'rohan',8746545545,'rohan123@gmail.com','shimla'),
(3,'nikhil',8555456496,'nikhil123@gmail.com','delhi'),
(4,'devansh',9874545445,'devansh@gmail.com','modi nagar'),
(5,'nitish',9845441144,'nitish@gmail.com','jammu');
INSERT INTO accounts
(account_id, customer_id, account_type, balance, branch_name, created_at) VALUES
(1, 1, 'regular', 4561445, 'solan', '2021-03-10'),
(2, 2, 'regular', 654464, 'shimla', '2022-05-01'),
(3, 3, 'regular', 126549, 'delhi', '2020-04-08'),
(4, 4, 'regular', 8987444, 'modi nagar', '2019-05-08'),
(5, 5, 'regular', 10000000, 'jammu', '2018-06-23');


INSERT INTO transactions
(txn_id, account_id, txn_type, amount, txn_time, discription) VALUES
(1, 1, 'credit', 500000, '2022-11-23 09:56:00', 'salary'),
(2, 2, 'debit', 14000, '2024-11-11 10:30:00', 'emi'),
(3, 3, 'credit', 7000, '2025-03-15 05:10:00', 'freelance payment'),
(4, 4, 'debit', 1500, '2023-05-15 12:45:00', 'electricity bill'),
(5, 5, 'debit', 10000, '2023-01-16 11:00:00', 'home loan');

insert into loans (
loan_id,customer_id,loan_type,principal_amt,interest_rate,start_date,loan_status)
values
(1,1,'home',4000000,9.5,'2022-06-10','on-going'),
(2,2,'car',600000,8.0,'2023-07-15','on-going'),
(3,3,'education',120000,6.5,'2020-04-01','complete'),
(4,4,'car',300000,9.5,'2019-07-15','complete'),
(5,5,'business',10000000,12.0,'2018-01-09','on-going');

select * from customers;
select * from accounts;
select * from transactions;
select *  from loans;
select count(*) from customers;
select c.customer_id ,c.c_name,a.account_id,a.balance from  customers c join 
accounts a on c.customer_id = a.customer_id;















