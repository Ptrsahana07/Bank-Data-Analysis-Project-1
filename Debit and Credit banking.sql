#Q1
Select sum(Amount) as Total_credit 
from debit_credit_banking
where Transaction_Type ="Credit";

#Q2
Select sum(Amount) as Total_debit 
from debit_credit_banking
where Transaction_Type ="Debit";

#Q3
Select (Select sum(Amount) from debit_credit_banking where Transaction_Type ="Credit")
/(Select sum(Amount) from debit_credit_banking where Transaction_Type ="Debit") as Credit_to_Debit_Ratio;

#Q4
Select (Select sum(Amount) from debit_credit_banking where Transaction_Type ="Credit")
-(Select sum(Amount) from debit_credit_banking where Transaction_Type ="Debit") as Net_transaction_amount;

#Q5
select count(*)/sum(balance) as Account_activity_ratio from debit_credit_banking;

#Q6
#Total Transactions per day
SELECT 
    DATE(transaction_date) AS transaction_day,
    COUNT(*) AS transaction_count
FROM 
    debit_credit_banking
GROUP BY 
    DATE(transaction_date)
ORDER BY 
    transaction_day;

SELECT 
    YEAR(transaction_date) AS year,
    WEEK(transaction_date, 1) AS week_number,
    COUNT(*) AS transaction_count
FROM 
    debit_credit_banking
GROUP BY 
    YEAR(transaction_date),
    WEEK(transaction_date, 1)
ORDER BY 
    year, week_number;
    
    SELECT 
    YEAR(transaction_date) AS year,
    MONTH(transaction_date) AS month,
    COUNT(*) AS transaction_count
FROM 
    debit_credit_banking
GROUP BY 
    YEAR(transaction_date), 
    MONTH(transaction_date)
ORDER BY 
    year, month;

#Q7
Select branch, sum(amount) from debit_credit_banking
group by branch; 



