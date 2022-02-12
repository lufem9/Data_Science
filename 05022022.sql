use Essential;

/*SELECT COUNT(distinct t.Employee) as TotalCount FROM PurchaseTrans t

select  count(*) as TotalEmp from Employee

select avg(distinct OrderQty) as AvgOrder from PurchaseTrans
select avg(OrderQty) as AvgOrder from PurchaseTrans
select count(distinct OrderQty) as AvgOrder from PurchaseTrans
select count(OrderQty) as AvgOrder from PurchaseTrans
select sum(OrderQty) as AvgOrder from PurchaseTrans
select sum(distinct OrderQty) as AvgOrder from PurchaseTrans


SELECT MAX(OrderQty) as MaximumOrderQty	FROM PurchaseTrans
SELECT MAX(DISTINCT OrderQty) as MaximumUniqueOrderQty	FROM  PurchaseTrans

SELECT MAX(OrderQty) as MaximumOrderQty	FROM PurchaseTrans
SELECT MAX(DISTINCT OrderQty) as MaximumUniqueOrderQty	FROM  PurchaseTrans

SELECT MAX(Supplier) as MaximumOrderQty	FROM PurchaseTrans
SELECT MIN(Supplier) as MaximumUniqueOrderQty	FROM  PurchaseTrans


SELECT Country, sum(DISTINCT OrderQty) as SumOfOrderQty FROM PurchaseTrans
GROUP BY Country.


/* Return the Grouping sets, rollup of subtotal and total quantity by Country and class of PurchaseTrans dataset*/
SELECT Country,Class,SUM(orderQty) as SUMofOrderQty 
FROM PurchaseTrans  
GROUP BY GROUPING SETS(ROLLUP(Country,Class)) ORDER BY  Country

SELECT Country, SUM(DISTINCT orderQty) as SUMofUniqueOrderQty FROM PurchaseTrans  GROUP BY Country
SELECT Country, SUM(DISTINCT orderQty) as SUMofUniqueOrderQty FROM PurchaseTrans  GROUP BY Country HAVING SUM(Distinct orderQty)>100



/* Return the SUM of DISTINCT order quantity value, count of order quantity, Having Sum of Distinct order quantity multiples by  quantity greater than 10, GROUP BY Country in the PurchaseTrans dataset*/

SELECT Country, SUM(DISTINCT orderQty) AS SUMofUniqueOrderQty,  COUNT(*) as CountofOrderQty, COUNT(DISTINCT OrderQty*UnitPrice) as OU FROM PurchaseTrans
GROUP BY Country HAVING COUNT(DISTINCT OrderQty*UnitPrice)>10

/* Return the SUM of DISTINCT order quantity value, count of order quantity and sum of order quantity multiplies by unit price,  
Having Count of Distinct order quantity multiples by quantity greater than 10 AND sum of order quantity multiples by unit price  
greater than 2000 GROUP BY Country in the PurchaseTrans dataset*/

SELECT Country,  SUM(DISTINCT OrderQty) as SumOrdeQty, COUNT(OrderQty) as countOrderQty,  SUM(OrderQty*UnitPrice) as sumOfOrderQty  
FROM PurchaseTrans
Group by Country
Having count(distinct OrderQty*UnitPrice)>10 AND SUM(OrderQty*UnitPrice)>2000

/* Return the SUM of DISTINCT order quantity value, count of order quantity, 
Having Sum of Distinct order quantity multiples by  quantity greater than 10,
GROUP BY Country in the PurchaseTrans dataset*/

select country, sum(distinct OrderQty) as sumOfOrederQty, count(OrderQty) as countOrdeqty 
from PurchaseTrans
Group by Country
Having sum(distinct orderQty*Unitprice)>10

/* Return the SUM of DISTINCT order quantity value, count of order quantity 
and sum of order quantity multiplies by unit price,  Having Count of Distinct order quantity multiples by quantity 
greater than 10 AND sum of order quantity multiples by unit price  greater than 2000 GROUP BY Country in the PurchaseTrans dataset*/

select Country, sum(Distinct OrderQty) as SumOrderQty,Count(OrderQty)as CountOrderQty, sum(OrderQty*UnitPrice) as SumOfOrderqty 
From PurchaseTrans
Group By Country
Having Count(distinct OrderQty*UnitPrice)>10 AND SUM(OrderQty*UnitPrice)>2000
order by country desc

