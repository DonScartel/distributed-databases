

/*The code below is used to distribute tables*/

SELECT * FROM create_distributed_table('district','district_code');
SELECT * FROM create_distributed_table('branch','branch_code');
SELECT * FROM create_distributed_table('admins','branch_code');
SELECT * FROM create_distributed_table('client','branch_code');
SELECT * FROM create_distributed_table('payment','payment_id');
SELECT * FROM create_distributed_table('membership','payment_id');
SELECT * FROM create_distributed_table('loan','payment_id');
SELECT * FROM create_distributed_table('savingsacc','payment_id');
SELECT * FROM create_distributed_table('investmets','payment_id');