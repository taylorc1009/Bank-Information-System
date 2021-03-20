/* query 'a' */
select p.pName.firstName as forename, p.pName.surName as surname
from PersonTable p
where instr(lower(p.pName.firstName), 'st') != 0 and p.addr.city = 'Glasgow' and p.persID in (
    select deref(emp.pers).persID
    from EmployeeTable emp
);





/* query 'b' */
select count(distinct deref(acnt.bID).bID) as accounts_at_branch, br.getAddress() as address
from AccountTable acnt
join BranchTable br on (deref(acnt.bID).bID = br.bID)
group by br.bID, br.getAddress();





/* query 'c' - none of these solutions work: the first 2 don't limit to 1 account per branch and the third doesn't execute due to an unexplained error */
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
    select sAcnt.accNum
    from AccountTable sAcnt
    group by sAcnt.accNum, deref(sAcnt.bID).bID
    order by sAcnt.balance desc
    fetch first row only
)
group by br.bID, br.getAddress(), acnt.getCustomerNames(), acnt.balance
order by acnt.balance desc;