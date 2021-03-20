/* branch objects */
drop type Branch force;
drop table BranchTable purge;

/* person objects */
drop table CustomerTable purge;
drop table EmployeeTable purge;
drop table PersonTable purge;
drop type Customer force;
drop type Employee force;

/* account objects */
drop table AccountTable purge;
drop type CustomerAccount force;
drop type CustomersArray force;
drop type AccountsArray force;

/* additional objects */
drop type Address force;
drop type Person force;
drop type PersonName force;
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
    bPhone varchar2(11)
) not final
/
create table BranchTable of Branch (
    bID primary key
);
/
create or replace trigger CheckBranchPhone
    before insert or update
        of bPhone
        on BranchTable
        for each row
        begin
            if not regexp_like(:new.bPhone, '^[[:digit:]]{8,11}') then
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
    niNum varchar2(5)
) final
/
create table PersonTable of Person (
    persID primary key,
    constraint niNumConst unique(niNum)
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
            if not regexp_like(:new.homePhone, '^[[:digit:]]{8,11}') then
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
            for i in :new.mobilePhones.first .. :new.mobilePhones.last loop
                if not regexp_like(:new.mobilePhones(i), '^[[:digit:]]{8,11}') then
                    raise_application_error(-20000, 'This person`s mobile phone number at index ' || i || ' wasn`t 8-11 numbers long or didn`t consist of only numbers.');
                end if;
            end loop;
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
    joinDate date
) not final
/
create table EmployeeTable of Employee (
    empID primary key
);
/
create or replace trigger CheckPersonIsAlreadyEmployee
    before insert or update
        of pers
        on EmployeeTable
        for each row
        declare i int;
        begin
            select count(*) into i
            from EmployeeTable emp
            where deref(emp.pers).persID=deref(:new.pers).persID;
            
            if i>0 then
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
        declare i int;
        begin
            if :new.empPosition not in ('head', 'manager', 'team leader') then
                select count(*) into i
                from EmployeeTable emp
                where emp.empID=deref(:new.supervisorID).empID and emp.empPosition in ('head', 'manager', 'team leader');
                
                if i=0 then
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
        declare i int;
        begin
            if :new.supervisorID is not NULL then
                select count(*) into i
                from EmployeeTable emp
                where emp.empID=deref(:new.supervisorID).empID and deref(emp.bID).bID=deref(:new.bID).bID;
                
                if i=0 then
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
        declare i int;
        begin
            select count(*) into i
            from BranchTable br
            where br.bID=deref(:new.bID).bID;
            
            if i=0 then
                raise_application_error(-20000, 'The branch entered for this employee doesn`t exist.');
            end if;
        end;
        /
create or replace trigger CheckBranchSupervisor
    before insert or update
        of supervisorID
        on EmployeeTable
        for each row
        declare i int;
        begin
            if :new.supervisorID is NULL then
                select count(*) into i
                from EmployeeTable emp
                where emp.supervisorID is NULL and deref(emp.bID).bID=deref(:new.bID).bID;
                
                if i=1 then
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
    custID primary key
);
/
alter type CustomerAccount
add member function getCustomerNames return varchar2 cascade;
/
create or replace type body CustomerAccount as
    member function getCustomerNames return varchar2 is customerNames varchar2(418);
    customerName varchar2(418) default NULL;
    begin
        if self.customers is not NULL then
            for i in self.customers.first .. self.customers.last loop
                customerName := NULL;
                
                select concat(pers.pName.firstName || ' ', pers.pname.surName) into customerName
                from PersonTable pers
                join CustomerTable cust on (pers.persID = deref(cust.pers).persID)
                where cust.custID = deref(self.customers(i)).custID;
                
                if customerName is not NULL then
                    if customerNames is NULL then
                        customerNames := customerName;
                    else
                        customerNames := concat(customerNames || ', ', customerName);
                    end if;
                end if;
            end loop;
        end if;
        return customerNames;
    end getCustomerNames;
end;
/
create or replace trigger CheckPersonIsAlreadyCustomer
    before insert or update
        of pers
        on CustomerTable
        for each row
        declare i int;
        begin
            select count(*) into i
            from CustomerTable cust
            where deref(cust.pers).persID=deref(:new.pers).persID;
            
            if i>0 then
                raise_application_error(-20000, 'This person is already a customer.');
            end if;
        end;
        /
create table AccountTable of CustomerAccount (
    accNum primary key
);
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
        declare i int;
        begin
            select count(*) into i
            from BranchTable br
            where br.bID=deref(:new.bID).bID;
            
            if i=0 then
                raise_application_error(-20000, 'The branch entered for this account doesn`t exist.');
            end if;
        end;
        /
create or replace trigger CheckCustomerAccounts
    before insert or update
        of accounts
        on CustomerTable
        for each row
        declare acntCount int;
        begin
            for i in :new.accounts.first .. :new.accounts.last loop
                select count(*) into acntCount
                from AccountTable acnt
                where acnt.accNum=deref(:new.accounts(i)).accNum;
                
                if acntCount=0 then
                    raise_application_error(-20000, 'This customer`s account at index ' || TO_CHAR(i) || ' doesn`t exist.');
                end if;
            end loop;
        end;
        /
create or replace trigger CheckAccountCustomers
    before insert or update
        of customers
        on AccountTable
        for each row
        declare custCount int;
        begin
            if :new.customers is not NULL then
                for i in :new.customers.first .. :new.customers.last loop
                    select count(*) into custCount
                    from CustomerTable cust
                    where cust.custID=deref(:new.customers(i)).custID;
                    
                    if custCount=0 then
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
        declare i int;
        begin
            if :new.accounts is not NULL then /* an customer's accounts may be initially NULL, in case their account(s) needs to be created before we can create a reference to the account(s) */
                for j in :new.accounts.first .. :new.accounts.last loop
                    i:=0;
                    
                    select count(*) into i
                    from EmployeeTable emp
                    where deref(emp.bID).bID=deref(deref(:new.accounts(j)).bID).bID and deref(emp.pers).persID=deref(:new.pers).persID;
                
                    if i>0 then
                        raise_application_error(-20000, 'Account at index ' || TO_CHAR(j) || ' of this customer`s accounts is assigned to the same branch which this customer is employed at.');
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
        declare i int;
        begin
            if :new.customers is not NULL then /* an account's customers is initially NULL, in case it's customer needs to be created before we can create a reference to the customer */
                for j in :new.customers.first .. :new.customers.last loop
                    i:=0;
                    
                    select count(*) into i
                    from EmployeeTable emp
                    where deref(emp.pers).persID=deref(deref(:new.customers(j)).pers).persID and deref(emp.bID).bID=deref(:new.bID).bID;
                
                    if i>0 then
                        raise_application_error(-20000, 'Person at index ' || TO_CHAR(j) || ' of this account`s customers is an employee at the branch which this account is assigned to.');
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
                :new.limitOfFreeOD:=dbms_random.value(1,10)*100;
            end if;
        end;