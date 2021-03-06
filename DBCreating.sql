/* the triggers don't need to be dropped as the're automatically dropped with the table they relate to */

/* branch objects */
drop type Branch force;
drop table BranchTable purge;
/*
drop trigger CheckBranchPhone;
*/

/* person objects */
drop table PersonTable purge;
drop type Person force;
drop type PersonName force;
/*
drop trigger CheckPersonTitle;
drop trigger CheckPersonHomePhone;
drop trigger CheckPersonMobilePhones;
drop trigger CheckPersonInsuranceNo;
*/

/* employee objects */
drop table EmployeeTable purge;
drop type Employee force;
/*
drop trigger CheckPersonIsAlreadyEmployee;
drop trigger CheckEmployeePosition;
drop trigger CheckSupervisorPosition;
drop trigger CheckEmployeeHasValidSupervisor;
drop trigger CheckEmployeeSupervisorBranch;
drop trigger CheckEmployeeBranch;
drop trigger CheckBranchSupervisor;
*/

/* account objects */
drop table AccountTable purge;
drop type CustomerAccount force;
drop type CustomersArray force;
/*
drop trigger CheckAccountType;
drop trigger CheckAccountBranch;
drop trigger CheckIsEmployeeAtBranch;
drop trigger InitialiseAccount;
*/

/* customer objects */
drop table CustomerTable purge;
drop type Customer force;
drop type AccountsArray force;
/*
drop trigger CheckPersonIsAlreadyCustomer;
drop trigger CheckCustomersAccountExists;
drop trigger CheckWorksAtAccountsBranch;
*/

/* additional objects */
drop type Address force;
drop type MobilePhonesArray force;



create or replace type Address as object (
    buildingNum int,
    street varchar2(20),
    city varchar2(20),
    postCode varchar2(7)
) final
/
create or replace type Branch as object (
    bID int,
    addr Address,
    bPhone varchar2(11),
    member function getAddress return varchar2
) not final
/
create or replace type body Branch as
    member function getAddress return varchar2 is branchAddress varchar2(56);
    begin
        if self.addr is not NULL then
            branchAddress := TO_CHAR(self.addr.buildingNum)
                || ' ' || self.addr.street
                || ', ' || self.addr.city
                || ', ' || self.addr.postCode;
        end if;
        return branchAddress;
    end getAddress;
end;
/
create table BranchTable of Branch (
    bID primary key,
    constraint br_addr_not_null check (addr is not NULL
        and addr.buildingNum is not NULL
        and addr.street is not NULL
        and addr.city is not NULL
        and addr.street is not NULL
    ),
    constraint bPhone__not_null check (bPhone is not NULL)
);
/
create or replace trigger CheckBranchPhone
    before insert or update
        of bPhone
        on BranchTable
        for each row
        begin
            if not regexp_like(:new.bPhone, '[[:digit:]]{8,11}') then
                raise_application_error(-20000, 'A branch`s phone number must be 8-11 numbers long and consist of only numbers.');
            end if;
        end;
        /