/* Display dataset in PurchaseTransaction of productid in product dataset with productid less than 10*/


select TransID, OrderID,AccountNumber, Supplier, Address, City, OrderQty*UnitPrice as PurchaseAmount
from PurchaseTrans
where productID IN (select ProductId from Product where ProductID <10)

select TransID, OrderID,ProductId, AccountNumber, Supplier, Address, City, OrderQty*UnitPrice as PurchaseAmount
from PurchaseTrans
where productID NOT IN (select ProductId from Product where ProductID <10)

/* Display dataset in PurchaseTransaction and derives ProductName in product dataset using ProductID as  Correlated column*/

select TransID, OrderID,ProductId, (select ProductName from Product where PurchaseTrans.ProductID=Product.ProductID) as ProductName, AccountNumber, Supplier, Address, City, OrderQty*UnitPrice as PurchaseAmount
from PurchaseTrans

--select ProductName from Product

select TransID, OrderID,Product.ProductId, Product.ProductName, AccountNumber, Supplier, Address, City, OrderQty*UnitPrice as PurchaseAmount
from PurchaseTrans
join Product on PurchaseTrans.ProductID=Product.ProductID 

/* Display dataset in PurchaseTransaction and derives ProductName in product dataset Where the Special  OfferId exists in SpecialOffer dataset*/

select TransID, OrderID, AccountNumber, Supplier, Address, City, OrderQty*UnitPrice as PurchaseAmount,
(select ProductName from Product where PurchaseTrans.ProductID=Product.ProductID) as ProductName
from PurchaseTrans
where exists (select 1 from SpecialOffer where PurchaseTrans.SpecialOfferID= SpecialOffer.SpecialOfferID)

select TransID, OrderID, AccountNumber, Supplier, Address, City, OrderQty*UnitPrice as PurchaseAmount,
(select ProductName from Product where PurchaseTrans.ProductID=Product.ProductID) as ProductName
from PurchaseTrans
where not exists (select 1 from SpecialOffer where PurchaseTrans.SpecialOfferID= SpecialOffer.SpecialOfferID)

/* Display dataset in PurchaseTransaction dataset Where ProductID is greater that ALL the product in the  sub query dataset*/
select TransID, OrderID,ProductId,AccountNumber, Supplier, Address, City, OrderQty*UnitPrice as PurchaseAmount
from PurchaseTrans
where ProductID> ALL (select ProductID from Product where ProductID<10) 

Create table Store (
StoreID int not null,
StoreLocation nvarchar null,
CityID nvarchar null,
)

Create table Customer (
CustomerID nvarchar(5) not null,
LastName nvarchar(15)  null,
-FirstName
-CreatedDate
-CreatedBy
-ModifiedDate
-ModifiedBy

)

/* Display dataset in PurchaseTransaction with the matching product on product dataset*/

select t.OrderID,p.ProductName, t.ProductID 
from PurchaseTrans t 
inner join  Product p on t.ProductID=p.ProductID

select distinct ProductID from PurchaseTrans
select  ProductID from PurchaseTrans

select distinct ProductID from Product

/* Display dataset in PurchaseTransaction with the matching product and special offer dataset*/
select PurchaseTrans.OrderID,p.ProductName, PurchaseTrans.ProductID, s.SpecialOffer
from PurchaseTrans  
inner join  Product p on .ProductID=p.ProductID
inner join SpecialOffer s  on PurchaseTrans.SpecialOfferID=s.SpecialOfferID

 Purchase              Product		inner join
 1						1				1
 2						2				2
 3						3				3
 5										3
 7										2
 3										1					
 4
 2
 1

 select t.OrderID,p.ProductName, t.ProductID, s.SpecialOffer,s.SpecialOfferID
from PurchaseTrans t 
inner join  Product p on t.ProductID=p.ProductID
inner join SpecialOffer s  on t.SpecialOfferID=s.SpecialOfferID
where s.SpecialOfferID=4


/* Display dataset in PurchaseTransaction with the matching Product, Category and special offer on Back to  School dataset*/

