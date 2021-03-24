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





/* query 'c' - none of these solutions work: the first 2 don't limit to 1 account per branch and the third doesn't execute due no being able to get multiple columns from a subquery in a where clause */
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

select br.getAddress() as address, acnt.getCustomerNames() as customers, acnt.balance as balance
from BranchTable br
join AccountTable acnt on (br.bID = deref(acnt.bID).bID)
where acnt.accType = 'savings' and acnt.accNum in (
    select sAcnt.accNum, max(sAcnt.balance)
    from AccountTable sAcnt
    group by sAcnt.accNum, deref(sAcnt.bID).bID, sAcnt.balance
)
group by br.bID, br.getAddress(), acnt.getCustomerNames(), acnt.balance
order by acnt.balance desc;





/* query 'd' */
select br.getAddress() as branch_address, deref(acnt.bID).getAddress() as accounts_branch_address
from BranchTable br
join AccountTable acnt on (deref(acnt.bID).bID = br.bID)
join EmployeeTable emp on (deref(emp.bID).bID = br.bID)
where emp.supervisorID is not NULL and acnt.containsPerson(deref(emp.pers).persID) = 'yes'
group by deref(acnt.bID).bID, br.getAddress(), deref(acnt.bID).getAddress();





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
where pers.countMobilePhones() > 1;





/* query 'g' */

/* query 'h' */