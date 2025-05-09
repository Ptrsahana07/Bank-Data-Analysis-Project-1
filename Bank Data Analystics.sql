#Q1
select sum(Funded_Amount) as Total_Funded_Amount from bank_data;

#Q2
Select count(*) as Total_loans_issued from bank_data;

#Q3
Select round(sum(Total_Pymnt),2) as Total_Collection from bank_data;

#Q4
select round(sum(Total_Rrec_int),2) as Total_Interest from bank_data;

#Q5
select Branch_Name,
round(sum(Total_Rrec_int),2) as Total_Interest, 
round(sum(Total_Fees+Total_Rec_Late_fee+Recoveries+Collection_Recovery_fee),2) as fees ,
round(sum(Total_Rrec_int+Total_Fees+Total_Rec_Late_fee+Recoveries+Collection_Recovery_fee),2) as Total_Revenue 
from bank_data
group by Branch_Name
order by Total_Revenue desc;

#Q6
select State_name, 
Sum(Loan_Amount) as Total_Loan 
from bank_data
group by state_name
order by Total_loan desc;

#Q7
select Region_Name, 
Sum(Loan_Amount) as Total_Loan 
from bank_data
group by Region_Name
order by Total_loan desc;

#Q8
select Purpose_Category, 
Sum(Loan_Amount) as Total_Loan 
from bank_data
group by Purpose_Category
order by Total_loan desc;

#Q9
Select year(Disbursement_Date) as Year_1,
month(Disbursement_Date) as Month_1,
sum(Funded_Amount)
from bank_data
group by Year_1,Month_1
Order by Year_1 desc,Month_1 desc;

#Q10
Select Grade, Sum(loan_amount) as Total_Loan_Amount from bank_data
group by grade
order by Total_loan_amount desc;

#Q11
Select count(*) as Count_of_Default_Loan from Bank_data
where Is_Default_Loan = "Y";

#Q12
Select count(*) as Count_of_Delinquent_Client from Bank_data
where Is_Delinquent_Loan = "Y";

#Q13
select 
(Select count(*) from Bank_data where Is_Delinquent_Loan = "Y") 
/ (select count(*) from bank_data) *100 as Delinquent_Loan_Rate;

#Q14
select 
(Select count(*) from Bank_data where Is_Default_Loan = "Y") 
/ (select count(*) from bank_data) *100 as Default_Loan_Rate;

#Q15
Select 
Case
when Is_Default_Loan = "Y" then "closed"
when Is_Delinquent_Loan = "Y" then "delinquent"
when Loan_Status = "Active Loan" then "active"
else "closed"
end as Loan_Status, Sum(Loan_Amount) as Total_loan_amount
from bank_data
group by
case
when Is_Default_Loan = "Y" then "closed"
when Is_Delinquent_Loan = "Y" then "delinquent"
when Loan_Status = "Active Loan" then "active"
else "closed"
end;

#Q16
Select Age, sum(Loan_Amount) as Total_loan_amount
from bank_data 
group by age;

#Q17
Select Account_ID, Disbursement_Date, Closed_Date,datediff(Closed_Date,disbursement_date) as Maturity_in_days
from Bank_data
where Loan_Status != "Active Loan";

#Q18
select Count(*) as No_Verified_Loans from bank_data
where Verification_Status != "Verified";