select t.OrderID,t.Supplier,t.Address, t.City, t.StateProvince, t.Country, t.OrderQty, s.SpecialOffer, Table_PC.CategoryName
from PurchaseTrans t 
inner join  
			(
				select p.ProductID,c.CategoryName, p.ProductName,p.ProductNumber
				from Product p
					inner join ProductCategory pc on p.ProductID=pc.ProductID
					inner join Category c on pc.CategoryID = c.CategoryID
			) Table_PC on t.ProductID=Table_PC.ProductID
				inner join SpecialOffer s on t.SpecialOfferID=s.SpecialOfferID
where s.SpecialOfferID=4

/* Display dataset in PurchaseTransaction with the matching product on product dataset*/

select t.OrderID,t.Supplier,t.Address, t.City, t.StateProvince, t.Country, t.OrderQty
from PurchaseTrans t 
left join  Product p on t.ProductID=p.ProductID

/* Display ALL dataset Special Offer and with the matching in PurchaseTrans dataset*/

select t.OrderID,t.Supplier,t.Address, t.City, t.StateProvince, t.Country, t.OrderQty 
from PurchaseTrans t
right join SpecialOffer s on t.SpecialOfferID=s.SpecialOfferID

Select * from PurchaseTrans where SpecialOfferID =6

select t.OrderID,t.Supplier,t.Address, t.City, t.StateProvince, t.Country, t.OrderQty 
from PurchaseTrans t
full outer join SpecialOffer s on t.SpecialOfferID=s.SpecialOfferID


select t.OrderID,t.Supplier,t.Address, t.City, t.StateProvince, t.Country, t.OrderQty, s.SpecialOffer, Table_PC.CategoryName
from PurchaseTrans t 
full outer  join  
			(
				select p.ProductID,c.CategoryName, p.ProductName,p.ProductNumber
				from Product p
					inner join ProductCategory pc on p.ProductID=pc.ProductID
					inner join Category c on pc.CategoryID = c.CategoryID
			) Table_PC on t.ProductID=Table_PC.ProductID
				full outer  join SpecialOffer s on t.SpecialOfferID=s.SpecialOfferID


/* Display each row in Special Offer for all rows in Category dataset*/

SELECT A.SpecialOffer, B.CategoryName 
FROM SpecialOffer A CROSS JOIN Category B

select count(*) from SpecialOffer
select count(*) from Category

/* Display combination of both Customer Shipment and Purchase Transaction datasets with duplicate  data */

SELECT OrderID,AccountNumber,Supplier,Employee,City, Country FROM CustomerShipment  
UNION ALL
SELECT OrderID,AccountNumber,Supplier,Employee,City,Country FROM PurchaseTrans

SELECT OrderID,AccountNumber,Supplier,Employee,City, Country FROM CustomerShipment  
UNION 
SELECT OrderID,AccountNumber,Supplier,Employee,City,Country FROM PurchaseTrans 


Update tableName set tableNAme.colum='value'

Insert into TableName( Col1,col2) values('val1','val2')

Delete TableName where TableName.Column = 'value' 

Truncate Table  TableName 
Delete Table  TableName 
*/

/* Insert a record into a table*/

INSERT INTO Product(ProductID,ProductName,ProductNumber)  VALUES(105, 'Touring-3000 Yellow, 105', 'BK-T18Y-105');

select * from Product where ProductID=109

/* Insert multiple records to a table*/

INSERT INTO Product(ProductID,ProductName,ProductNumber)
VALUES(106, 'Touring-3000 Yellow, 106', 'BK-T18Y-106'),
(107, 'Touring-3000 Yellow, 107', 'BK-T18Y-107'),
(108, 'Touring-3000 Yellow, 108', 'BK-T18Y-108')

/* Insert a record into a table Using Select Statement*/

INSERT INTO Product(ProductID,ProductName,ProductNumber)
SELECT 109 AS ProductID, 'Touring-3000 Yellow, 109' AS ProductName, 'BK-T18Y-109' AS ProductNumber

select * from Product Where ProductID = 110

/* Insert a record into a table Using Select Statement*/
INSERT INTO Product(ProductID,ProductName,ProductNumber)
SELECT ProductID+1 as ProductID, ProductName+' 110' AS ProductName, ProductNumber+' 110' FROM Product  
WHERE ProductID=(SELECT MAX(ProductID) FROM Product)

INSERT INTO Product(ProductID,ProductName,ProductNumber)
SELECT ProductID+1 as ProductID, ProductName+(SELECT MAX(ProductID) FROM Product) AS ProductName, ProductNumber+(SELECT MAX(ProductID) FROM Product) FROM Product  
WHERE ProductID=(SELECT MAX(ProductID) FROM Product)

