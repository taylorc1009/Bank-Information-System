insert into BranchTable values(
    1,
    Address(24, 'Pithead Crescent', 'Prestonpans', 'HDBF9H5'),
    '01938564837'
);

insert into BranchTable values(
    2,
    Address(24, 'Pithead Crescent', 'Prestonpans', 'HDBF9H5'),
    '01938564837'
);

insert into PersonTable values(
    1,
    AddressArray(
        Address(16, 'High St', 'Musselburgh', 'EH32MFH')
    ),
    PersonName('Mr', 'John', 'Smith'),
    '03957482947',
    MobilePhonesArray(
        '03946392837',
        '03846294756'),
    'NHD8E'
);

insert into EmployeeTable values(
    1,
    (select ref(pers) from PersonTable pers where pers.persID=1),
    NULL,
    'head',
    10000,
    (select ref(br) from BranchTable br where br.bID=1),
    CURRENT_DATE
);

insert into PersonTable values(
    2,
    AddressArray(
        Address(16, 'High St', 'Musselburgh', 'EH32MFH')
    ),
    PersonName('Mr', 'John', 'Smith'),
    '03957482947',
    MobilePhonesArray(
        '03946392837',
        '03846294756'),
    'HGU6E'
);

insert into EmployeeTable values(
    2,
    (select ref(pers) from PersonTable pers where pers.persID=2),
    (select ref(emp) from EmployeeTable emp where emp.empID=1),
    'cashier',
    10000,
    (select ref(br) from BranchTable br where br.bID=1),
    CURRENT_DATE
);

insert into PersonTable values(
    3,
    AddressArray(
        Address(16, 'High St', 'Musselburgh', 'EH32MFH')
    ),
    PersonName('Mr', 'John', 'Smith'),
    '03957482947',
    MobilePhonesArray(
        '03946392837',
        '03846294756'),
    'NHBF3'
);

insert into EmployeeTable values(
    3,
    (select ref(pers) from PersonTable pers where pers.persID=3),
    (select ref(emp) from EmployeeTable emp where emp.empID=1),
    'cashier',
    10000,
    (select ref(br) from BranchTable br where br.bID=2),
    CURRENT_DATE
);

insert into AccountTable values(
    1,
    'current',
    2000,
    (select ref(br) from BranchTable br where br.bID=1),
    NULL,
    NULL,
    CURRENT_DATE,
    NULL
);
insert into AccountTable values(
    2,
    'savings',
    2000,
    (select ref(br) from BranchTable br where br.bID=2),
    NULL,
    NULL,
    CURRENT_DATE,
    NULL
);

insert into PersonTable values (
    4,
    AddressArray(
        Address(16, 'High St', 'Musselburgh', 'EH32MFH')
    ),
    PersonName('Mr', 'John', 'Smith'),
    '03957482947',
    MobilePhonesArray(
        '03946392837',
        '03846294756'),
    'NDWA2'
);

insert into CustomerTable values(
    1,
    (select ref(pers) from PersonTable pers where pers.persID=4),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=1)
    )
);

insert into CustomerTable values(
    2,
    (select ref(pers) from PersonTable pers where pers.persID=2),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=2)
    )
);

update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=1)
) where acnt.accNum=1;

update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=2)
) where acnt.accNum=2;

/* select deref(emp.supervisorID) from EmployeeTable emp; */
/* select * from AccountTable */