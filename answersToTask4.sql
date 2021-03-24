/* query 'a' */
select p.pName.firstName as forename, p.pName.surName as surname
from PersonTable p
where instr(lower(p.pName.firstName), 'st') != 0 and p.addr.city = 'Glasgow' and p.persID in (
    select deref(emp.pers).persID
    from EmployeeTable emp
);





/* query 'b' */
select count(distinct acnt.accNum) as accounts_at_branch, br.getAddress() as address
from AccountTable acnt
join BranchTable br on (deref(acnt.bID).bID = br.bID)
group by br.bID, br.getAddress();





/* query 'c' - neither of these solutions work 100%: they don't limit to 1 account per branch, and I don't know why but both functions 'max' and 'first_value' do get the highest for each branch but they don't prevent the rows that aren't the first values from being listed */
select br.getAddress() as address, acnt.getCustomerNames() as customers, max(acnt.balance) as balance
from BranchTable br
join AccountTable acnt on (br.bID = deref(acnt.bID).bID)
where acnt.accType = 'savings'
group by br.bID, br.getAddress(), acnt.getCustomerNames(), acnt.balance
order by acnt.balance desc;

select br.getAddress() as address, acnt.getCustomerNames() as customers, acnt.balance as balance
from BranchTable br
join AccountTable acnt on (br.bID = deref(acnt.bID).bID)
where acnt.accType = 'savings' and acnt.accNum in (
    select first_value(sAcnt.accNum) ignore nulls over (partition by sAcnt.accNum order by acnt.balance rows between unbounded preceding and unbounded following)
    from AccountTable sAcnt
    group by sAcnt.accNum, deref(sAcnt.bID).bID
)
group by br.bID, br.getAddress(), acnt.getCustomerNames(), acnt.balance
order by acnt.balance desc;





/* query 'd' */
select deref(emp.bID).getAddress() as branch_address, deref(acnt.bID).getAddress() as accounts_branch_address
from CustomerTable cust
join AccountTable acnt on (acnt.containsPerson(deref(cust.pers).persID) = 'yes')
join EmployeeTable emp on (deref(cust.pers).persID = deref(emp.pers).persID)
where emp.supervisorID is not NULL and acnt.containsPerson(deref(emp.pers).persID) = 'yes';





/* query 'e' */
select br.bID as branch_id, acnt.getCustomerNames() as customers, max(acnt.limitOfFreeOD) as free_overdraft
from BranchTable br
join AccountTable acnt on (br.bID = deref(acnt.bID).bID)
where acnt.accType = 'current' and acnt.countCustomers() > 1
group by br.bID, acnt.getCustomerNames(), acnt.limitOfFreeOD
order by acnt.limitOfFreeOD desc;





/* query 'f' */
select pers.getName() as name, pers.getMobilePhones() as mobile_phone_numbers
from CustomerTable cust
join PersonTable pers on (pers.persID = deref(cust.pers).persID)
where pers.countMobilePhones() > 1 and pers.findMobileStartsWith('0760') = 'yes';





/* query 'g' */
select deref(emp.pers).getName() as name
from EmployeeTable emp
where deref(deref(emp.supervisorID).pers).pName.title = 'Mr'
    and deref(deref(emp.supervisorID).pers).pName.surName = 'Smith'
    and deref(deref(deref(emp.supervisorID).supervisorID).pers).pName.title = 'Mrs'
    and deref(deref(deref(emp.supervisorID).supervisorID).pers).pName.surname = 'Jones';





/* query 'h' */
select deref(emp.pers).getName() as name, emp.awardEvaluation() as medal
from EmployeeTable emp
where emp.awardEvaluation() is not NULL
order by (
    case emp.awardEvaluation()
    when 'gold' then 1
    when 'silver' then 2
    when 'bronze' then 3
    end
) asc;