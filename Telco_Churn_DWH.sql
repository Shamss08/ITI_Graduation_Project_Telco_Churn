
--CREATE DATABASE TelecomCustomerChurnDWH

USE TelecomCustomerChurnDWH

CREATE TABLE Dim_Status(
Status_PK_SK INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Status_ID_BK INT  NOT NULL, 
status VARCHAR(50) CHECK(status IN('Stayed','Churned','Joined')),
StartDate datetime,
EndDate datetime,
SourceSystemCode tinyint,
isCurrent bit
)

CREATE TABLE Dim_Churn_Category(
ChurnCategory_PK_SK int primary key identity(1,1),
ChurnCategory_ID_BK int,
ChurnCategory VARCHAR(50) CHECK (churnCategory IN ('Competitor','Dissatisfaction','Price', 'Attitude', 'Other')),
StartDate datetime,
EndDate datetime,
SourceSystemCode tinyint,
isCurrent bit
);

CREATE TABLE Dim_Churn_Reason(
ChurnReason_PK_SK int primary key identity(1,1),
ChurnReason_ID_BK int,
ChurnReason varchar(200),
ChurnCategory_id int foreign key references  Dim_Churn_Category(churnCategory_PK_SK),
StartDate datetime,
EndDate datetime,
SourceSystemCode tinyint,
isCurrent bit
);


CREATE TABLE Dim_Location(
Location_PK_SK INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Location_ID_BK INT,
Country VARCHAR(50),
City VARCHAR(50),
State VARCHAR(50),
Longitude varchar(10),
Latitude varchar(10),
Zipcode INT, 
Population int,
StartDate datetime,
EndDate datetime,
SourceSystemCode tinyint,
isCurrent bit
)

CREATE TABLE Dim_Internet_Service(
INTERNET_SERVICE_PK_SK int primary key identity(1,1),
Customer_internet_ID_BK int,
internet_service_ID_BK int,
customer_ID_BK varchar(50),
internet_service_type VARCHAR(50),
online_backup varchar(10) Default 'No' CHECK(online_backup in ('Yes','No'))  ,
Device_protection_plane varchar(10) Default 'No' CHECK(Device_protection_plane in ('Yes','No')) ,
premium_tech_support varchar(10) Default 'No' CHECK(premium_tech_support in ('Yes','No'))  ,
online_security varchar(10) Default 'No' CHECK(online_security in ('Yes','No'))  ,
StreamingTV varchar(10) Default 'No' CHECK(StreamingTV in ('Yes','No'))  ,
Streaming_movies varchar(10) Default 'No' CHECK(Streaming_movies in ('Yes','No'))  ,
Streaming_Music varchar(10) Default 'No' CHECK(Streaming_Music in ('Yes','No'))  ,
unlimited_data varchar(10) Default 'No' CHECK(unlimited_data in ('Yes','No'))  ,
StartDate datetime,
EndDate datetime,
SourceSystemCode tinyint,
isCurrent bit

)

CREATE TABLE Dim_Contract(
Contract_PK_SK int primary key identity(1,1),
Contract_ID_BK int,
contract_type varchar(50) CHECK (contract_type IN ('Month-to-Month', 'One Year', 'Two Year')),
StartDate datetime,
EndDate datetime,
SourceSystemCode tinyint,
isCurrent bit );


CREATE TABLE Dim_Phone_Service(
PhoneService_PK_SK INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
PhoneService_ID_BK INT,
PhoneService VARCHAR(10) DEFAULT 'NO' CHECK(PhoneService in('Yes','No')),
Multipule_Lines varchar(10) Default 'No' CHECK(Multipule_Lines in ('Yes','No')),
StartDate datetime,
EndDate datetime,
SourceSystemCode tinyint,
isCurrent bit
)

CREATE TABLE Dim_Customers(
Customer_PK_SK INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Customer_ID_BK varchar(50),
Gender varchar(10), 
Age int CHECK(Age between 18 and 120),
Senior_citezen varchar(10) Default 'No' CHECK(Senior_citezen in ('Yes','No')) ,
Under_30 varchar(10) Default 'No' CHECK(Under_30 in ('Yes','No')),
Referd_a_Friend varchar(10) Default 'No' CHECK(Referd_a_Friend in ('Yes','No')),
Number_of_Referrals int Default 0,
CLTV float,  
paperless_billing  varchar(10) ,
offer varchar(100)  ,
Payment_Method varchar(50) CHECK(Payment_Method in ('Bank Withdrawal', 'Credit Card', 'Mailed Check')),
Dependents varchar(10) Default 'No' CHECK(Dependents in ('Yes','No')),
Number_of_Dependents int Default 0,
satisfaction_score int CHECK(satisfaction_score between 1 and 5),
married varchar(10) Default 'No' CHECK(married in ('Yes','No')),
churnLabel varchar(10)  ,
churnValue tinyint ,
churnScore int CHECK(churnScore between 0 and 100)  ,
StartDate datetime,
EndDate datetime,
SourceSystemCode tinyint,
isCurrent bit
)


CREATE TABLE Fact_Charges(
Customer_ID_FK INT foreign Key references Dim_Customers(Customer_PK_SK),
JoinDate_ID_FK int foreign Key references DimDate(DateSK),
Location_ID_FK int foreign Key references Dim_Location(Location_PK_SK),
contract_ID_FK int foreign key references Dim_Contract(Contract_PK_SK),
Status_ID_FK int  foreign key references Dim_Status(Status_PK_SK),
ChurnReason_ID_FK int  foreign key references Dim_Churn_Reason(ChurnReason_PK_SK),
INTERNET_SERVICE_ID_FK int foreign key references Dim_Internet_Service(INTERNET_SERVICE_PK_SK),
PhoneService_ID_FK int foreign key references Dim_Phone_Service(PhoneService_PK_SK),
monthlyCharge float  ,
tenureInMonth float ,
TotalCharges float ,
TotalRefunds float ,
Total_revenue float  ,
Avg_MonthlyLong_DistanceCharges DECIMAL(10,3),
Total_LongDistance_Charges DECIMAL(10,3),
AVG_monthly_GB_Download int Default 0,
TotalExtraDataCharge int Default 0,
SourceSystemCode tinyint
);