/* branches */
insert into BranchTable values(
    1,
    Address(24, 'Lothian Road', 'Edinburgh', 'EH54NG7'),
    '01984610485'
);

insert into BranchTable values(
    2,
    Address(7, 'Cowcaddens Road', 'Glasgow', 'EH43NGS'),
    '01997356720'
);

insert into BranchTable values(
    3,
    Address(15, 'Gallowgate', 'Glasgow', 'HDBF9H5'),
    '01938564837'
);

insert into BranchTable values(
    4,
    Address(33, 'Edmiston Drive', 'Glasgow', 'NSHA75D'),
    '01931038257'
);

insert into BranchTable values(
    5,
    Address(80, 'Bruntsfield Place', 'Edinburgh', 'HS87B15'),
    '01983725382'
);

insert into BranchTable values(
    6,
    Address(29, 'Pennywell Road', 'Edinburgh', 'H3BD86S'),
    '01992817365'
);

insert into BranchTable values(
    7,
    Address(2, 'Hawkhill', 'Dundee', 'ENU9H76'),
    '01827364150'
);

insert into BranchTable values(
    8,
    Address(30, 'Strathmore Avenue', 'Dundee', 'E6BSUDB'),
    '01735120384'
);

insert into BranchTable values(
    9,
    Address(8, 'Balunie Drive', 'Dundee', 'HSNC7AL'),
    '01029383136'
);

insert into BranchTable values(
    10,
    Address(67, 'Coupar Angus Road', 'Dundee', 'ESNC8O1'),
    '01012837468'
);

insert into BranchTable values(
    11,
    Address(44, 'Willowbank Road', 'Aberdeen', 'EH8H099'),
    '01123827745'
);

insert into BranchTable values(
    12,
    Address(17, 'Berryden Road', 'Aberdeen', 'HH75NDN'),
    '01102816419'
);

insert into BranchTable values(
    13,
    Address(31, 'Auchinyell Road', 'Aberdeen', 'EH56BDH'),
    '01983651841'
);

insert into BranchTable values(
    14,
    Address(12, 'North Esplanade Way', 'Aberdeen', 'NSB23B1'),
    '01931038257'
);

insert into BranchTable values(
    15,
    Address(89, 'Culduthel Road', 'Inverness', 'HHSB415'),
    '01983709937'
);

insert into BranchTable values(
    16,
    Address(45, 'Old Edinburgh Road', 'Inverness', 'HXHG76S'),
    '01077827716'
);

insert into BranchTable values(
    17,
    Address(22, 'Bank Street', 'Inverness', 'EHGLK76'),
    '01719926481'
);

insert into BranchTable values(
    18,
    Address(39, 'Telford Street', 'Inverness', 'EHB22SO'),
    '01152715748'
);

insert into BranchTable values(
    19,
    Address(52, 'Drum Brae North', 'Edinburgh', 'EH3C7YL'),
    '01082716430'
);

insert into BranchTable values(
    20,
    Address(97, 'Colinton Road', 'Edinburgh', 'ESF5TQ8'),
    '01733839428'
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