INSERT INTO Product(ProductID,ProductName,ProductNumber)
SELECT (SELECT MAX(ProductID) FROM Product)+1 as ProductID, ProductName+(SELECT MAX(ProductID) FROM Product)+1 AS ProductName, ProductNumber+' 110' FROM Product  
WHERE ProductID=(SELECT MAX(ProductID) FROM Product)


UPDATE PRODUCT Set ProductNumber=ProductNumber+' 000'
UPDATE PRODUCT Set ProductNumber='BK-T18Y-109 110 000' Where ProductID = 110

/* Update all product number in the product table using product_temp table with the matching product Id = 1*/

/*update p SET p.ProductNumber = t.ProductNumber
From Product p
Inner join Product_temp t on p.ProductID=t.Product_temp
where p.ProductID=1

/* Delete all product in the product table where product not in product_temp table*/

DELETE Product WHERE ProductID NOT IN (SELECT ProductID FROM product_temp)*/


DELETE Product WHERE ProductID=111

SELECT ProductName,  CHARINDEX('A', ProductName,1) as  PositionNumber FROM Product

SELECT ProductName,  left(ProductName,24) as RIGHT10  FROM Product Where ProductID = 110


select * from Country

SELECT * FROM STRING_SPLIT('Lagos-Ogun-Oyo', '-')

USE Essential;  
GO  
SELECT compatibility_level  
FROM sys.databases WHERE name = 'Essential';  
GO  

ALTER DATABASE Essential  
SET COMPATIBILITY_LEVEL = 130;  
GO

SELECT STRING_AGG(CountryName,', ')  FROM Country

select country, Sum(OrderQty) as  TotalQty, Count(*) as TotalCount,  Sum(orderQty*UnitPrice) as  TotalPurchaseAmount FROM PurchaseTrans  group by Country

select	HASHBYTES('SHA2_512',Country) as  MaskedCountry,  HASHBYTES('SHA2_512',Cast(Sum(OrderQty)  as nvarchar)) as MaskedTotalQty,
Count(*) as TotalCount,  Sum(orderQty*UnitPrice) as  TotalPurchaseAmount FROM PurchaseTrans  group by Country

SELECT	GETDATE() as CurrentDate

select Month(GETDATE()) as Months


SELECT DATENAME(MONTH, '2022-02-24') as MonthNameEnglish

SELECT DATENAME(MONTH, GETDATE()) as MonthNameEnglish

SELECT DATENAME(DAY, GETDATE()) as MonthNameEnglish

SELECT DATEPART(DY, GETDATE()) 

SELECT DATEFROMPARTS(2022,02,24) AS
CreatedDate

SELECT FORMAT (getdate(), 'dd-MM-yyyy ') as date

SELECT FORMAT (getdate(), 'MM-dd-yyyy ') as date


select DATEDIFF(MONTH,'2022-01-01',getdate())

SELECT DATEADD(YEAR,1,GETDATE())
SELECT DATEADD(YEAR,-1,GETDATE())
SELECT DATEADD(MONTH,6,GETDATE())

select EOMONTH((SELECT DATEADD(MONTH,6,GETDATE())))


---CTE

/* Use CTE to display the Purchase Transaction datasets of PurchaseAmount, supplier and Country*/
WITH Supplier_Sales_CTE  
AS
	(
		SELECT Supplier, Country, YEAR(OrderDate) AS OrderYear,SUM(OrderQty*UnitPrice) as PurchaseAmount 
		FROM PurchaseTrans
		GROUP BY Supplier, Country, YEAR(OrderDate)
	)
Select * from Supplier_Sales_CTE;

/* Use CTE to Display Distinct combination of both Customer Shipment and Purchase Transaction  datasets without duplicate data for Canada */

WITH Canada_Sale_CTE (Accountnumber, Supplier, Employee,City, Category)
AS
	(
	  select cs.AccountNumber, cs.Supplier, cs.Employee, cs.City, 'Customer Shipment' as Category
	  from CustomerShipment cs
	  where Country ='Canada'
	  UNION
	  select t.AccountNumber, t.Supplier, t.Employee, t.City, 'Purchase Shipment' as Category 
	  from PurchaseTrans t
	  where Country ='Canada'
	)
	select Supplier,City from Canada_Sale_CTE where city = 'Toronto';

