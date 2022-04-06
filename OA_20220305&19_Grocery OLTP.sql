/*ALTER AUTHORIZATION ON DATABASE:: [CS_1] TO (SA)*/
--5th of March, 2022 --

ALTER AUTHORIZATION ON DATABASE::[Grocery] TO (SA)

Use [Grocery]

Select top 10 * from PurchaseTransaction

create schema Grocery_OLTP; 

select top 5 * from Department
select top 5 * from Product
select top 5 p.productID, p.ProductNumber,p.Product, p.UnitPrice, d.Department 
from Product p
join Department d on p.DepartmentID=d.DepartmentID


select p.productID, p.ProductNumber,p.Product, p.UnitPrice, d.Department 
from Product p
join Department d on p.DepartmentID=d.DepartmentID


select top 5 * from Employee
select top 5 * from MaritalStatus


Create Table Grocery_OLTP.Product
(
	productID int, 
	ProductNumber nvarchar(50),
	Product nvarchar(50), 
	UnitPrice float,
	Department nvarchar(50),
	LoadDate datetime default getdate(),
	CONSTRAINT grocery_product_pk primary key (productID)
)

select * from Product
select * from Grocery_OLTP.Product


Create Table EDW.Product
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
	CONSTRAINT grocery_product_pk primary key (productID)
)

Select * from Store s
Select * from city c
Select * from state st


Select s.StoreID, s.StoreName, s.StreetAddress, c.CityName, st.State, getdate() from Store s
join city c on s.CityID = c.CityID
join state st on c.StateID=st.StateID


Create table Grocery_OLTP.Location
(
	Storeid int,
	StoreName nvarchar(50),
	StreetAddress nvarchar(50),
	cityName nvarchar(50),
	State nvarchar(50),
	loadDate date default getdate(),
	CONSTRAINT grocery_location_pk primary key (Storeid)
)


Create table EDW.Location
(
	Store_sk int identity(1,1),
	Storeid int,
	StoreName nvarchar(50),
	StreetAddress nvarchar(50),
	cityName nvarchar(50),
	State nvarchar(50),
	StartDate date,
	EndDatae date,
	loadDate date default getdate(),
	CONSTRAINT grocery_location_pk primary key (Storeid)
)

/*select v.VendorID, v.VendorNo, 
	v.LastName + v.FirstName as Vendor,
	v.RegistrationNo,v.VendorAddress,c.CityName,s.State, GetDate() as LoadDate
from Vendor v
join city c on v.CityID= c.CityID
join state s on c.StateID=s.StateID*/


/*select v.VendorID, v.VendorNo, 
	v.LastName + ', '+ v.FirstName + '.' as Vendor,
	v.RegistrationNo,v.VendorAddress,c.CityName,s.State, GetDate() as LoadDate
from Vendor v
join city c on v.CityID= c.CityID
join state s on c.StateID=s.StateID*/


select v.VendorID, v.VendorNo, 
	Upper(v.LastName) + ', '+ left(v.FirstName,1) + '.' as Vendor,
	v.RegistrationNo,v.VendorAddress,c.CityName,s.State, GetDate() as LoadDate
from Vendor v
join city c on v.CityID= c.CityID
join state s on c.StateID=s.StateID


create table Grocery_OLTP.Vendor
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
	constraint  grocery_Vendor_pk primary key (VendorID)
)



/*CREATING THE DATE QUERY .............................*/

/*Use [Grocery]
select top 5 * from SalesTransaction
select top 5 * from PurchaseTransaction*/

Use [Grocery]
select min(TransDate), max(TransDate)  from SalesTransaction
select  min(TransDate), max(TransDate) from PurchaseTransaction

create Table EDW.dimDate
(
	Date_Sk int,   ----20220401
	CDate Date,    -----2022-04-01
	CYear int,     -----2022
	cQuarter nvarchar(2),    ----Q2
	CMonth int,             -------04
	CEngMonthName nvarchar(20),   --------April
	CFrenchMonthName nvarchar(20),  --------Avril
	CDay int,                      --------01
	CDayofWeek int,                -----6
	CDayNameofWeek nvarchar(20),    ------Friday
	constraint EDW_dimDate_sk primary key (Date_sk)
)


select getdate()
select year(getdate())
select month(getdate())

select datename(month,getdate())
select datename(WEEKDAY,getdate())
select datename(WEEK,getdate())

select DATEPART(week,getdate())
select datepart(quarter,getdate())

select DATEFROMPARTS(2022,05,07)
select datepart(quarter,(select DATEFROMPARTS(2022,05,07)))

select EOMONTH(GETDATE())
select EOMONTH((select DATEFROMPARTS(2020,02,07)))

select day(getdate())
select day(EOMONTH(DATEFROMPARTS(2022,02,07)))

select RIGHT('0' + month(getdate()), 2)
select RIGHT('0' + cast(month(getdate()) as nvarchar),2)
select RIGHT('0' + cast(day(getdate()) as nvarchar),2)
select RIGHT('0' + cast(month(DATEFROMPARTS(2020,10,07)) as nvarchar),2);

