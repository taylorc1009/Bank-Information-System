/* branch table */
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





/* person table */
insert into PersonTable values(
    1,
    AddressArray(
        Address(4, 'Leadburn Road', 'Glasgow', 'EH30HNS')
    ),
    PersonName('Mr', 'Steven', 'Gracey'),
    '01936287463',
    MobilePhonesArray(
        '08475538038',
        '02984746294'),
    'HSGF6'
);

insert into PersonTable values(
    2,
    AddressArray(
        Address(16, 'George Street', 'Edinburgh', 'EH32MFH')
    ),
    PersonName('Mr', 'John', 'Smith'),
    '03957482947',
    MobilePhonesArray(
        '03946392837',
        '03846294756'),
    'HGU6E'
);

insert into PersonTable values(
    3,
    AddressArray(
        Address(44, 'West Port', 'Edinburgh', 'EH66SHN')
    ),
    PersonName('Mstr', 'Stanley', 'Elm'),
    '07286737382',
    MobilePhonesArray(
        '02729273729'
    ),
    'NSG3A'
);

insert into PersonTable values (
    4,
    AddressArray(
        Address(71, 'Brunbrae Street', 'Glasgow', 'H10N7VS')
    ),
    PersonName('Mrs', 'Staci', 'Muir'),
    '08352838462',
    MobilePhonesArray(
        '03846384747'
    ),
    'HS1M0'
);

insert into PersonTable values(
    5,
    AddressArray(
        Address(10, 'Dykemuir Street', 'Glasgow', 'EHNC5A4')
    ),
    PersonName('Mr', 'Arron', 'McLean'),
    '07293736462',
    MobilePhonesArray(
        '03984746383'
    ),
    '8N5AH'
);

insert into PersonTable values(
    6,
    AddressArray(
        Address(39, 'Petershill Drive', 'Glasgow', 'HNS9M43')
    ),
    PersonName('Miss', 'Carol', 'Burns'),
    '09274826372',
    MobilePhonesArray(
        '08364836476'
    ),
    'HSN6A'
);

insert into PersonTable values(
    7,
    AddressArray(
        Address(4, 'Rye Drive', 'Glasgow', 'HD3A44S')
    ),
    PersonName('Mr', 'Walter', 'Shall'),
    '07362673827',
    MobilePhonesArray(
        '07362288287',
        '03283833834',
        '01938284728'
    ),
    'ND0NS'
);

insert into PersonTable values (
    8,
    AddressArray(
        Address(11, 'Petershill Road', 'Glasgow', 'EG339AF')
    ),
    PersonName('Mrs', 'Stella', 'Shall'),
    '08352838462',
    MobilePhonesArray(
        '03846384747'
    ),
    'HS9OP'
);

insert into PersonTable values(
    9,
    AddressArray(
        Address(14, 'Torryburn Close', 'Glasgow', 'EHBOE0P')
    ),
    PersonName('Mstr', 'James', 'Reyburn'),
    '03948737374',
    MobilePhonesArray(
        '02484783683'
    ),
    'NDH8W'
);

insert into PersonTable values (
    10,
    AddressArray(
        Address(11, 'Telford Street', 'Inverness', 'HNCCJDO')
    ),
    PersonName('Mr', 'Stewart', 'Kidd'),
    '06428273839',
    MobilePhonesArray(
        '09382793749'
    ),
    'NSGC0'
);

insert into PersonTable values(
    11,
    AddressArray(
        Address(64, 'Harrowden Road', 'Inverness', 'EH4499E')
    ),
    PersonName('Ms', 'Ellie', 'Gregg'),
    '01882837283',
    MobilePhonesArray(
        '02938293739'
    ),
    'HANC1'
);

insert into PersonTable values(
    12,
    AddressArray(
        Address(91, 'Dunain Road', 'Inverness', 'AH8N64S')
    ),
    PersonName('Miss', 'Carla', 'Quinn'),
    '08293723739',
    MobilePhonesArray(
        '02938293738',
        '08372927387',
        '02937287220'
    ),
    'FFA6D'
);

