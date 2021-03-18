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
        Address(16, 'George Street', 'Edinburgh', 'EH32MFH')
    ),
    PersonName('Mstr', 'Stanley', 'Smith'),
    '03957482947',
    MobilePhonesArray(
        '02729273729'
    ),
    'NSG3A'
);

insert into PersonTable values (
    4,
    AddressArray(
        Address(14, 'Torryburn Close', 'Glasgow', 'EHBOE0P')
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
    PersonName('Mstr', 'James', 'Muir'),
    '08352838462',
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

insert into PersonTable values (
    22,
    AddressArray(
        Address(42, 'Queen`s Lane South', 'Aberdeen', 'HBSGCJG')
    ),
    PersonName('Mr', 'Alex', 'Johansen'),
    '08338346643',
    MobilePhonesArray(
        '08474638463'
    ),
    'JHN6S'
);

insert into PersonTable values (
    23,
    AddressArray(
        Address(49, 'Forebank Road', 'Dundee', 'ENB99L7')
    ),
    PersonName('Mr', 'Jason', 'Easton'),
    '08384736643',
    MobilePhonesArray(
        '04474128463'
    ),
    'JHX6S'
);

insert into PersonTable values (
    24,
    AddressArray(
        Address(40, 'Rose Street', 'Aberdeen', 'ENHS7S5')
    ),
    PersonName('Mr', 'Aidan', 'Wright'),
    '07146438643',
    MobilePhonesArray(
        '08484757493'
    ),
    'FAN6S'
);

insert into PersonTable values (
    25,
    AddressArray(
        Address(20, 'West Port', 'Edinburgh', 'EHOP2HN')
    ),
    PersonName('Mrs', 'Sarah', 'Cochrane'),
    '01735244643',
    MobilePhonesArray(
        '09476638463'
    ),
    'FKS09'
);

insert into PersonTable values (
    26,
    AddressArray(
        Address(23, 'Brighton Place', 'Aberdeen', 'HE5508N')
    ),
    PersonName('Mstr', 'Lilly', 'Holmes'),
    '08338374543',
    MobilePhonesArray(
        '08474736463'
    ),
    'KHN86'
);

insert into PersonTable values (
    27,
    AddressArray(
        Address(37, 'Dunain Road', 'Inverness', 'AH8N64S')
    ),
    PersonName('Mr', 'Robert', 'Carlson'),
    '08338399933',
    MobilePhonesArray(
        '08427254463'
    ),
    'HBSH2'
);

insert into PersonTable values (
    28,
    AddressArray(
        Address(16, 'George Street', 'Edinburgh', 'EH32MFH')
    ),
    PersonName('Mrs', 'Jane', 'Smith'),
    '03957482947',
    MobilePhonesArray(
        '08474638463'
    ),
    'BBAHS'
);

insert into PersonTable values (
    29,
    AddressArray(
        Address(44, 'West Port', 'Edinburgh', 'EH66SHN')
    ),
    PersonName('Miss', 'Joanne', 'Richards'),
    '08338346643',
    MobilePhonesArray(
        '08474638463'
    ),
    'LAIW7'
);

insert into PersonTable values (
    30,
    AddressArray(
        Address(23, 'Brighton Place', 'Aberdeen', 'HE5508N')
    ),
    PersonName('Ms', 'Zoe', 'Holmes'),
    '08338374543',
    MobilePhonesArray(
        '08474638463'
    ),
    'XNSG7'
);

insert into PersonTable values(
    31,
    AddressArray(
        Address(40, 'Leadburn Road', 'Glasgow', 'EH30HNS')
    ),
    PersonName('Mrs', 'Carla', 'Gracey'),
    '01936287463',
    MobilePhonesArray(
        '08475538038',
        '02984746294'),
    'JIHVT'
);

insert into PersonTable values(
    32,
    AddressArray(
        Address(6, 'George Street', 'Edinburgh', 'EH32MFH')
    ),
    PersonName('Mrs', 'Mary', 'Smith'),
    '03957482947',
    MobilePhonesArray(
        '03946392837',
        '03846294756'),
    'GUMSI'
);

insert into PersonTable values(
    33,
    AddressArray(
        Address(6, 'George Street', 'Edinburgh', 'EH32MFH')
    ),
    PersonName('Ms', 'Heather', 'Graham'),
    '03957482947',
    MobilePhonesArray(
        '02729273729'
    ),
    'JSIND'
);

insert into PersonTable values (
    34,
    AddressArray(
        Address(4, 'Torryburn Close', 'Glasgow', 'EHBOE0P')
    ),
    PersonName('Mr', 'David', 'Mall'),
    '08352838462',
    MobilePhonesArray(
        '03846384747'
    ),
    'SMKSL'
);

insert into PersonTable values(
    35,
    AddressArray(
        Address(11, 'Dykemuir Street', 'Glasgow', 'EHNC5A4')
    ),
    PersonName('Ms', 'Briteny', 'Reyburn'),
    '07293736462',
    MobilePhonesArray(
        '03984746383'
    ),
    'JSNDS'
);

insert into PersonTable values(
    36,
    AddressArray(
        Address(9, 'Petershill Drive', 'Glasgow', 'HNS9M43')
    ),
    PersonName('Miss', 'Fiona', 'Smithers'),
    '09274826372',
    MobilePhonesArray(
        '08364836476'
    ),
    'MSNDP'
);

insert into PersonTable values(
    37,
    AddressArray(
        Address(20, 'Rye Drive', 'Glasgow', 'HD3A44S')
    ),
    PersonName('Mstr', 'Samantha', 'Jackson'),
    '07362673827',
    MobilePhonesArray(
        '07362288287',
        '03283833834',
        '01938284728'
    ),
    'JSNDD'
);

insert into PersonTable values (
    38,
    AddressArray(
        Address(1, 'Petershill Road', 'Glasgow', 'EG339AF')
    ),
    PersonName('Miss', 'Demi', 'Shall'),
    '08352838462',
    MobilePhonesArray(
        '03846384747'
    ),
    'SJNDJ'
);

insert into PersonTable values(
    39,
    AddressArray(
        Address(4, 'Torryburn Close', 'Glasgow', 'EHBOE0P')
    ),
    PersonName('Mr', 'James', 'Evans'),
    '08352838462',
    MobilePhonesArray(
        '02484783683'
    ),
    '27BSU'
);

insert into PersonTable values (
    40,
    AddressArray(
        Address(1, 'Telford Street', 'Inverness', 'HNCCJDO')
    ),
    PersonName('Mrs', 'Rachael', 'Stewart'),
    '06428273839',
    MobilePhonesArray(
        '09382793749'
    ),
    'NSJB8'
);

insert into PersonTable values(
    41,
    AddressArray(
        Address(6, 'Harrowden Road', 'Inverness', 'EH4499E')
    ),
    PersonName('Ms', 'Rebecca', 'Howards'),
    '01882837283',
    MobilePhonesArray(
        '02938293739'
    ),
    'WUNW9'
);

insert into PersonTable values(
    42,
    AddressArray(
        Address(9, 'Dunain Road', 'Inverness', 'AH8N64S')
    ),
    PersonName('Mr', 'Carlos', 'Peterson'),
    '08293723739',
    MobilePhonesArray(
        '02938293738',
        '08372927387',
        '02937287220'
    ),
    'SJIKN'
);

insert into PersonTable values(
    43,
    AddressArray(
        Address(52, 'Douglas Row', 'Inverness', 'EH5N449')
    ),
    PersonName('Mr', 'Bryce', 'Brown'),
    '02947463838',
    MobilePhonesArray(
        '09374937228'
    ),
    'SNJ87'
);

insert into PersonTable values (
    44,
    AddressArray(
        Address(7, 'Kingsmills Road', 'Inverness', 'HH5RT5T')
    ),
    PersonName('Mr', 'George', 'Wallace'),
    '09337473872',
    MobilePhonesArray(
        '02937297390'
    ),
    'SJNJD'
);

insert into PersonTable values(
    45,
    AddressArray(
        Address(1, 'Brighton Place', 'Aberdeen', 'HE5567N')
    ),
    PersonName('Miss', 'Sally', 'Anderson'),
    '03947937393',
    MobilePhonesArray(
        '04472424832',
        '02938478277'
    ),
    '97BXH'
);

insert into PersonTable values(
    46,
    AddressArray(
        Address(3, 'Queen`s Lane South', 'Aberdeen', 'HSKA8HK')
    ),
    PersonName('Mr', 'Alistiar', 'Cameron'),
    '0927382773',
    MobilePhonesArray(
        '02387477262'
    ),
    '79NAJ'
);

insert into PersonTable values(
    47,
    AddressArray(
        Address(6, 'Union Grove Lane', 'Aberdeen', 'HSNA6S4')
    ),
    PersonName('Mr', 'Lewis', 'Clarke'),
    '02937293772',
    MobilePhonesArray(
        '09824273622'
    ),
    'MWKSA'
);

insert into PersonTable values (
    48,
    AddressArray(
        Address(4, 'Rose Street', 'Aberdeen', 'ENHS7S5')
    ),
    PersonName('Mrs', 'Margaret', 'Hunam'),
    '02837292723',
    MobilePhonesArray(
        '02937936283',
        '02991922182',
        '07346282218'
    ),
    'MSK95'
);

insert into PersonTable values(
    49,
    AddressArray(
        Address(4, 'Lawson Place', 'Dundee', 'HHG4A32')
    ),
    PersonName('Mstr', 'Jack', 'Holland'),
    '02937237632',
    MobilePhonesArray(
        '07978447522'
    ),
    '49G7H'
);

insert into PersonTable values (
    50,
    AddressArray(
        Address(2, 'Forebank Road', 'Dundee', 'ENBB7G7')
    ),
    PersonName('Mr', 'Scott', 'Brown'),
    '02938293738',
    MobilePhonesArray(
        '06928739283'
    ),
    'SJIS8'
);

insert into PersonTable values (
    51,
    AddressArray(
        Address(8, 'Lothian Road', 'Edinburgh', 'EH3BBG7')
    ),
    PersonName('Mr', 'Ryan', 'Goodman'),
    '08383727629',
    MobilePhonesArray(
        '06928739283',
        '07608343766'
    ),
    'LK1A8'
);

insert into PersonTable values (
    52,
    AddressArray(
        Address(4, 'Queen`s Lane South', 'Aberdeen', 'HBSGCJG')
    ),
    PersonName('Mrs', 'Pamela', 'Scott'),
    '08338346643',
    MobilePhonesArray(
        '08474638463'
    ),
    '973NJ'
);

insert into PersonTable values (
    53,
    AddressArray(
        Address(9, 'Forebank Road', 'Dundee', 'ENB99L7')
    ),
    PersonName('Mr', 'Ewan', 'Carlton'),
    '08384736643',
    MobilePhonesArray(
        '04474128463'
    ),
    'SNJ82'
);

insert into PersonTable values (
    54,
    AddressArray(
        Address(4, 'Rose Street', 'Aberdeen', 'ENHS7S5')
    ),
    PersonName('Miss', 'Ruth', 'Allen'),
    '07146438643',
    MobilePhonesArray(
        '08484757493'
    ),
    'Q64S1'
);

insert into PersonTable values (
    55,
    AddressArray(
        Address(2, 'West Port', 'Edinburgh', 'EHOP2HN')
    ),
    PersonName('Ms', 'Chelsea', 'Patterson'),
    '01735244643',
    MobilePhonesArray(
        '09476638463'
    ),
    'WIQC9'
);

insert into PersonTable values (
    56,
    AddressArray(
        Address(2, 'Brighton Place', 'Aberdeen', 'HE5508N')
    ),
    PersonName('Mstr', 'Libby', 'Sommers'),
    '08338374543',
    MobilePhonesArray(
        '08474736463'
    ),
    'KHNU6'
);

insert into PersonTable values (
    57,
    AddressArray(
        Address(7, 'Dunain Road', 'Inverness', 'AH8N64S')
    ),
    PersonName('Ms', 'Abby', 'Conner'),
    '08338399933',
    MobilePhonesArray(
        '08427254463'
    ),
    '93HB5'
);

insert into PersonTable values (
    58,
    AddressArray(
        Address(6, 'George Street', 'Edinburgh', 'EH32MFH')
    ),
    PersonName('Mrs', 'Elizabeth', 'Duffy'),
    '03957482947',
    MobilePhonesArray(
        '08474638463'
    ),
    'JWUSJ'
);

insert into PersonTable values (
    59,
    AddressArray(
        Address(4, 'West Port', 'Edinburgh', 'EH66SHN')
    ),
    PersonName('Mr', 'Alex', 'Jones'),
    '08338346643',
    MobilePhonesArray(
        '08474638463'
    ),
    'NSJN0'
);

insert into PersonTable values (
    60,
    AddressArray(
        Address(3, 'Brighton Place', 'Aberdeen', 'HE5508N')
    ),
    PersonName('Mstr', 'Leanne', 'Livingstone'),
    '08338374543',
    MobilePhonesArray(
        '08474638463'
    ),
    'CSJ97'
);





/* employee table - Mstrs are 3, 9, 26, 37, 49, 56, 60 (so far) so don't use these as employees */
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
    (select ref(emp) from EmployeeTable emp where emp.empID=2),
    'accountant',
    3000,
    (select ref(br) from BranchTable br where br.bID=1),
    '23-AUG-06'
);

insert into EmployeeTable values(
    4,
    (select ref(pers) from PersonTable pers where pers.persID=4),
    (select ref(emp) from EmployeeTable emp where emp.empID=2),
    'cashier',
    3000,
    (select ref(br) from BranchTable br where br.bID=1),
    '4-NOV-15'
);

insert into EmployeeTable values(
    5,
    (select ref(pers) from PersonTable pers where pers.persID=5),
    NULL,
    'manager',
    10000,
    (select ref(br) from BranchTable br where br.bID=2),
    '14-JUN-14'
);

insert into EmployeeTable values(
    6,
    (select ref(pers) from PersonTable pers where pers.persID=6),
    (select ref(emp) from EmployeeTable emp where emp.empID=5),
    'cashier',
    3000,
    (select ref(br) from BranchTable br where br.bID=2),
    '10-DEC-14'
);

insert into EmployeeTable values(
    7,
    (select ref(pers) from PersonTable pers where pers.persID=7),
    (select ref(emp) from EmployeeTable emp where emp.empID=5),
    'accountant',
    10000,
    (select ref(br) from BranchTable br where br.bID=2),
    '12-MAY-07'
);

insert into EmployeeTable values(
    8,
    (select ref(pers) from PersonTable pers where pers.persID=8),
    NULL,
    'head',
    12000,
    (select ref(br) from BranchTable br where br.bID=3),
    '18-MAY-09'
);

insert into EmployeeTable values(
    9,
    (select ref(pers) from PersonTable pers where pers.persID=10),
    (select ref(emp) from EmployeeTable emp where emp.empID=8),
    'cashier',
    2700,
    (select ref(br) from BranchTable br where br.bID=3),
    '5-JAN-16'
);

insert into EmployeeTable values(
    10,
    (select ref(pers) from PersonTable pers where pers.persID=11),
    (select ref(emp) from EmployeeTable emp where emp.empID=8),
    'cashier',
    2700,
    (select ref(br) from BranchTable br where br.bID=3),
    '8-OCT-15'
);

insert into EmployeeTable values(
    11,
    (select ref(pers) from PersonTable pers where pers.persID=12),
    NULL,
    'team leader',
    10000,
    (select ref(br) from BranchTable br where br.bID=4),
    '29-JUN-10'
);

insert into EmployeeTable values(
    12,
    (select ref(pers) from PersonTable pers where pers.persID=13),
    (select ref(emp) from EmployeeTable emp where emp.empID=11),
    'cashier',
    3000,
    (select ref(br) from BranchTable br where br.bID=4),
    '7-DEC-10'
);

insert into EmployeeTable values(
    13,
    (select ref(pers) from PersonTable pers where pers.persID=14),
    (select ref(emp) from EmployeeTable emp where emp.empID=11),
    'cashier',
    3000,
    (select ref(br) from BranchTable br where br.bID=4),
    '18-JUL-14'
);

insert into EmployeeTable values(
    14,
    (select ref(pers) from PersonTable pers where pers.persID=15),
    NULL,
    'manager',
    11000,
    (select ref(br) from BranchTable br where br.bID=5),
    '7-MAR-15'
);

insert into EmployeeTable values(
    15,
    (select ref(pers) from PersonTable pers where pers.persID=16),
    (select ref(emp) from EmployeeTable emp where emp.empID=14),
    'accountant',
    3000,
    (select ref(br) from BranchTable br where br.bID=5),
    '15-DEC-14'
);

insert into EmployeeTable values(
    16,
    (select ref(pers) from PersonTable pers where pers.persID=17),
    NULL,
    'head',
    12000,
    (select ref(br) from BranchTable br where br.bID=6),
    '19-SEP-00'
);

insert into EmployeeTable values(
    17,
    (select ref(pers) from PersonTable pers where pers.persID=18),
    (select ref(emp) from EmployeeTable emp where emp.empID=16),
    'manager',
    8500,
    (select ref(br) from BranchTable br where br.bID=6),
    '3-OCT-07'
);

insert into EmployeeTable values(
    18,
    (select ref(pers) from PersonTable pers where pers.persID=19),
    (select ref(emp) from EmployeeTable emp where emp.empID=17),
    'cashier',
    2700,
    (select ref(br) from BranchTable br where br.bID=6),
    '25-FEB-11'
);

insert into EmployeeTable values(
    19,
    (select ref(pers) from PersonTable pers where pers.persID=20),
    NULL,
    'head',
    12000,
    (select ref(br) from BranchTable br where br.bID=7),
    '17-FEB-09'
);

insert into EmployeeTable values(
    20,
    (select ref(pers) from PersonTable pers where pers.persID=22),
    (select ref(emp) from EmployeeTable emp where emp.empID=19),
    'cashier',
    2700,
    (select ref(br) from BranchTable br where br.bID=7),
    '20-JUN-13'
);

insert into EmployeeTable values(
    21,
    (select ref(pers) from PersonTable pers where pers.persID=23),
    NULL,
    'head',
    11000,
    (select ref(br) from BranchTable br where br.bID=8),
    '1-MAR-02'
);

insert into EmployeeTable values(
    22,
    (select ref(pers) from PersonTable pers where pers.persID=24),
    (select ref(emp) from EmployeeTable emp where emp.empID=21),
    'accountant',
    4000,
    (select ref(br) from BranchTable br where br.bID=8),
    '30-OCT-09'
);

insert into EmployeeTable values(
    23,
    (select ref(pers) from PersonTable pers where pers.persID=25),
    (select ref(emp) from EmployeeTable emp where emp.empID=21),
    'accountant',
    4000,
    (select ref(br) from BranchTable br where br.bID=8),
    '3-OCT-07'
);

insert into EmployeeTable values(
    24,
    (select ref(pers) from PersonTable pers where pers.persID=26),
    NULL,
    'team leader',
    10000,
    (select ref(br) from BranchTable br where br.bID=9),
    '20-OCT-10'
);

insert into EmployeeTable values(
    25,
    (select ref(pers) from PersonTable pers where pers.persID=27),
    (select ref(emp) from EmployeeTable emp where emp.empID=24),
    'accountant',
    3500,
    (select ref(br) from BranchTable br where br.bID=9),
    '16-FEB-13'
);

insert into EmployeeTable values(
    26,
    (select ref(pers) from PersonTable pers where pers.persID=28),
    (select ref(emp) from EmployeeTable emp where emp.empID=24),
    'cashier',
    3500,
    (select ref(br) from BranchTable br where br.bID=9),
    '20-JUN-13'
);

insert into EmployeeTable values(
    27,
    (select ref(pers) from PersonTable pers where pers.persID=29),
    NULL,
    'head',
    12000,
    (select ref(br) from BranchTable br where br.bID=10),
    '19-JUL-14'
);

insert into EmployeeTable values(
    28,
    (select ref(pers) from PersonTable pers where pers.persID=30),
    (select ref(emp) from EmployeeTable emp where emp.empID=27),
    'accountant',
    12000,
    (select ref(br) from BranchTable br where br.bID=10),
    '12-JUN-15'
);

insert into EmployeeTable values(
    29,
    (select ref(pers) from PersonTable pers where pers.persID=31),
    NULL,
    'head',
    12000,
    (select ref(br) from BranchTable br where br.bID=11),
    '1-MAY-99'
);

insert into EmployeeTable values(
    30,
    (select ref(pers) from PersonTable pers where pers.persID=32),
    (select ref(emp) from EmployeeTable emp where emp.empID=29),
    'accountant',
    4000,
    (select ref(br) from BranchTable br where br.bID=11),
    '17-APR-02'
);

insert into EmployeeTable values(
    31,
    (select ref(pers) from PersonTable pers where pers.persID=33),
    (select ref(emp) from EmployeeTable emp where emp.empID=29),
    'cashier',
    3000,
    (select ref(br) from BranchTable br where br.bID=11),
    '4-NOV-15'
);

insert into EmployeeTable values(
    32,
    (select ref(pers) from PersonTable pers where pers.persID=34),
    NULL,
    'manager',
    10000,
    (select ref(br) from BranchTable br where br.bID=12),
    '14-JUN-14'
);

insert into EmployeeTable values(
    33,
    (select ref(pers) from PersonTable pers where pers.persID=35),
    (select ref(emp) from EmployeeTable emp where emp.empID=32),
    'cashier',
    3000,
    (select ref(br) from BranchTable br where br.bID=12),
    '10-DEC-14'
);

insert into EmployeeTable values(
    34,
    (select ref(pers) from PersonTable pers where pers.persID=36),
    NULL,
    'manager',
    10000,
    (select ref(br) from BranchTable br where br.bID=13),
    '12-MAY-07'
);

insert into EmployeeTable values(
    35,
    (select ref(pers) from PersonTable pers where pers.persID=60),
    (select ref(emp) from EmployeeTable emp where emp.empID=34),
    'cashier',
    2700,
    (select ref(br) from BranchTable br where br.bID=13),
    '5-JAN-16'
);

insert into EmployeeTable values(
    36,
    (select ref(pers) from PersonTable pers where pers.persID=38),
    NULL,
    'manager',
    11500,
    (select ref(br) from BranchTable br where br.bID=14),
    '8-OCT-15'
);

insert into EmployeeTable values(
    37,
    (select ref(pers) from PersonTable pers where pers.persID=39),
    (select ref(emp) from EmployeeTable emp where emp.empID=36),
    'accountant',
    35000,
    (select ref(br) from BranchTable br where br.bID=14),
    '29-JUN-10'
);

insert into EmployeeTable values(
    38,
    (select ref(pers) from PersonTable pers where pers.persID=40),
    NULL,
    'head',
    12000,
    (select ref(br) from BranchTable br where br.bID=15),
    '7-DEC-10'
);

insert into EmployeeTable values(
    39,
    (select ref(pers) from PersonTable pers where pers.persID=41),
    (select ref(emp) from EmployeeTable emp where emp.empID=38),
    'cashier',
    3800,
    (select ref(br) from BranchTable br where br.bID=15),
    '18-JUL-14'
);

insert into EmployeeTable values(
    40,
    (select ref(pers) from PersonTable pers where pers.persID=42),
    NULL,
    'manager',
    11000,
    (select ref(br) from BranchTable br where br.bID=16),
    '7-MAR-15'
);

insert into EmployeeTable values(
    41,
    (select ref(pers) from PersonTable pers where pers.persID=43),
    (select ref(emp) from EmployeeTable emp where emp.empID=40),
    'accountant',
    3000,
    (select ref(br) from BranchTable br where br.bID=16),
    '15-DEC-14'
);

insert into EmployeeTable values(
    42,
    (select ref(pers) from PersonTable pers where pers.persID=44),
    NULL,
    'head',
    12000,
    (select ref(br) from BranchTable br where br.bID=17),
    '19-SEP-00'
);

insert into EmployeeTable values(
    43,
    (select ref(pers) from PersonTable pers where pers.persID=45),
    (select ref(emp) from EmployeeTable emp where emp.empID=42),
    'accountant',
    4100,
    (select ref(br) from BranchTable br where br.bID=17),
    '3-OCT-07'
);

insert into EmployeeTable values(
    44,
    (select ref(pers) from PersonTable pers where pers.persID=46),
    NULL,
    'team leader',
    10100,
    (select ref(br) from BranchTable br where br.bID=18),
    '25-FEB-11'
);

insert into EmployeeTable values(
    45,
    (select ref(pers) from PersonTable pers where pers.persID=48),
    (select ref(emp) from EmployeeTable emp where emp.empID=44),
    'accountant',
    2700,
    (select ref(br) from BranchTable br where br.bID=18),
    '17-FEB-09'
);

insert into EmployeeTable values(
    46,
    (select ref(pers) from PersonTable pers where pers.persID=49),
    NULL,
    'team leader',
    11200,
    (select ref(br) from BranchTable br where br.bID=19),
    '20-JUN-13'
);

insert into EmployeeTable values(
    47,
    (select ref(pers) from PersonTable pers where pers.persID=50),
    (select ref(emp) from EmployeeTable emp where emp.empID=46),
    'cashier',
    3100,
    (select ref(br) from BranchTable br where br.bID=19),
    '1-MAR-02'
);

insert into EmployeeTable values(
    48,
    (select ref(pers) from PersonTable pers where pers.persID=51),
    NULL,
    'manager',
    11400,
    (select ref(br) from BranchTable br where br.bID=20),
    '30-OCT-09'
);

insert into EmployeeTable values(
    49,
    (select ref(pers) from PersonTable pers where pers.persID=52),
    (select ref(emp) from EmployeeTable emp where emp.empID=48),
    'accountant',
    4000,
    (select ref(br) from BranchTable br where br.bID=20),
    '3-OCT-07'
);

insert into EmployeeTable values(
    50,
    (select ref(pers) from PersonTable pers where pers.persID=53),
    (select ref(emp) from EmployeeTable emp where emp.empID=46),
    'cashier',
    3100,
    (select ref(br) from BranchTable br where br.bID=19),
    '20-OCT-10'
);

insert into EmployeeTable values(
    51,
    (select ref(pers) from PersonTable pers where pers.persID=54),
    (select ref(emp) from EmployeeTable emp where emp.empID=44),
    'accountant',
    3500,
    (select ref(br) from BranchTable br where br.bID=18),
    '16-FEB-13'
);

insert into EmployeeTable values(
    52,
    (select ref(pers) from PersonTable pers where pers.persID=55),
    (select ref(emp) from EmployeeTable emp where emp.empID=42),
    'cashier',
    3500,
    (select ref(br) from BranchTable br where br.bID=17),
    '20-JUN-13'
);

insert into EmployeeTable values(
    53,
    (select ref(pers) from PersonTable pers where pers.persID=57),
    (select ref(emp) from EmployeeTable emp where emp.empID=40),
    'accountant',
    2800,
    (select ref(br) from BranchTable br where br.bID=16),
    '19-JUL-14'
);

insert into EmployeeTable values(
    54,
    (select ref(pers) from PersonTable pers where pers.persID=58),
    (select ref(emp) from EmployeeTable emp where emp.empID=38),
    'accountant',
    3000,
    (select ref(br) from BranchTable br where br.bID=15),
    '12-JUN-15'
);

insert into EmployeeTable values(
    55,
    (select ref(pers) from PersonTable pers where pers.persID=59),
    (select ref(emp) from EmployeeTable emp where emp.empID=36),
    'cashier',
    3200,
    (select ref(br) from BranchTable br where br.bID=14),
    '18-MAY-09'
);





/* account table */
insert into AccountTable values(
    1,
    'savings',
    4000,
    (select ref(br) from BranchTable br where br.bID=1),
    NULL,
    NULL,
    '12-MAY-09',
    NULL
);

insert into AccountTable values(
    2,
    'savings',
    3500,
    (select ref(br) from BranchTable br where br.bID=2),
    NULL,
    NULL,
    '8-APR-13',
    NULL
);

insert into AccountTable values(
    3,
    'current',
    2200,
    (select ref(br) from BranchTable br where br.bID=3),
    NULL,
    NULL,
    '26-FEB-16',
    NULL
);

insert into AccountTable values(
    4,
    'savings',
    3100,
    (select ref(br) from BranchTable br where br.bID=4),
    NULL,
    NULL,
    '3-JAN-10',
    NULL
);

insert into AccountTable values(
    5,
    'current',
    1700,
    (select ref(br) from BranchTable br where br.bID=5),
    NULL,
    NULL,
    '21-JUL-12',
    NULL
);

insert into AccountTable values(
    6,
    'current',
    900,
    (select ref(br) from BranchTable br where br.bID=6),
    NULL,
    NULL,
    '9-MAR-10',
    NULL
);

insert into AccountTable values(
    7,
    'current',
    700,
    (select ref(br) from BranchTable br where br.bID=7),
    NULL,
    NULL,
    '8-JUL-07',
    NULL
);

insert into AccountTable values(
    8,
    'savings',
    3800,
    (select ref(br) from BranchTable br where br.bID=8),
    NULL,
    NULL,
    '16-AUG-10',
    NULL
);

insert into AccountTable values(
    9,
    'current',
    1200,
    (select ref(br) from BranchTable br where br.bID=9),
    NULL,
    NULL,
    '10-SEP-14',
    NULL
);

insert into AccountTable values(
    10,
    'savings',
    7000,
    (select ref(br) from BranchTable br where br.bID=10),
    NULL,
    NULL,
    '1-OCT-13',
    NULL
);

insert into AccountTable values(
    11,
    'savings',
    8100,
    (select ref(br) from BranchTable br where br.bID=11),
    NULL,
    NULL,
    '19-DEC-06',
    NULL
);

insert into AccountTable values(
    12,
    'current',
    2900,
    (select ref(br) from BranchTable br where br.bID=12),
    NULL,
    NULL,
    '2-OCT-07',
    NULL
);

insert into AccountTable values(
    13,
    'savings',
    5600,
    (select ref(br) from BranchTable br where br.bID=13),
    NULL,
    NULL,
    '14-AUG-09',
    NULL
);

insert into AccountTable values(
    14,
    'current',
    1300,
    (select ref(br) from BranchTable br where br.bID=14),
    NULL,
    NULL,
    '7-MAR-10',
    NULL
);

insert into AccountTable values(
    15,
    'current',
    1600,
    (select ref(br) from BranchTable br where br.bID=15),
    NULL,
    NULL,
    '27-NOV-08',
    NULL
);

insert into AccountTable values(
    16,
    'savings',
    6800,
    (select ref(br) from BranchTable br where br.bID=16),
    NULL,
    NULL,
    '25-NOV-13',
    NULL
);

insert into AccountTable values(
    17,
    'savings',
    5000,
    (select ref(br) from BranchTable br where br.bID=17),
    NULL,
    NULL,
    '8-JUL-14',
    NULL
);

insert into AccountTable values(
    18,
    'savings',
    5700,
    (select ref(br) from BranchTable br where br.bID=18),
    NULL,
    NULL,
    '9-JAN-07',
    NULL
);

insert into AccountTable values(
    19,
    'savings',
    6400,
    (select ref(br) from BranchTable br where br.bID=19),
    NULL,
    NULL,
    '22-MAY-12',
    NULL
);

insert into AccountTable values(
    20,
    'current',
    3200,
    (select ref(br) from BranchTable br where br.bID=20),
    NULL,
    NULL,
    '13-JUN-12',
    NULL
);





/* customer table - also add customers to their respective accounts' customer list */
insert into CustomerTable values(
    1,
    (select ref(pers) from PersonTable pers where pers.persID=3),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=6)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=1)
) where acnt.accNum=6;