create or replace type PersonName as object (
    title varchar(4),
    firstName varchar(20),
    surName varchar(20)
) final
/
create or replace type MobilePhonesArray as varray(10) of varchar2(11)
/
create or replace type Person as object (
    persID int,
    addr Address,
    pName PersonName,
    homePhone varchar2(11),
    mobilePhones MobilePhonesArray,
    niNum varchar2(5),
    member function getName return varchar2,
    member function getAddress return varchar2,
    member function getMobilePhones return varchar2,
    member function countMobilePhones return int,
    member function findMobileStartsWith(numbers varchar2) return varchar2
) final
/
create or replace type body Person as
    member function getName return varchar2 is personName varchar2(44);
    begin
        if self.pName is not NULL then
            personName := self.pName.title
                || ' ' || self.pName.firstName
                || ' ' || self.pName.surName;
        end if;
        return personName;
    end getName;
    
    member function getAddress return varchar2 is personAddress varchar2(56);
    begin
        if self.pName is not NULL then
            personAddress := TO_CHAR(self.addr.buildingNum)
                || ' ' || self.addr.street
                || ', ' || self.addr.city
                || ', ' || self.addr.postCode;
        end if;
        return personAddress;
    end getAddress;
    
    member function getMobilePhones return varchar2 is mobileNumbers varchar2(126) default NULL;
    mobileNumber varchar2(11) default NULL;
    begin
        if self.mobilePhones is not NULL then
            for i in 1 .. self.mobilePhones.count loop
                mobileNumber := self.mobilePhones(i);
                
                if mobileNumber is not NULL then
                    if mobileNumbers is NULL then
                        mobileNumbers := mobileNumber;
                    else
                        mobileNumbers := concat(mobileNumbers, ', ' || mobileNumber);
                    end if;
                end if;
            end loop;
        end if;
        return mobileNumbers;
    end getMobilePhones;
    
    member function countMobilePhones return int is c int default 0;
    begin
        if self.mobilePhones is not NULL then
            for i in 1 .. self.mobilePhones.count loop
                if self.mobilePhones(i) is not NULL then
                    c := c + 1;
                end if;
            end loop;
        end if;
        return c;
    end countMobilePhones;
    
    member function findMobileStartsWith(numbers varchar2) return varchar2 is response varchar2(3);
    begin
        if self.mobilePhones is not NULL then
            for i in 1 .. self.mobilePhones.count loop
                if self.mobilePhones(i) is not NULL then
                    if substr(self.mobilePhones(i), 1, length(numbers)) = numbers then
                        return 'yes';
                    end if;
                end if;
            end loop;
        end if;
        return 'no';
    end findMobileStartsWith;
end;
/
create table PersonTable of Person (
    persID primary key,
    constraint pers_addr_not_null check (addr is not NULL
        and addr.buildingNum is not NULL
        and addr.street is not NULL
        and addr.city is not NULL
        and addr.street is not NULL
    ),
    constraint pName_not_null check (pName is not NULL
        and pName.title is not NULL
        and pName.firstName is not NULL
        and pName.surName is not NULL
    ),
    constraint homePhone_not_null check(homePhone is not NULL),
    constraint niNum_not_null check (niNum is not NULL),
    constraint niNum_unique unique(niNum)
);
/
create or replace trigger CheckPersonTitle
    before insert or update
        of pName
        on PersonTable
        for each row
        begin
            if :new.pName.title not in ('Mr', 'Mrs', 'Miss', 'Ms', 'Mstr') then
                raise_application_error(-20000, 'A person`s title must be either: Mr, Mrs, Miss, Ms, or Mstr.');
            end if;
        end;
        /
create or replace trigger CheckPersonHomePhone
    before insert or update
        of homePhone
        on PersonTable
        for each row
        begin
            if not regexp_like(:new.homePhone, '[[:digit:]]{8,11}') then
                raise_application_error(-20000, 'A person`s home phone number must be 8-11 numbers long and consist of only numbers.');
            end if;
        end;
        /
create or replace trigger CheckPersonMobilePhones
    before insert or update
        of mobilePhones
        on PersonTable
        for each row
        begin
            if :new.mobilePhones is not NULL then
                for i in 1 .. :new.mobilePhones.count loop
                    if not regexp_like(:new.mobilePhones(i), '[[:digit:]]{8,11}') then
                        raise_application_error(-20000, 'This person`s mobile phone number at index ' || i || ' wasn`t 8-11 numbers long or didn`t consist of only numbers.');
                    end if;
                end loop;
            end if;
        end;
        /
create or replace trigger CheckPersonInsuranceNo
    before insert or update
        of niNum
        on PersonTable
        for each row
        begin
            if not regexp_like(:new.niNum, '(\d|\w){5}') then
                raise_application_error(-20000, 'A person`s National Insurance Number must be 5 characters long and consist of only letters and numbers.');
            end if;
        end;
        /
