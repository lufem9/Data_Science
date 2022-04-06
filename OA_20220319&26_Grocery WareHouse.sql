--19th of March 2022 Class
ALTER AUTHORIZATION ON DATABASE:: [Grocery_WareHouse] TO [SA]

Create DATABASE Grocery_WareHouse

Use Grocery_WareHouse
GO
--CREATE SCHEMA EDW
--CREATE SCHEMA Staging

Use [Grocery_WareHouse]
Create Table Staging.Product
(
	productID int, 
	ProductNumber nvarchar(50),
	Product nvarchar(50), 
	UnitPrice float,
	Department nvarchar(50),
	LoadDate datetime default getdate(),
	CONSTRAINT grocery_product_pk primary key (productID)
)

Use [Grocery_WareHouse]
Create Table EDW.dimProduct
(
	Product_sk int identity(1,1),
	productID int, 
	ProductNumber nvarchar(50),
	Product nvarchar(50), 
	UnitPrice float,
	Department nvarchar(50),
	StartDate date,
	EndDatae date,
	LoadDate datetime default getdate(),
	CONSTRAINT EDM_dimproduct_Sk primary key (product_Sk)
)

Create table Staging.[Location]
(
	Storeid int,
	StoreName nvarchar(50),
	StreetAddress nvarchar(50),
	cityName nvarchar(50),
	State nvarchar(50),
	loadDate date default getdate(),
	CONSTRAINT grocery_location_pk primary key (Storeid)
)


Create table EDW.dimLocation
(
	Location_Sk int identity(1,1),
	StoreID int,
	StoreName nvarchar(50),
	StreetAddress nvarchar(50),
	cityName nvarchar(50),
	State nvarchar(50),
	StartDate date,
	EndDatae date,
	loadDate date default getdate(),
	CONSTRAINT EDW_dimlocation_Sk primary key (Location_Sk)
)

create table Staging.Vendor
(
	VendorID int,
	VendorNo nvarchar(50),
	Vendor nvarchar(255),
	RegistrationNo nvarchar(50),
	VendorAddress nvarchar(80),
	CityName nvarchar(50),
	State nvarchar(50),
	LoadDate date,
	constraint  grocery_Vendor_pk primary key (VendorID)	
)

create table EDW.dimVendor
(
	Vendor_sk int identity(1,1),
	VendorID int,
	VendorNo nvarchar(50),
	Vendor nvarchar(255),
	RegistrationNo nvarchar(50),
	VendorAddress nvarchar(80),
	CityName nvarchar(50),
	State nvarchar(50),
	StartDate date,
	EndDatae date,
	loadDate date default getdate(),
	constraint  EDW_dimVendor_Sk primary key (Vendor_Sk)
)

Create table Staging.Employee
 (
   EmployeeID int,
   EmployeeNo nvarchar(50),
   Employee nvarchar(255),
   MaritalStatus nvarchar(50),
   DateofBirth date,
   Loaddate datetime default getdate(),
   constraint Grocery_employee_pk primary key (EmployeeID)
 )


 Create table EDW.dimEmployee
 ( 
   Employee_SK int identity(1,1),
   EmployeeID int,
   EmployeeNo nvarchar(50),
   Employee nvarchar(255),
   MaritalStatus nvarchar(50),  
   DateofBirth Date,
   StartDate datetime,
   EndDate  datetime,
   constraint EDW_dimEmployee_Sk  primary key(Employee_SK) 
 )

Create Table  Staging.Promotion
 (
   PromotionID int,
   PromotionStartDate date,
   promotionEnddate date,
   DiscountPercent float,
   Promotion nvarchar(50),
   LoadDate datetime default getdate(),
   constraint Grocery_Promotion_pk primary key(PromotionID)
 )

 Create Table  EDW.dimPromotion
 (
   Promotion_SK int identity(1,1),
   PromotionID int,
   PromotionStartDate date,
   promotionEnddate date,
   DiscountPercent float,
   Promotion nvarchar(50),
   StartDate datetime, 
   constraint EDW_Promotion_sk primary key(Promotion_Sk)
 )

 create Table Staging.Customer
 (
 CustomerID int,
 Customer nvarchar(255),
 CustomerAddress nvarchar(255),
 CityName nvarchar(255),
 State nvarchar(255),
 LoadDate datetime default Getdate(),
 constraint Grocery_Customer_pk primary key(CustomerID)
 )


 Create table EDW.dimCustomer 
 (
   Customer_sk int identity(1,1),
  CustomerID int,
  Customer nvarchar(255),
  CustomerAddress nvarchar(255),
  CityName nvarchar(255),
  State nvarchar(255),  
  StartDate Datetime,
  Constraint EdW_dimCustomer_Sk primary key(Customer_Sk)
 )


 create table Staging.POSChannel
 (
  ChannelID int,
  ChannelNo nvarchar(50),
  DeviceModel nvarchar(50),
  SerialNo nvarchar(50),
  InstallationDate date,
  LoadDate datetime default Getdate(),
 Constraint Grocery_PosChannel_pk  primary key (ChannelID)
)

