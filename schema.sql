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
drop type AddressArray force;
drop type Address force;
drop type Person force;
drop type PersonName force;
drop type MobilePhonesArray force;



create or replace type Address as object (
    houseNum int,
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





create or replace type PersonName as object (
    title varchar(4),
    firstName varchar(20),
    surName varchar(20)
) final
/
create or replace type MobilePhonesArray as varray(10) of varchar2(11)
/
create or replace type AddressArray as varray(10) of Address
/
create or replace type Person as object (
    persID int,
    addr AddressArray,
    pName PersonName,
    homePhone varchar2(11),
    mobilePhones MobilePhonesArray,
    niNum varchar2(5)
) final
/
create table PersonTable of Person (
    persID primary key
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
create or replace type Employee as object (
    empID int,
    pers ref Person,
    supervisorID ref Employee,
    empPosition varchar2(20),
    salary int,
    bID ref Branch,
    joinDate date/*,
    member function getSupervisorRef(eID int) return ref Employee*/
) not final
/
create table EmployeeTable of Employee (
    empID primary key
);
/
/*create or replace type body Employee as
member function getSupervisorRef(eID int) return ref Employee is emp ref Employee;
    begin
        select ref(s) into emp from EmployeeTable s where s.empID=eID;
        return emp;
    end getSupervisorRef;
end;
/*/
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
create or replace trigger CheckEmployeeSupervisor
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
                    raise_application_error(-20000, 'Employees who aren`t managers must have a valid supervisor - either a: head, manager, or team leader');
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
create or replace trigger CheckCustomerAccount
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
                    raise_application_error(-20000, concat('This customer`s account at index ', concat(TO_CHAR(i), ' doesn`t exist.')));
                end if;
            end loop;
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
                :new.inRate:=0.05;
                :new.limitOfFreeOD:=500;
            end if;
        end;