create or replace type Employee as object (
    empID int,
    pers ref Person,
    supervisorID ref Employee,
    empPosition varchar2(20),
    salary int,
    bID ref Branch,
    joinDate date,
    member function awardEvaluation return varchar2
) not final
/
create table EmployeeTable of Employee (
    empID primary key,
    constraint emp_pers_not_null check (pers is not NULL),
    constraint empPosition_not_null check (empPosition is not NULL),
    constraint salary_not_null check (salary is not NULL),
    constraint emp_bID_not_null check (bID is not NULL),
    constraint joinDate_not_null check (joinDate is not NULL)
);
/
create or replace type body Employee as
    member function awardEvaluation return varchar2 is medal varchar2(6);
    employeesSupervised int;
    begin
        select count(*) into employeesSupervised 
        from EmployeeTable emp
        where deref(emp.supervisorID).empID = self.empID;
        
        if self.joinDate < add_months(CURRENT_DATE, -(12 * 10)) and employeesSupervised > 8 then
            return 'gold';
        elsif self.joinDate < add_months(CURRENT_DATE, -(12 * 8)) and employeesSupervised > 5 then
            return 'silver';
        elsif self.joinDate < add_months(CURRENT_DATE, -(12 * 4)) then
            return 'bronze';
        end if;
        
        return NULL;
    end awardEvaluation;
end;
/
create or replace trigger CheckPersonIsAlreadyEmployee
    before insert or update
        of pers
        on EmployeeTable
        for each row
        declare empCount int;
        begin
            select count(*) into empCount
            from EmployeeTable emp
            where deref(emp.pers).persID = deref(:new.pers).persID;
            
            if empCount > 0 then
                raise_application_error(-20000, 'This person is already an employee.');
            end if;
        end;
        /
create or replace trigger CheckEmployeePosition
    before insert or update
        of empPosition
        on EmployeeTable
        for each row
        begin
            if :new.empPosition not in ('head', 'manager', 'team leader', 'accountant', 'cashier') then
                raise_application_error(-20000, 'Employee position must be either: head, manager, team leader, accountant, or cashier.');
            end if;
        end;
        /
create or replace trigger CheckSupervisorPosition
    before insert or update
        of supervisorID
        on EmployeeTable
        for each row
        begin
            if :new.supervisorID is NULL and :new.empPosition not in ('head', 'manager', 'team leader') then
                raise_application_error(-20000, 'A supervisor must have one of the following job titles: head, manager, or team leader.');
            end if;
        end;
        /
create or replace trigger CheckEmployeeHasValidSupervisor
    before insert or update
        of supervisorID
        on EmployeeTable
        for each row
        declare empCount int;
        begin
            if :new.empPosition not in ('head', 'manager', 'team leader') then
                select count(*) into empCount
                from EmployeeTable emp
                where emp.empID = deref(:new.supervisorID).empID and emp.empPosition in ('head', 'manager', 'team leader');
                
                if empCount = 0 then
                    raise_application_error(-20000, 'Employees who aren`t managers must have a valid supervisor - either a: head, manager, or team leader.');
                end if;
            end if;
        end;
        /
create or replace trigger CheckEmployeeSupervisorBranch
    before insert or update
        of supervisorID
        on EmployeeTable
        for each row
        declare empCount int;
        begin
            if :new.supervisorID is not NULL then
                select count(*) into empCount
                from EmployeeTable emp
                where emp.empID = deref(:new.supervisorID).empID and deref(emp.bID).bID = deref(:new.bID).bID;
                
                if empCount = 0 then
                    raise_application_error(-20000, 'An employee`s supervisor must work at the same branch they do.');
                end if;
            end if;
        end;
        /
create or replace trigger CheckEmployeeBranch
    before insert or update
        of bID
        on EmployeeTable
        for each row
        declare brCount int;
        begin
            select count(*) into brCount
            from BranchTable br
            where br.bID = deref(:new.bID).bID;
            
            if brCount = 0 then
                raise_application_error(-20000, 'The branch entered for this employee doesn`t exist.');
            end if;
        end;
        /
create or replace trigger CheckBranchSupervisor
    before insert or update
        of supervisorID
        on EmployeeTable
        for each row
        declare empCount int;
        begin
            if :new.supervisorID is NULL then
                select count(*) into empCount
                from EmployeeTable emp
                where emp.supervisorID is NULL and deref(emp.bID).bID = deref(:new.bID).bID;
                
                if empCount = 1 then
                    raise_application_error(-20000, 'The branch entered for this employee already has a head employee.');
                end if;
            end if;
        end;
        /