create table EDW.dimPOSChannel
 (
  Channel_SK int identity(1,1),
  ChannelID int,
  ChannelNo nvarchar(50),
  DeviceModel nvarchar(50),
  SerialNo nvarchar(50),
  InstallationDate date,
  StartDate datetime ,
  EndDate datetime ,
  Constraint EDW_PosChannel_Sk  primary key (Channel_SK)
)

CREATE TABLE EDW.DimTime
(
    Time_Sk int identity(1,1),
    HourID int, ----- 0hr - 23hr
    PeriodofDay nvarchar(25),
    Businesshour nvarchar(25),  -- (0-7)---early, (8-17) ---- open, (18-23)----late
    StartDate Datetime,
    constraint EDW_dimTime_SK primary key (Time_Sk)
)

select * from [EDW].[DimTime]

Drop Table EDW.dimDate
Create Table EDW.dimDate
(
	Date_Sk int,   ----20220305
	CDate Date,		-----2022-03-05
	CYear int,		-----2022
	cQuartar nvarchar(2),		----Q1
	CMonth int,		-------03
	CEngMonthName Nvarchar(20),		--------Mar
	CFrenchMonthName nvarchar(20),	-------Mar
	Cday int,		--------05
	CDayofWeek int,		-----7
	CDayNameofweek nvarchar(20), ------Saturday
	constraint EDW_dimDate_sk primary key(Date_sk)
)

use [Grocery_WareHouse]
select * from EDW.dimDate where CYear = 2022 and CMonth=05


use [Grocery]
select * from employee
select * from MaritalStatus


select * from employee
select * from [Staging].[Product]


---Importing the overtime data
/*USE [Grocery_WareHouse]
Drop Table dbo.OvertimeData
Select * from dbo.OvertimeData*/


----- load data from Staging employee to EDW employee
USE [Grocery_WareHouse]
select 
	e.EmployeeID,e.EmployeeNo, e.Employee, e.MaritalStatus,e.DateofBirth, O.StartOvertime, O.EndOvertime,
	getdate() as loaddate from Staging.Employee e 
inner join dbo.OvertimeData O on e.EmployeeNo = O.EmployeeNo

Select * from Staging.Employee
Select * from dbo.OvertimeData



/*update  SalesTransaction
set
TransDate=DATEADD(year, 2, transdate),
OrderDate=DATEADD(year, 2, Orderdate),
DeliveryDate=DATEADD(year, 2, Deliverydate)

select MIN([TransDate]),MAX([TransDate]) from SalesTransaction

update  PurchaseTransaction
set
TransDate=DATEADD(year, 2, transdate),
OrderDate=DATEADD(year, 2, Orderdate),
DeliveryDate=DATEADD(year, 2, Deliverydate),
Shipdate=DATEADD(year, 2, ShipDate)

select Min(Transdate), Max(TransDate) from PurchaseTransaction*/

update  OvertimeData
set
[StartOvertime]=DATEADD(year, 2, [StartOvertime]),
[EndOvertime]=DATEADD(year, 2, [EndOvertime])


select MIN([StartOvertime]),MAX([StartOvertime]) from OvertimeData
select MIN([EndOvertime]),MAX([EndOvertime]) from OvertimeData
select * from OvertimeData


USE [Grocery_WareHouse]
Create table Staging.SalesTransaction
(
	TransactionID int,
	TransactionNO nvarchar(50) ,
	TransDate datetime ,
	OrderDate datetime ,
	DeliveryDate datetime,
	ChannelID int,
	CustomerID int ,
	EmployeeID int,
	ProductID int,
	StoreID int,
	PromotionID int,
	Quantity float ,
	TaxAmount float ,
	LineAmount  float ,
	LineDiscountAmount float,
	LoadDate datetime default getdate(),
	Constraint Grocery_SalesTrans_Pk primary key(TransactionID)
)

Create Table EDW.Sales_Analysis
( 
  Sales_Analysis_Sk  bigint identity(1,1),
	TransactionNo nvarchar(50),
	Product_Sk int, 
	Location_Sk int, 
	Employee_Sk int,
	Promotion_sk int,
	TransDate_sk int,
	OrderDate_sk int,
	DeliveryDate_sk int,
	TransTime_sk int,
	OrderTime_sk  int, 
	Customer_Sk  int,
	Channel_Sk int,
	Quantity float ,
	TaxAmount float ,
	LineAmount  float ,
	LineDiscountAmount float,
	LoadDate datetime default getdate(),
   Constraint EDW_Sales_Analysis_sk  primary key(Sales_Analysis_Sk),
   Constraint EDW_Sales_Product_sk foreign key(Product_Sk) References EDW.DimProduct(Product_Sk),
   constraint EDW_Sales_Location_sk foreign key(Location_Sk) References EDW.DimLocation(Location_Sk),
   constraint EDW_Sales_Employee_sk foreign key(Employee_Sk) References EDW.DimEmployee(Employee_Sk),
   constraint EDW_Sales_Promotion_sk foreign key(Promotion_Sk) References EDW.DimPromotion(Promotion_Sk),
   constraint EDW_Sales_Transdate_sk foreign key(TransDate_sk) References EDW.dimDate(Date_sk),
   constraint EDW_Sales_Orderdate_sk foreign key(OrderDate_sk) References EDW.dimDate(Date_sk),
   constraint EDW_Sales_Deliverydate_sk foreign key(DeliveryDate_sk) References EDW.dimDate(Date_sk),
   constraint EDW_sales_TransTime_sk foreign key(TransTime_sk) References EDW.dimTime(Time_Sk),
   constraint EDW_sales_OrderTime_sk foreign key(OrderTime_sk) References EDW.dimTime(Time_Sk),   
   constraint EDW_Sales_Customer_sk foreign key(Customer_Sk) References EDW.DimCustomer(Customer_Sk),
   constraint EDW_Sales_Channel_sk foreign key(Channel_Sk) References EDW.dimPosChannel(Channel_Sk)
)

