/* query 'a' */
select p.pName.firstName as forename, p.pName.surName as surname
from PersonTable p
where instr(lower(p.pName.firstName), 'st') != 0 and p.addr.city = 'Glasgow' and p.persID in (
    select deref(emp.pers).persID
    from EmployeeTable emp
);

/* query 'b' */
select count(distinct deref(acnt.bID).bID) as accounts_at_branch,
    br.addr.buildingNum as building_number,
    br.addr.street as street,
    br.addr.city as city,
    br.addr.postCode as post_code
from AccountTable acnt
join BranchTable br on (deref(acnt.bID).bID = br.bID)
group by br.bID, br.addr.buildingNum, br.addr.street, br.addr.city, br.addr.postCode;

/* query 'c' */
select br.addr.buildingNum as building_number,
    br.addr.street as street,
    br.addr.city as city,
    br.addr.postCode as post_code,
    acnt.getCustomerNames() as customers,
    acnt.balance as account_balance
from AccountTable acnt
join BranchTable br on (deref(acnt.bID).bID = br.bID)
where acnt.accType = 'savings'
group by br.bID, br.addr.buildingNum, br.addr.street, br.addr.city, br.addr.postCode, 
acnt.getCustomerNames(), acnt.balance
order by acnt.balance;