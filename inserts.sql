insert into BranchTable values(
    1,
    Address(24, 'Pithead Crescent', 'Prestonpans', 'HDBF9H5'),
    '01938564837'
);

insert into EmployeeTable values(
    1,
    Person(
        AddressArray(
            Address(16, 'High St', 'Musselburgh', 'EH32MFH')
        ),
        PersonName('Mr', 'John', 'Smith'),
        '03957482947',
        MobilePhonesArray(
            '03946392837',
            '03846294756'),
        'NHD8E'
    ),
    NULL, 'head', 10000, (select ref(br) from BranchTable br where br.bID=1), CURRENT_DATE
);

insert into EmployeeTable values(
    2,
    Person(
        AddressArray(
            Address(16, 'High St', 'Musselburgh', 'EH32MFH')
        ),
        PersonName('Mr', 'John', 'Smith'),
        '03957482947',
        MobilePhonesArray(
            '03946392837',
            '03846294756'),
        'NHD8E'
    ),
    (select ref(emp) from EmployeeTable emp where emp.empID=1), 'cashier', 10000, (select ref(br) from BranchTable br where br.bID=1), CURRENT_DATE
);

insert into EmployeeTable values(
    3,
    Person(
        AddressArray(
            Address(16, 'High St', 'Musselburgh', 'EH32MFH')
        ),
        PersonName('Mr', 'John', 'Smith'),
        '03957482947',
        MobilePhonesArray(
            '03946392837',
            '03846294756'),
        'NHD8E'
    ),
    (select ref(emp) from EmployeeTable emp where emp.empID=1), 'cashier', 10000, (select ref(br) from BranchTable br where br.bID=1), CURRENT_DATE
);

insert into AccountTable values(
    1,
    'current',
    2000,
    (select ref(br) from BranchTable br where br.bID=1),
    0.05,
    500,
    CURRENT_DATE,
    NULL
);
insert into AccountTable values(
    2,
    'savings',
    2000,
    (select ref(br) from BranchTable br where br.bID=1),
    0.05,
    500,
    CURRENT_DATE,
    NULL
);

insert into CustomerTable values(
    1,
    Person(
        AddressArray(
            Address(16, 'High St', 'Musselburgh', 'EH32MFH')
        ),
        PersonName('Mr', 'John', 'Smith'),
        '03957482947',
        MobilePhonesArray(
            '03946392837',
            '03846294756'),
        'NHD8E'
    ),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=1),
        (select ref(acnt) from AccountTable acnt where acnt.accNum=2)
    )
);

/* select deref(emp.supervisorID) from EmployeeTable emp; */