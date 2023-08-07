/* KPI 1 */
select year(issue_d),concat(format(sum(loan_amnt)/1000000,1),'M') as loan_amnt
from db1.finance_11
group by year(issue_d)
order by year(issue_d);

/* KPI 2 */
select grade,sub_grade,revol_bal
from finance_1 inner join finance_2  on finance_1.id=finance_2.id;

/* KPI 3 */
select verification_status ,count(total_pymnt) as countofstatus,concat(round(sum(total_pymnt)/1000000,1),"M") as total_payment
from finance_2 inner join finance_11 on finance_2.id=finance_11.id
where verification_status="Verified" or verification_status="Not Verified"
group by verification_status;

/* KPI 4 */
select addr_state,last_credit_pull_d,loan_status
from finance_1 inner join finance_2 on finance_1.id=finance_2.id;

/* KPI 5 */
select last_pymnt_d,home_ownership,count(home_ownership)
from finance_1 inner join finance_2 on finance_1.id=finance_2.id
group by last_pymnt_d,home_ownership
order by count(home_ownership) desc;