insert into CustomerTable values(
    2,
    (select ref(pers) from PersonTable pers where pers.persID=9),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=7)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=2)
) where acnt.accNum=7;



insert into CustomerTable values(
    6,
    (select ref(pers) from PersonTable pers where pers.persID=26),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=5)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=6)
) where acnt.accNum=5;



insert into CustomerTable values(
    7,
    (select ref(pers) from PersonTable pers where pers.persID=37),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=6)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=7)
) where acnt.accNum=6;



insert into CustomerTable values(
    8,
    (select ref(pers) from PersonTable pers where pers.persID=49),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=8)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=8)
) where acnt.accNum=8;



insert into CustomerTable values(
    9,
    (select ref(pers) from PersonTable pers where pers.persID=56),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=9)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=9)
) where acnt.accNum=9;



insert into CustomerTable values(
    3,
    (select ref(pers) from PersonTable pers where pers.persID=1),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=2)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=3)
) where acnt.accNum=2;



insert into CustomerTable values(
    4,
    (select ref(pers) from PersonTable pers where pers.persID=2),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=3),
        (select ref(acnt) from AccountTable acnt where acnt.accNum=6)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=4)
) where acnt.accNum=3;
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=4)
) where acnt.accNum=6;



insert into CustomerTable values(
    5,
    (select ref(pers) from PersonTable pers where pers.persID=4),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=4),
        (select ref(acnt) from AccountTable acnt where acnt.accNum=7)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=5)
) where acnt.accNum=4;
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=5)
) where acnt.accNum=7;



