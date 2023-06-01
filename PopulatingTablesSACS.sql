
--distription:the task here is to populate all created tables as little as possible

--district table populating
insert into district(district_code,district_name) values(100,'Maseru'), 
                                                        (900,'Mafeteng'),
                                                        (300,'Leribe'),
                                                        (400,'MHoek');

--populating branches
insert into branch(branch_code,branch_name) values(1011,'Roma'),
                                                  (9011,'Mafeteng_central'),
                                                  (3011,'Maputswe'),
                                                  (1012,'Maseru_central');


--pulating admins relation
insert into admins( admin_id,admin_username,admin_fname,admin_lname,admin_address,district_code,branch_code) values(610,'rele@sacs','Relebohile','Pompa','Maseru P.O.Box 100',100,1011),
                                                                                                                   (630,'telo@sacs','Tello','Zula','Morija P.O.Box 190',100,1012),
                                                                                                                   (640,'zee@sacs','Zekhele','Yamba','Mafeteng P.O.Box 900',900,9011),
                                                                                                                   (670,'hloni@sacs','Lehlohonolo','Seholo','Hlotse P.O.Box',300,3011);



--populating client relation
insert into client( client_id,client_fname,client_lname,client_address,client_contact,client_addressregion,admin_id,branch_code) values(2020,'Thabo','Sehleka','Roma 180',50207867,'Central',610,1011),
                                                                                                                                       (2021,'Thabiso','Raliemere','Motsekuoa 192',63456789,'North',640,9011),
                                                                                                                                       (2022,'Lerato','Zoo','Morija 190',56743679,'South',640,9011),
                                                                                                                                       (2025,'Nkosi','Panda','Ha-Makhakhe 920',69458523,'South',670,3011),
                                                                                                                                       (2026,'Zee','Lieta','Maputswe 310',22325676,'North',670,3011);




--populating payment relation
insert into payment(payment_id,payment_method,payment_date,payment_amount,client_id) values(4001,'cash','2022-08-08',40000,2021),
                                                                                           (4002,'cash','2022-05-04',5000,2021),
                                                                                           (4005,'bank','2023-08-01',20000,2022),
                                                                                           (4004,'cash','2022-03-08',6000,2025),
                                                                                           (4009,'bank','2022-10-10',22000,2022),
                                                                                           (4010,'bank','2022-07-03',15000,2022),
                                                                                           (4003,'cash','2022-08-10',3000,2025);


--populating loan table
insert into loan(loan_id,loan_balance,loan_amount,loan_type,loan_issuedate,loan_enddate,client_id,admin_id,payment_id) values(3000,8000,590000,'long-term','2022-05-23','2023-05-23',2021,640,4009),
                                                                                                                              (3122,2000,43500,'long-term','2022-04-04','2023-04-04',2022,640,4004),
                                                                                                                              (3022,10000,10000,'short-term','2023-02-03','2023-08-03',2025,670,4001),
                                                                                                                              (3033,50000,50000,'long-term','2022-12-25','2023-12-25',2026,610,4003),
                                                                                                                              (3034,30000,30000,'long-term','2022-11-10','2023-11-10',2025,630,4004);



--populating savings account relation
insert into savingsacc(account_num,account_balance,client_id,payment_id) values(7020,1000,2026,4004),
                                                                               (7040,5000,2022,4003),
                                                                               (7060,1500,2022,4004),
                                                                               (7080,4000,2025,4001),
                                                                               (7070,1200,2020,4001),
                                                                               (7050,3000,2021,4002);
insert into savingsacc values;


--populating membership account
insert into membership(membership_id,membership_amount,membership_paid,payment_id) values(0001,100,true,4010);
insert into membership values(0004,100,true,4010);
insert into membership values(0003,100,false);
insert into membership values(0007,100,true,4009);
insert into membership values(0008,100,true,4003);
insert into membership values(0006,100,false);
insert into membership values(0005,100,false);


--populating investment relation
insert into investments(investment_id,investment_amount,investment_type,maturity_date,payment_id) values(6001,10000,'short-term','2024-01-05',4009),
																										(6002,100000,'long-term','2024-03-10',4001),
                                                                                                        (6003,70000,'long-term','2023-05-12',4003),
                                                                                                        (6004,80000,'short-term','2023-08-13',4009),
                                                                                                        (6005,30000,'short-term','2023-06-06',4003),
                                                                                                        (6007,25000,'long-term','2023-08-02',4005),
                                                                                                        (6008,30000,'short-term','2023-02-17',4004);



