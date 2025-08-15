-- Creating Tables
drop table if exists branch; 
create table branch
	(
		branch_id VARCHAR(10) PRIMARY KEY,
		manager_id VARCHAR(10),
		branch_address VARCHAR(55),
		contact_no VARCHAR(10)
	);


drop table if exists employees;
CREATE TABLE employees
	(
		emp_id VARCHAR(10) PRIMARY KEY,
		emp_name VARCHAR (25) ,
		position VARCHAR(15) ,
		salary INT,
		branch_id VARCHAR (25)
	);

drop table if exists books;
CREATE TABLE books
	(
		isbn VARCHAR(20) PRIMARY KEY,
		book_title VARCHAR(75),
		category VARCHAR(10),
		rental_price FLOAT,
		status VARCHAR(15),
		author VARCHAR(35),
		publisher VARCHAR(55)
	);

drop table if exists members;
create table memmbers
	(
		member_id varchar(10) PRIMARY KEY,
		member_name varchar(25),
		member_address varchar(75),
		reg_date date
	);


drop table if exists issued_status;
CREATE TABLE issued _ status
	(
		issued_id varchar(10) PRIMARY KEY,
		issued_member_id varchar(10),
		issued_book_name varchar(75),
		issued_date date,
		issued_book_isbn varchar(25),
		issued_emp_id varchar(10)
	);

DROP TABLE IF EXISTS return_status;
CREATE TABLE return_status
	(
		return_id varchar(10) PRIMARY KEY,
		issued_id varchar(10),
		return_book_name varchar(75),
		return_date date,
		return_book_isbn varchar(20)
	);



-- Foreign Key
alter table issued_status
add constraint fk_members
foreign key (issued_member_id)
references members(member_id);

alter table issued_status
add constraint fk_books
foreign key (issued_book_isbn)
references books(isbn);

alter table issued_status
add constraint fk_employee
foreign key (issued_emp_id)
references employees(emp_id);

------------------------------------

ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);

--------------------------------------