insert into PersonTable values(
    13,
    AddressArray(
        Address(5, 'Douglas Row', 'Inverness', 'EH5N449')
    ),
    PersonName('Mr', 'Bruce', 'Greene'),
    '02947463838',
    MobilePhonesArray(
        '09374937228'
    ),
    'N333A'
);

insert into PersonTable values (
    14,
    AddressArray(
        Address(70, 'Kingsmills Road', 'Inverness', 'HH5RT5T')
    ),
    PersonName('Mr', 'Stephen', 'Lowe'),
    '09337473872',
    MobilePhonesArray(
        '02937297390'
    ),
    'HSNJA'
);

insert into PersonTable values(
    15,
    AddressArray(
        Address(10, 'Brighton Place', 'Aberdeen', 'HE5567N')
    ),
    PersonName('Miss', 'Sally', 'Anderson'),
    '03947937393',
    MobilePhonesArray(
        '04472424832',
        '02938478277'
    ),
    '33AJN'
);

insert into PersonTable values(
    16,
    AddressArray(
        Address(30, 'Queen`s Lane South', 'Aberdeen', 'HSKA8HK')
    ),
    PersonName('Ms', 'Allison', 'Fray'),
    '0927382773',
    MobilePhonesArray(
        '02387477262'
    ),
    'NN8B3'
);

insert into PersonTable values(
    17,
    AddressArray(
        Address(60, 'Union Grove Lane', 'Aberdeen', 'HSNA6S4')
    ),
    PersonName('Mr', 'Jack', 'Albyn'),
    '02937293772',
    MobilePhonesArray(
        '09824273622'
    ),
    'NJA0M'
);

insert into PersonTable values (
    18,
    AddressArray(
        Address(40, 'Rose Street', 'Aberdeen', 'ENHS7S5')
    ),
    PersonName('Mrs', 'Molly', 'Irvine'),
    '02837292723',
    MobilePhonesArray(
        '02937936283',
        '02991922182',
        '07346282218'
    ),
    'LM4GG'
);

insert into PersonTable values(
    19,
    AddressArray(
        Address(34, 'Lawson Place', 'Dundee', 'HHG4A32')
    ),
    PersonName('Miss', 'Ann', 'Drummond'),
    '02937237632',
    MobilePhonesArray(
        '07978447522'
    ),
    '44G7H'
);

insert into PersonTable values (
    20,
    AddressArray(
        Address(22, 'Forebank Road', 'Dundee', 'ENBB7G7')
    ),
    PersonName('Mr', 'Allan', 'Strathmore'),
    '02938293738',
    MobilePhonesArray(
        '06928739283'
    ),
    'DDIKM'
);

insert into PersonTable values (
    21,
    AddressArray(
        Address(48, 'Lothian Road', 'Edinburgh', 'EH3BBG7')
    ),
    PersonName('Mrs', 'Haley', 'Jones'),
    '08383727629',
    MobilePhonesArray(
        '06928739283',
        '07608343766'
    ),
    'JK1A8'
);





/* employee table - Mstrs are 3 and 9 (so far) so don't use these as employees */
insert into EmployeeTable values(
    1,
    (select ref(pers) from PersonTable pers where pers.persID=21),
    NULL,
    'head',
    12000,
    (select ref(br) from BranchTable br where br.bID=1),
    '1-MAY-99'
);

insert into EmployeeTable values(
    2,
    (select ref(pers) from PersonTable pers where pers.persID=2),
    (select ref(emp) from EmployeeTable emp where emp.empID=1),
    'team leader',
    9000,
    (select ref(br) from BranchTable br where br.bID=1),
    '17-APR-02'
);

insert into EmployeeTable values(
    3,
    (select ref(pers) from PersonTable pers where pers.persID=1),
    (select ref(emp) from EmployeeTable emp where emp.empID=1),
    'manager',
    9000,
    (select ref(br) from BranchTable br where br.bID=1),
    '23-AUG-06'
);