Create table Staging.Purchasetransaction
(
	TransactionID int,
	TransactionNO nvarchar(50) ,
	TransDate datetime ,
	OrderDate datetime ,
	DeliveryDate datetime,
	Shipdate datetime,
	VendorID int,	
	EmployeeID int,
	ProductID int,
	StoreID int,	
	Quantity float ,
	TaxAmount float ,
	LineAmount  float ,
	DayDifferential int,
	LoadDate datetime default getdate(),
	Constraint Grocery_PurchaseTrans_Pk primary key(TransactionID)
)

Create table EDW.Purchase_Analysis

(
	purchase_analysis_sk bigint identity(1,1),
	TransactionNO nvarchar(50),
	product_sk int,
	Location_sk int,
	Employee_sk int,
	Transdate_sk int,
	orderdate_sk int,
	deliveryDate_sk int,
	Shipdate_sk int,
	vendor_sk int,
	Quantity float,
	TaxAmount float,
	LineAmount float,
	Daydifferentail int,
	Loaddate datetime default getdate(),
   Constraint EDW_Purchase_Analysis_sk  primary key(Purchase_Analysis_Sk),
   Constraint EDW_Purchase_Product_sk foreign key(Product_Sk) References EDW.DimProduct(Product_Sk),
   constraint EDW_Purchase_Location_sk foreign key(Location_Sk) References EDW.DimLocation(Location_Sk),
   constraint EDW_Purchase_Employee_sk foreign key(Employee_Sk) References EDW.DimEmployee(Employee_Sk),   
   constraint EDW_Purchase_Transdate_sk foreign key(TransDate_sk) References EDW.dimDate(Date_sk),
   constraint EDW_Purchase_Orderdate_sk foreign key(OrderDate_sk) References EDW.dimDate(Date_sk),
   constraint EDW_Purchase_Deliverydate_sk foreign key(DeliveryDate_sk) References EDW.dimDate(Date_sk),
   constraint EDW_Purchase_Shipdate_sk foreign key(ShipDate_sk) References EDW.dimDate(Date_sk),
   constraint EDW_Purchase_Vendor_sk foreign key(Vendor_Sk) References EDW.DimVendor(Vendor_Sk)  	
)


create table Staging.Overtime
(
	OvertimeID bigint,
	EmployeeNo nvarchar(50),
	firstName nvarchar(50),
	lastName nvarchar(50),
	StartOvertime datetime,
	EndOvertime datetime,
	LoadDate datetime,
	Constraint grocery_Overtime_PK primary key(OvertimeId)
)

select OvertimeID,EmployeeNo,StartOvertime,EndOvertime, DATEDIFF(HOUR, StartOvertime,EndOvertime) as TotalOvertimehour from Staging.Overtime


Create table EDW.HR_Overtime_Analaysis
(
	overtime_sk bigint identity(1,1),
	Employee_sk int,
	OvertimeStartdate_sk int,
	OvertimeStarttime_sk int,
	OvertimeEnddate_sk int,
	OvertimeEndtime_sk int,
	TotalOvertimehour int,
	loadDate datetime default getdate()
	Constraint EDW_HR_Overtime_sk primary key(overtime_sk),
	Constraint EDW_HR_Overtime_Employee_sk Foreign key(Employee_sk) references EDW.DimEmployee(Employee_sk),
	Constraint EDW_HR_Overtime_OvertimeStartdate_sk Foreign key(OvertimeStartdate_sk) references EDW.dimDate(date_sk),
	Constraint EDW_HR_Overtime_OvertimeStarttime_sk Foreign key(OvertimeStarttime_sk) references EDW.dimTime(Time_sk),
	Constraint EDW_HR_Overtime_OvertimeEnddate_sk Foreign key(OvertimeEnddate_sk) references EDW.dimdate(date_sk),
	Constraint EDW_HR_Overtime_OvertimeEndtime_sk Foreign key(OvertimeEndtime_sk) references EDW.DimTime(Time_sk),
)
