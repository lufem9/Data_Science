Create Table Country
(Country_ID nvarchar NOT NULL, CountryName nvarchar NULL )

Create Table Stores
(	Stores_ID int NOT NULL, 
	Stor_Location nvarchar NULL, 
	City_ID int NULL )

Create Table Associates
(	Associate_ID int NOT NULL, 
	Last_Name nvarchar NULL,
	First_Name nvarchar NUll,
	Store_ID int NULL )

Create Table Contact_Type
(	Contact_Contact_ID int NOT NULL,
	Contact_Type_Name nvarchar NULL,)

Create Table Customer_Contact
(	Customer_Contact_ID int NOT NULL,
	Customer_Contact_Info nvarchar NULL,
	Contact_Type_ID int NULL,
	Customer_ID int NULL,)

Create Table Customers
(	Customer_Address_ID int NOT NULL,
	City_ID int NULL,
	Street_Address nvarchar NULL,
	Postal_Code nvarchar NULL,
	Address_Type_ID int NULL,
	Customer_ID int NULL)

Create Table Address_Type
(	Address_Type_ID int NOT NULL,
	Address_Type_Name nvarchar NULL,)

Create Table Payment_Method
(	Payment_method_ID int NOT NULL,
	Payment_Method nvarchar NOT NULL)

Create Table Promotion_Types 
(	Promotion_Type_ID int NOT NULL,
	Promotion_Type nvarchar NOT NULL)

Create Table Promotions
(	Promotion_ID int NOT NULL,
	Promotion_Type_ID int NULL,
	Discount decimal NULL,
	Start_Date DATE NULL,
	End_Date DATE NULL)

Create Table Product_Categories
(	Product_Category_ID int NOT NULL,
	Product_Category nvarchar NULL)

Create Table Products
(	Product_ID int NOT NULL,
	Product_Name nvarchar NULL,
	Product_category_ID int NULL,
	Price decimal NULL)

Create Table Purchases
(	Purchase_ID int NOT NULL,
	Purchase_Date date NULL,
	Associate_ID int NULL,
	Customer_ID int NULL,
	Product_ID int NULL,
	Quantity int NULL,
	Price decimal NULL,
	Discount decimal NULL,
	Promotions_ID int NULL,
	Amount decimal NULL,
	Store_ID int NULL,
	Payment_method_ID int NULL,
	Create_Date date NULL,
	Modify_Date date NULL,
	Modified_By nvarchar NULL,)