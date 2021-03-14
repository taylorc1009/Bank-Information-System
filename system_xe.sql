/* branch objects */
drop type Branch force;
drop table BranchTable purge;

/* person objects */
drop table CustomerTable purge;
drop table EmployeeTable purge;
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
create table BranchTable of Branch;





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
    addr AddressArray,
    pName PersonName,
    homePhone varchar2(11),
    mobilePhones MobilePhonesArray,
    niNum varchar2(5)
) final
/
create or replace type Employee as object (
    empID int,
    pers Person,
    supervisorID ref Employee,
    empPosition varchar2(20),
    salary int,
    bID ref Branch,
    joinDate date
) not final
/
create table EmployeeTable of Employee;
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
                where emp.empID=deref(:new.supervisorID).empID;/* and emp.empPosition in ('head', 'manager', 'team leader');*/
                
                if i=0 then
                    raise_application_error(-20000, 'Employees who aren`t managers must have a valid supervisor.');
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
                raise_application_error(-20000, 'Employees must work at a valid branch.');
            end if;
        end;
        /
create or replace trigger CheckEmployeeTitle
    before insert or update
        of pers
        on EmployeeTable
        for each row
        begin
            if :new.pers.pName.title not in ('Mr', 'Mrs', 'Miss', 'Ms', 'Mstr') then
                raise_application_error(-20000, 'A person`s title must be either: Mr, Mrs, Miss, Ms, or Mstr.');
            end if;
        end;
        /





create or replace type Customer as object (
    custID int,
    pers Person
) not final
/
create or replace type CustomerAccount as object (
    accNum int,
    accType varchar2(7),
    balance int,
    bID int,
    inRate int,
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

create table CustomerTable of Customer;
/
create or replace trigger CheckCustomerTitle
    before insert or update
        of pers
        on CustomerTable
        for each row
        begin
            if :new.pers.pName.title not in ('Mr', 'Mrs', 'Miss', 'Ms', 'Mstr') then
                raise_application_error(-20000, 'A person`s title must be either: Mr, Mrs, Miss, Ms, or Mstr.');
            end if;
        end;
        /
create table AccountTable of CustomerAccount;