insert into CustomerTable values(
    10,
    (select ref(pers) from PersonTable pers where pers.persID=5),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=10)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=10)
) where acnt.accNum=10;



insert into CustomerTable values(
    11,
    (select ref(pers) from PersonTable pers where pers.persID=6),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=11)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=11)
) where acnt.accNum=11;



insert into CustomerTable values(
    12,
    (select ref(pers) from PersonTable pers where pers.persID=7),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=12)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=12)
) where acnt.accNum=12;



insert into CustomerTable values(
    13,
    (select ref(pers) from PersonTable pers where pers.persID=8),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=13)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=13)
) where acnt.accNum=13;



insert into CustomerTable values(
    14,
    (select ref(pers) from PersonTable pers where pers.persID=10),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=14)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=14)
) where acnt.accNum=14;



insert into CustomerTable values(
    15,
    (select ref(pers) from PersonTable pers where pers.persID=11),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=15)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=15)
) where acnt.accNum=15;



insert into CustomerTable values(
    16,
    (select ref(pers) from PersonTable pers where pers.persID=12),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=16)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=16)
) where acnt.accNum=16;



insert into CustomerTable values(
    17,
    (select ref(pers) from PersonTable pers where pers.persID=13),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=17)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=17)
) where acnt.accNum=17;



insert into CustomerTable values(
    18,
    (select ref(pers) from PersonTable pers where pers.persID=14),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=18)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=18)
) where acnt.accNum=18;



insert into CustomerTable values(
    19,
    (select ref(pers) from PersonTable pers where pers.persID=15),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=19)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=19)
) where acnt.accNum=19;



insert into CustomerTable values(
    20,
    (select ref(pers) from PersonTable pers where pers.persID=16),
    AccountsArray(
        (select ref(acnt) from AccountTable acnt where acnt.accNum=20)
    )
);
update AccountTable acnt set customers=CustomersArray(
    (select ref(cust) from CustomerTable cust where cust.custID=20)
) where acnt.accNum=20;

/* select deref(emp.supervisorID) from EmployeeTable emp where emp.supervisorID is not NULL; */
/* select * from AccountTable; */