insert into EmployeeTable values(
    4,
    (select ref(pers) from PersonTable pers where pers.persID=4),
    (select ref(emp) from EmployeeTable emp where emp.empID=2),
    'cashier',
    2700,
    (select ref(br) from BranchTable br where br.bID=1),
    '4-NOV-15'
);

insert into EmployeeTable values(
    5,
    (select ref(pers) from PersonTable pers where pers.persID=5),
    (select ref(emp) from EmployeeTable emp where emp.empID=2),
    'accountant',
    3000,
    (select ref(br) from BranchTable br where br.bID=1),
    '14-JUN-14'
);

insert into EmployeeTable values(
    6,
    (select ref(pers) from PersonTable pers where pers.persID=6),
    (select ref(emp) from EmployeeTable emp where emp.empID=2),
    'cashier',
    3000,
    (select ref(br) from BranchTable br where br.bID=1),
    '10-DEC-14'
);

insert into EmployeeTable values(
    7,
    (select ref(pers) from PersonTable pers where pers.persID=7),
    NULL,
    'manager',
    10000,
    (select ref(br) from BranchTable br where br.bID=2),
    '12-MAY-07'
);

insert into EmployeeTable values(
    8,
    (select ref(pers) from PersonTable pers where pers.persID=8),
    (select ref(emp) from EmployeeTable emp where emp.empID=7),
    'accountant',
    4000,
    (select ref(br) from BranchTable br where br.bID=2),
    '18-MAY-09'
);

insert into EmployeeTable values(
    9,
    (select ref(pers) from PersonTable pers where pers.persID=10),
    (select ref(emp) from EmployeeTable emp where emp.empID=7),
    'cashier',
    2700,
    (select ref(br) from BranchTable br where br.bID=2),
    '5-JAN-16'
);

insert into EmployeeTable values(
    10,
    (select ref(pers) from PersonTable pers where pers.persID=11),
    (select ref(emp) from EmployeeTable emp where emp.empID=7),
    'cashier',
    2700,
    (select ref(br) from BranchTable br where br.bID=2),
    '8-OCT-15'
);

insert into EmployeeTable values(
    11,
    (select ref(pers) from PersonTable pers where pers.persID=12),
    NULL,
    'manager',
    10000,
    (select ref(br) from BranchTable br where br.bID=3),
    '29-JUN-10'
);

insert into EmployeeTable values(
    12,
    (select ref(pers) from PersonTable pers where pers.persID=13),
    (select ref(emp) from EmployeeTable emp where emp.empID=11),
    'team leader',
    6500,
    (select ref(br) from BranchTable br where br.bID=3),
    '7-DEC-10'
);

insert into EmployeeTable values(
    13,
    (select ref(pers) from PersonTable pers where pers.persID=14),
    (select ref(emp) from EmployeeTable emp where emp.empID=11),
    'cashier',
    3000,
    (select ref(br) from BranchTable br where br.bID=3),
    '18-JUL-14'
);

insert into EmployeeTable values(
    14,
    (select ref(pers) from PersonTable pers where pers.persID=15),
    (select ref(emp) from EmployeeTable emp where emp.empID=11),
    'cashier',
    3000,
    (select ref(br) from BranchTable br where br.bID=3),
    '7-MAR-15'
);

insert into EmployeeTable values(
    15,
    (select ref(pers) from PersonTable pers where pers.persID=16),
    (select ref(emp) from EmployeeTable emp where emp.empID=11),
    'cashier',
    3000,
    (select ref(br) from BranchTable br where br.bID=3),
    '15-DEC-14'
);





/* account table */
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





/* customer table */
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





/* add customers to their respective account's customer list */
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=1)
) where acnt.accNum=1;

update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=2)
) where acnt.accNum=2;

/* select deref(emp.supervisorID) from EmployeeTable emp where emp.supervisorID is not NULL; */
/* select * from AccountTable; */