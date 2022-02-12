CREATE Table Country
(	Country_ID INT NOT NULL, 
	Country_Name nvarchar NULL);

CREATE Table Province
(	Province_ID INT NOT NULL,
	Province_Name NVARCHAR NULL, 
	Country_ID INT NULL)

Create Table City
(	City_ID INT NOT NULL, 
	City_Name NVARCHAR NULL, 
	Province_ID INT NULL)

Create Table Stores
(	Store_ID INT NOT NULL,
	Store_Location NVARCHAR NULL,
	City_ID INT NULL)

Create Table Associates
(	Associate_ID INT NOT NULL,
	Last_Name NVARCHAR NULL,
	First_Name NVARCHAR NULL,
	Store_ID INT NULL)

Create Table Contact_Type
(	Contact_Type_ID INT NOT NULL,
	Contact_Type_Name NVARCHAR NULL)


Create Table Customer_Contact
(	Customer_Contact_ID INT NOT NULL,
	Customer_Contact_Info NVARCHAR NULL,
	Contact_Type_ID INT NULL,
	Customer_ID INT NULL)

Create Table Customers
(	Customer_ID INT NOT NULL,
	Last_Name NVARCHAR NULL,
	First_Name NVARCHAR NULL,
	Created_Date DATE NULL,
	Created_By NVARCHAR NULL,
	Modified_Date DATE NULL,
	Modified_By NVARCHAR NULL)

Create Table Address_Type
(	Address_Type_ID INT NOT NULL,
	Address_Type_Name NVARCHAR NULL)

Create Table Customer_Addresss
(	Customer_Address_ID INT NOT NULL,
	City_ID INT NULL,
	Street_Address NVARCHAR NULL,
	Postal_Code NVARCHAR NULL,
	Address_Type_ID INT NULL,
	Customer_ID INT NULL)

Create Table Payment_Methods
(	Payment_Methods_ID INT NOT NULL,
	Payment_Method NVARCHAR NULL)

Create Table Promotion_Types
(	Promotion_Types_ID INT NOT NULL,
	Promotion_Types NVARCHAR NULL)

Create Table Promotions
(	Promotions_ID INT NOT NULL,
	Promotion_Type_ID INT NULL,
	Discount DECIMAL NULL,
	Start_Date DATE NULL,
	End_Date DATE NULL)

Create Table Product_Categories
(	Product_Category_ID INT NOT NULL,
	Product_Category NVARCHAR NULL)

Create Table Products
(	Product_ID INT NOT NULL,
	Product_Name NVARCHAR NULL,
	Product_Category_ID INT NULL,
	Price DECIMAL NULL)

Create Table Purchases
(	Purchase_ID INT NOT NULL,
	Purchase_Date DATE NULL,
	Associate_ID INT NULL,
	Customer_ID INT NULL,
	Product_ID INT NULL,
	Quantity INT NULL,
	Price DECIMAL NULL,
	Discount DECIMAL NULL,
	Promotion_ID INT NULL,
	Amount DECIMAL NULL,
	Store_ID INT NULL,
	Payment_Method_ID INT NULL,
	Created_Date DATE NULL,
	Created_By NVARCHAR NULL,
	Modified_Date DATE NULL,
	Modified_By NVARCHAR NULL)

