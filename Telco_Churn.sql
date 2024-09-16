USE Master
go

-- drop database if exists
BEGIN TRY
	DROP Database TelecomCustomerChurnDB
END TRY

BEGIN CATCH
	-- database can't exist
END CATCH

-- create new database
CREATE DATABASE TelecomCustomerChurnDB
go

USE TelecomCustomerChurnDB
GO


create table churn_category(
churnCategory_id int primary key identity(1,1),
churnCategory VARCHAR(50) CHECK (churnCategory IN ('Competitor','Dissatisfaction','Price', 'Attitude', 'Other')));

create table churn_reason(
churnReason_id int primary key identity(1,1),
churnReason varchar(200) ,
churnCategory_id int foreign key references  churn_category(churnCategory_id)
);

create table Status(
Status_id int primary key identity(1,1),
CustomerStatus VARCHAR(50) CHECK(CustomerStatus IN ('Churned', 'Stayed', 'Joined')) );

create table Contract(
Contract_id int primary key identity(1,1),
contract_type varchar(50) CHECK (contract_type IN ('Month-to-Month', 'One Year', 'Two Year')) );

create table Population(
ZipCode int primary key,
population int );

create table location(
Location_id int primary key identity(1,1),
country varchar(50),
city varchar(50),
State varchar(50),
Longitude varchar(10)  ,
Latitude varchar(10)  ,
ZipCode int foreign key references Population(ZipCode)
);


create table Customer(
CustomerID varchar(50) primary key  Not null ,
Gender varchar(10) , 
Age int CHECK(Age between 18 and 120),
Senior_citezen varchar(10) Default 'No' CHECK(Senior_citezen in ('Yes','No')) ,
Under_30 varchar(10) Default 'No' CHECK(Under_30 in ('Yes','No')),
Referd_a_Friend varchar(10) Default 'No' CHECK(Referd_a_Friend in ('Yes','No')),
Number_of_Referrals int Default 0,
Dependents varchar(10) Default 'No' CHECK(Dependents in ('Yes','No')),
Number_of_Dependents int Default 0,
married varchar(10) Default 'No' CHECK(married in ('Yes','No')),
Location_id int foreign Key references Location(Location_id),
contract_id int foreign key references Contract(Contract_id),
Status_id int  foreign key references Status(Status_id),
churnReason_id int foreign key references churn_reason(churnReason_id),
monthlyCharge float  ,
Payment_Method varchar(50) CHECK(Payment_Method in ('Bank Withdrawal', 'Credit Card', 'Mailed Check')),
paperless_billing  varchar(10) ,
tenureInMonth float ,
TotalCharges float ,
TotalRefunds float ,
offer varchar(100)  ,
JoinDate datetime,
Quarter varchar(10) ,
Total_revenue float  ,
satisfaction_score int CHECK(satisfaction_score between 1 and 5),
churnLabel varchar(10)  ,
churnValue tinyint ,
churnScore int CHECK(churnScore between 0 and 100)  ,
CLTV float  
);


create table Phone_Service (
phoneService_id int primary key identity(1,1),
phoneService varchar(10) Default 'No' CHECK(phoneService in ('Yes','No'))  ,
AVG_monthlyLong_distanceCharges decimal(10,3) ,
Total_LongDistance_charges decimal(10,3) ,
Multipule_Lines varchar(10) Default 'No' CHECK(Multipule_Lines in ('Yes','No')),
Customer_id varchar(50) foreign key references Customer(CustomerID));


create table Internet_service(
internet_serviceId int primary key identity(1,1),
internet_service_type VARCHAR(50) 
);


create table Customer_internet_service(
Customer_internet_id int primary key identity(1,1),
internet_service_id int foreign key references Internet_service(internet_serviceid),
customer_id varchar(50) foreign key references Customer(CustomerID),
AVG_monthly_GB_Download int Default 0,
online_backup varchar(10) Default 'No' CHECK(online_backup in ('Yes','No'))  ,
Device_protection_plane varchar(10) Default 'No' CHECK(Device_protection_plane in ('Yes','No')) ,
premium_tech_support varchar(10) Default 'No' CHECK(premium_tech_support in ('Yes','No'))  ,
online_security varchar(10) Default 'No' CHECK(online_security in ('Yes','No'))  ,
StreamingTV varchar(10) Default 'No' CHECK(StreamingTV in ('Yes','No'))  ,
Streaming_movies varchar(10) Default 'No' CHECK(Streaming_movies in ('Yes','No'))  ,
Streaming_Music varchar(10) Default 'No' CHECK(Streaming_Music in ('Yes','No'))  ,
unlimited_data varchar(10) Default 'No' CHECK(unlimited_data in ('Yes','No'))  ,
TotalExtraDataCharge int Default 0);