create or replace type Customer as object (
    custID int,
    pers ref Person
) not final
/
create or replace type CustomerAccount as object (
    accNum int,
    accType varchar2(8),
    balance int,
    bID ref Branch,
    inRate number,
    limitOfFreeOD int,
    openDate date
) not final
/
create or replace type CustomersArray as varray(10) of ref Customer
/
create or replace type AccountsArray as varray(10) of ref CustomerAccount
/
alter type Customer
add attribute (accounts AccountsArray) cascade;
/
alter type CustomerAccount
add attribute (customers CustomersArray) cascade;

create table CustomerTable of Customer (
    custID primary key,
    constraint cust_pers_not_null check (pers is not NULL)
);
/
alter type CustomerAccount
add member function getCustomerNames return varchar2 cascade;
/
alter type CustomerAccount
add member function containsPerson(persID int) return varchar2 cascade;
/
alter type CustomerAccount
add member function countCustomers return int cascade;
/
create or replace trigger CheckPersonIsAlreadyCustomer
    before insert or update
        of pers
        on CustomerTable
        for each row
        declare custCount int;
        begin
            select count(*) into custCount
            from CustomerTable cust
            where deref(cust.pers).persID = deref(:new.pers).persID;
            
            if custCount > 0 then
                raise_application_error(-20000, 'This person is already a customer.');
            end if;
        end;
        /
create table AccountTable of CustomerAccount (
    accNum primary key,
    constraint accType_not_null check (accType is not NULL),
    constraint balance_not_null check (balance is not NULL),
    constraint acnt_bID_not_null check (bID is not NULL),
    constraint openDate_not_null check (openDate is not NULL)
);
/
create or replace type body CustomerAccount as
    member function getCustomerNames return varchar2 is customerNames varchar2(476) default NULL;
    customerName varchar2(46) default NULL;
    begin
        if self.customers is not NULL then
            for i in 1 .. self.customers.count loop
                customerName := NULL;
                
                select pers.getName() into customerName
                from PersonTable pers
                join CustomerTable cust on (pers.persID = deref(cust.pers).persID)
                where cust.custID = deref(self.customers(i)).custID;
                
                if customerName is not NULL then
                    if customerNames is NULL then
                        customerNames := customerName;
                    else
                        customerNames := concat(customerNames, ', ' || customerName);
                    end if;
                end if;
            end loop;
        end if;
        return customerNames;
    end getCustomerNames;
    
    member function containsPerson(persID int) return varchar2 is response varchar2(3);
    persCount integer default 0;
    begin
        if self.customers is not NULL then
            for i in 1 .. self.customers.count loop
                select count(*) into persCount
                from PersonTable pers
                where pers.persID = deref(deref(self.customers(i)).pers).persID and pers.persID = persID;
                
                if persCount > 0 then
                    return 'yes';
                end if;
            end loop;
        end if;
        return 'no';
    end containsPerson;
    
    member function countCustomers return int is c int default 0;
    begin
        if self.customers is not NULL then
            for i in 1 .. self.customers.count loop
                if self.customers(i) is not NULL then
                    c := c + 1;
                end if;
            end loop;
        end if;
        return c;
    end countCustomers;
end;
/
alter type Customer
add member function containsAccount(accNum int) return varchar2 cascade;
/
alter type Customer
add member function countAccounts return int cascade;
/
create or replace type body Customer as
    member function containsAccount(accNum int) return varchar2 is response varchar2(3);
    acntCount integer default 0;
    begin
        if self.accounts is not NULL then
            for i in 1 .. self.accounts.count loop
                select count(*) into acntCount
                from AccountTable acnt
                where acnt.accNum = deref(self.accounts(i)).accNum and acnt.accNum = accNum;

                if acntCount > 0 then
                    return 'yes';
                end if;
            end loop;
        end if;
        return 'no';
    end containsAccount;
    
    member function countAccounts return int is c int default 0;
    begin
        if self.accounts is not NULL then
            for i in 1 .. self.accounts.count loop
                if self.accounts(i) is not NULL then
                    c := c + 1;
                end if;
            end loop;
        end if;
        return c;
    end countAccounts;
