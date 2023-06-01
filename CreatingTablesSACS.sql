

--description: the task is to create all tables as per systems's GCS


--the "if not exists" part is just added for incase the code is ran multiple times.
--the code below creates the 1st table called district 
CREATE TABLE IF NOT EXISTS district(
       district_code integer not null,
       district_name varchar(45),
       PRIMARY KEY(district_code)
);


--the code below create the 2nd table called branch

CREATE TABLE IF NOT EXISTS branch(
       branch_code integer not null,
       branch_name varchar(45),
       district_code integer,
       PRIMARY KEY(branch_code),
       foreign key(district_code) references district(district_code)
);


--this code creates the next table called admins

CREATE TABLE IF NOT EXISTS admins(
       admin_id integer not null ,
       admin_username varchar(45),
       admin_fname varchar(45),
       admin_lname varchar(45),
       admin_address varchar(45),
       district_code integer,
       branch_code integer,
       PRIMARY KEY (admin_id,branch_code),
       foreign key(branch_code) references branch(branch_code) 
);


--below is another table called client

CREATE TABLE IF NOT EXISTS client(
       client_id integer not null,
       client_fname varchar(45),
       client_lname varchar(45),
       client_address varchar(45),
       client_contact integer,
       client_addressregion text,
       admin_id integer,
       branch_code integer,
	   PRIMARY KEY (client_id,branch_code),
       foreign key(branch_code,admin_id) references admins(admin_id),
       foreign key(branch_code) references branch(branch_code)
);


--then follows payment table
CREATE TABLE IF NOT EXISTS payment(
       payment_id integer not null unique,
       payment_method varchar(45),
       payment_date date,
       payment_amount decimal,
       client_id integer,
	   PRIMARY KEY (payment_id),
       foreign key (client_id) references client(client_id)
);


---savings account table
CREATE TABLE IF NOT EXISTS savingsacc(
       account_num integer not null ,
       account_balance decimal,
       client_id integer,
       payment_id integer,
	   PRIMARY KEY (account_num,payment_id),
       foreign key (client_id) references client(client_id),
       foreign key(payment_id) references payment(payment_id)
);


--loan table
CREATE TABLE IF NOT EXISTS loan(
       loan_id integer not null unique,
       loan_balance decimal,
       loan_amount decimal,
       loan_type varchar(45),
       loan_issuedate date,
       loan_enddate date,
       client_id integer,
       admin_id integer,
       payment_id integer,
	   PRIMARY KEY(loan_id,payment_id),
       foreign key(client_id) references client(client_id),
       foreign key(admin_id) references admins(admin_id),
       foreign key(payment_id) references payment(payment_id)
);


--membership table
CREATE TABLE IF NOT EXISTS membership(
       membership_id integer not null unique,
       membership_amount decimal,
       membership_paid boolean,
       payment_id integer,
       PRIMARY KEY (membership_id,payment_id),
       foreign key(payment_id) references payment(payment_id)
);


--investments relation
CREATE TABLE IF NOT EXISTS investments(
	   investment_id integer not null,
	   investment_amount decimal,
	   investment_type varchar(45),
	   maturity_date date,
	   payment_id integer,
	   primary key (investment_id,payment_id),
	   foreign key(payment_id) references payment(payment_id)
	);