--19th of March, 2022 --
/*  year from 2011 to 2022
			Month 1-12
				day 1 to EOMONTH(GETDATE())
					date= year + month + day
				day= day + 1
			month= month + 1
			end Month
		year= year + 1
	End year
*/

/*Declare @StartYear int = 2011
Declare @EndYear int = 2023

Declare @StartMonth int 
Declare @EndMonth int =12



BEGIN
	print @StartYear
	print @EndYear

END


Declare @StartYear int = 2011
Declare @EndYear int = 2023

WHILE @StartYear =  @EndYear
BEGIN
	print @StartYear
	select @StartYear=@StartYear+1
END*/


/*Declare @StartYear int = 2011
Declare @EndYear int = 2023
Declare @StartMonth int 
Declare @EndMonth int =12
Declare @StartDay int =1
Declare @endDay int


WHILE @StartYear<=@EndYear
BEGIN
		select @StartMonth =1
		WHILE @StartMonth<=@EndMonth
		BEGIN
				select @StartDay
				select @endDay = Day(EOMONTH(DATEFROMPARTS(@StartYear,@StartMonth,1)))
				WHILE @StartDay <=@endDay
				BEGIN
					INSERT INTO #DateGenerate(CYear,CMonth,CDay,CDate,DateSK)
					Select 
						@StartYear as CYear, 
						@StartMonth as CMonth,
						@StartDay as CDay,
						DATEFROMPARTS(@StartYear,@StartMonth,@StartDay)  as CDate,
						cast(cast(@StartYear as nvarchar) + RIGHT('0'+ cast(@StartMonth as nvarchar),2)+ RIGHT('0'+ cast(@StartDay as nvarchar),2) as int)  as DateSK ---- 20110122


					Select @StartDay=@StartDay+1
				END --- end of day loop

			select @StartMonth=@StartMonth+1
		END --- end of month loop

		select @StartYear=@StartYear+1
END --end of year loop;

select * from #DateGenerate      (--I cannot display the other year )
select * from #DateGenerate where DateSk= 20231231

drop table #DateGenerate
create table #DateGenerate
(
CYear int,
CMonth int,
CDay int,
CDate date,
DateSk int
)
*/


--19/March/2022 Class continuation from last class
CREATE PROCEDURE EDW.SpGenerateDimDate (@StartYear int, @EndYear int)
AS

Declare @StartYear int = 2011
Declare @EndYear int = 2023
Declare @StartMonth int
Declare @EndMonth int =12
Declare @StartDay int
Declare @endDay int
Declare @CQuarter  nvarchar(2)
Declare @CDate Date
Declare @DateSK int
Declare @CEngMonthName nvarchar(20)
Declare @CFrenchMonthName nvarchar(20)
Declare  @CDay int
Declare @CdayOfWeek int
Declare @CDayNameofweek nvarchar(20)
BEGIN
WHILE @StartYear<=@EndYear
BEGIN
		select @StartMonth =1
		WHILE @StartMonth<=@EndMonth
		BEGIN
				select @StartDay=1
				select @endDay = Day(EOMONTH(DATEFROMPARTS(@StartYear,@StartMonth,1)))
				--select @CQuarter = cast('Q' + cast(DATEPART(Quarter,@endDay) as nvarchar) as int)
				WHILE @StartDay<=@endDay
				BEGIN
					select @CDate = DATEFROMPARTS(@StartYear,@StartMonth,@StartDay)
					select @DateSK = cast(cast(@StartYear as nvarchar) + RIGHT('0'+ cast(@StartMonth as nvarchar),2)+ RIGHT('0'+ cast(@StartDay as nvarchar),2) as int)
					Select @StartYear
					select @CQuarter = 'Q' + cast(DATEPART(Quarter,@CDate) as nvarchar)
					select @StartMonth
					select @CEngMonthName = DATENAME(MONTH,@CDate)
					Select CFrenchMonthName = CASE Month(@CDate)
							When 1 then 'Janvier'
							When 2 then 'Fevrier'
							When 3 then 'Mars'
							When 4 then 'Avril'
							When 5 then 'Mai'
							When 6 then 'Auin'
							When 7 then 'Juillet'
							When 8 then 'Aout'
							When 9 then 'Septembre'
							When 10 then 'Octombre'
							When 11 then 'Novembre'
							When 12 then 'Decembre'
							END
                      select @CDay
					  Select @CdayOfWeek
					  select @CDayNameofweek

						INSERT INTO #DimDate(Date_Sk ,CDate ,CYaer ,cQuartar ,CMonth ,CEngMonthName , CFrenchMonthName ,Cday ,CDayofWeek ,	CDayNameofweek )
						 select @DateSK, @CDate, @StartYear, @CQuarter, @StartMonth, @CEngMonthName, @CFrenchMonthName, @CDay, @CdayOfWeek, @CDayNameofweek

						select @StartDay=@StartDay+1
				END -- end of day loop
			select @StartMonth=@StartMonth+1
		END --- end of month loop

	select @StartYear=@StartYear+1
END --end of year loop
END --end of procedure

EXECUTE EDW.SpGenerateDimDate 2010,2023

