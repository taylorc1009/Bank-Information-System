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

/* query 'c' */
select br.getAddress(),
    acnt.getCustomerNames() as customers,
    acnt.balance as account_balance
from AccountTable acnt
join BranchTable br on (deref(acnt.bID).bID = br.bID)
where acnt.accType = 'savings' and acnt.accNum in (
    select sAcnt.accNum
    from AccountTable sAcnt
    group by sAcnt.accNum, deref(sAcnt.bID).bID, sAcnt.balance
    order by sAcnt.balance
)
group by br.bID, br.getAddress(), acnt.getCustomerNames(), acnt.balance;