end;
/
create or replace trigger CheckAccountType
    before insert or update
        of bID
        on AccountTable
        for each row
        begin
            if :new.accType not in ('current', 'savings') then
                raise_application_error(-20000, 'An account`s type must be either current or savings.');
            end if;
        end;
        /
create or replace trigger CheckAccountBranch
    before insert or update
        of bID
        on AccountTable
        for each row
        declare brCount int;
        begin
            select count(*) into brCount
            from BranchTable br
            where br.bID = deref(:new.bID).bID;
            
            if brCount = 0 then
                raise_application_error(-20000, 'The branch entered for this account doesn`t exist.');
            end if;
        end;
        /
create or replace trigger CheckCustomersAccountExists
    before insert or update
        of accounts
        on CustomerTable
        for each row
        declare acntCount int;
        begin
            for i in 1 .. :new.accounts.count loop
                select count(*) into acntCount
                from AccountTable acnt
                where acnt.accNum = deref(:new.accounts(i)).accNum;
                
                if acntCount = 0 then
                    raise_application_error(-20000, 'This customer`s account at index ' || TO_CHAR(i) || ' doesn`t exist.');
                end if;
            end loop;
        end;
        /
create or replace trigger CheckAccountsCustomerExists
    before insert or update
        of customers
        on AccountTable
        for each row
        declare custCount int;
        begin
            if :new.customers is not NULL then
                for i in 1 .. :new.customers.count loop
                    select count(*) into custCount
                    from CustomerTable cust
                    where cust.custID = deref(:new.customers(i)).custID;
                    
                    if custCount = 0 then
                        raise_application_error(-20000, 'This account`s customer at index ' || TO_CHAR(i) || ' doesn`t exist.');
                    end if;
                end loop;
            end if;
        end;
        /
create or replace trigger CheckWorksAtAccountsBranch
    before insert or update
        of accounts
        on CustomerTable
        for each row
        declare empCount int;
        begin
            if :new.accounts is not NULL then /* an customer's accounts may be initially NULL, in case their account(s) needs to be created before we can create a reference to the account(s) */
                for i in 1 .. :new.accounts.count loop
                    select count(*) into empCount
                    from EmployeeTable emp
                    where deref(emp.bID).bID = deref(deref(:new.accounts(i)).bID).bID and deref(emp.pers).persID = deref(:new.pers).persID;
                
                    if empCount > 0 then
                        raise_application_error(-20000, 'Account at index ' || TO_CHAR(i) || ' of this customer`s accounts is assigned to the same branch which this customer is employed at.');
                    end if;
                end loop;                
            end if;
        end;
        /
create or replace trigger CheckIsEmployeeAtBranch
    before insert or update
        of customers
        on AccountTable
        for each row
        declare empCount int;
        begin
            if :new.customers is not NULL then /* an account's customers is initially NULL, in case it's customer needs to be created before we can create a reference to the customer */
                for i in 1 .. :new.customers.count loop
                    select count(*) into empCount
                    from EmployeeTable emp
                    where deref(emp.pers).persID = deref(deref(:new.customers(i)).pers).persID and deref(emp.bID).bID = deref(:new.bID).bID;
                
                    if empCount > 0 then
                        raise_application_error(-20000, 'Person at index ' || TO_CHAR(i) || ' of this account`s customers is an employee at the branch which this account is assigned to.');
                    end if;
                end loop;       
            end if;
        end;
        /
create or replace trigger InitialiseAccount
    before insert or update
        of accNum
        on AccountTable
        for each row
        begin
            if :new.inRate is not NULL or :new.limitOfFreeOD is not NULL then
                raise_application_error(-20000, 'Interest rate and free overdraft limit should be NULL - the bank`s system must initialise these itself.');
            else
                :new.inRate:=dbms_random.value(3,8)/100;
                if :new.accType = 'current' then
                    :new.limitOfFreeOD:=dbms_random.value(1,10)*100;
                end if;
            end if;
        end;