select * from #DateGenerate  

drop Table  #DimDate
Create Table #DimDate
(
	Date_Sk int,   ----20220305
	CDate Date,		-----2022-03-05
	CYaer int,		-----2022
	cQuartar nvarchar(2),		----Q1
	CMonth int,		-------03
	CEngMonthName Nvarchar(20),		--------Mar
	CFrenchMonthName nvarchar(20),	-------Mar
	Cday int,		--------05
	CDayofWeek int,		-----7
	CDayNameofweek nvarchar(20), ------Saturday
	constraint EDW_dimDate_sk primary key(Date_sk)
)

select * from #DimDate

select top 10 * from #DimDate where CFrenchMonthName is not null




CREATE TABLE EDW.DimTime
(
    Time_Sk int identity(1,1),
    HourID int, ----- 0hr - 23hr
    PeriodofDay nvarchar(25),
    Businesshour nvarchar(25),  -- (0-7)---early, (8-17) ---- open, (18-23)----late
    StartDate Datetime,
    constraint EDW_dimTime_SK primary key (Time_Sk)
)

Drop Table #DimTime

CREATE TABLE #DimTime
(
    Time_Sk int identity(1,1),
    HourID int, ----- 0hr - 23hr
    PeriodofDay nvarchar(25),
    Businesshour nvarchar(25),  -- (0-7)---early, (8-17) ---- open, (18-23)----late
    StartDate Datetime,
    constraint EDW_dimTime_SK primary key (Time_Sk)
)

select * from #DimTime;
/*
--- 0 - 7 --- Early, 
8- 17 Open -- 
18-- 23--Late  
midnight -0 ,
morning (from 1 am to 11:59 am),
noon (exactly 12:00 ), 
afternoon (from 12:01 pm to 17), 
evening (from 18  to 23)
*/

insert into #DimTime(HourID,PeriodofDay, Businesshour,StartDate)
Values (0,'MidNigt','Early',GETDATE()),
        (1,'Morning','Early',GETDATE()),
        (2,'Morning','Early',GETDATE()),
        (3,'Morning','Early',GETDATE()),
        (4,'Morning','Early',GETDATE()),
        (5,'Morning','Early',GETDATE()),
        (6,'Morning','Early',GETDATE()),
        (7,'Morning','Early',GETDATE()),
        (8,'Morning','Open',GETDATE()),
        (9,'Morning','Open',GETDATE()),
        (10,'Morning','Open',GETDATE()),
        (11,'Morning','Open',GETDATE()),
        (12,'Noon','Open',GETDATE()),
        (13,'Afternoon','Open',GETDATE()),
        (14,'Afternoon','Open',GETDATE()),
        (15,'Afternoon','Open',GETDATE()),
        (16,'Afternoon','Open',GETDATE()),
        (17,'Afternoon','Open',GETDATE()),
        (18,'Evening','late',GETDATE()),
        (19,'Evening','late',GETDATE()),
        (20,'Evening','late',GETDATE()),
        (21,'Evening','late',GETDATE()),
        (22,'Evening','late',GETDATE()),
        (23,'Evening','late',GETDATE())

select * from #DimTime;


--Another method to get this done
Declare @StartHour int = 1
Declare @EndHour int = 23

WHILE @StartHour<=@EndHour
BEGIN
    insert into #DimTime(HourID,PeriodofDay, Businesshour,StartDate)

    select @StartHour as HourID,
        CASE 
            When @StartHour=0 Then 'Midnight'
            when @StartHour>0 and @StartHour <12 Then 'Morning'
            When @StartHour =12 Then 'Noon'
            When @StartHour>12 and @StartHour <18 Then 'Afternoon'
            Else 'Evening'
        END as PeriodofDay,
        CASE 
            When @StartHour>=0 and @StartHour<=7 Then 'Early'
            when @StartHour>=8 and @StartHour <18 Then 'Open'
            Else 'Late'
        END as Businesshour,
        GetDate() as Startdate

    select @StartHour=@StartHour+1
END


/*Drop Table #DimTime

CREATE TABLE #DimTime
(
    Time_Sk int identity(1,1),
    HourID int, ----- 0hr - 23hr
    PeriodofDay nvarchar(25),
    Businesshour nvarchar(25),  -- (0-7)---early, (8-17) ---- open, (18-23)----late
    StartDate Datetime,
    constraint EDW_dimTime_SK primary key (Time_Sk)
)*/
--select * from #DimTime;

Create table Grocery_OLTP.Employee
 (
   EmployeeID int,
   EmployeeNo nvarchar(50),
   Employee nvarchar(255),
   MaritalStatus nvarchar(50),
   DateofBirth date,
   Loaddate datetime default getdate(),
   constraint Grocery_employee_pk primary key (EmployeeID)
 )

select 
	e.EmployeeID,e.EmployeeNo, e.Employee, e.MaritalStatus,e.DateofBirth, O.StartOvertime, O.EndOvertime,
	getdate() as loaddate 
from Staging.Employee e 
inner join dbo.OvertimeData O on e.EmployeeNo = O.EmployeeNo


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