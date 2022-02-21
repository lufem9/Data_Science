USE [Essential]
Go

CREATE TABLE City (
CityID int NOT NULL,
StateProvinceID int NULL,
CityName nvarchar(255) NULL
)

CREATE TABLE Province (
ProvinceID int NOT NULL,
CountryID int NULL,
ProvinceName nvarchar (255) NULL
)

CREATE TABLE Country (
CountryID int NOT NULL,
CountryName nvarchar(255) NULL
)

CREATE TABLE Customers(
CustomerID int NOT NULL,
FirstName nvarchar(5) NULL,
LastName nvarchar(15) NULL
CreatedDate datetime NULL,
CreatedBy nvarchar NULL,
ModifiedDate datetime NULL,
ModifiedBy nvarchar NULL
) 

CREATE TABLE CustomerAddress(
CustomerAddressID int NOT NULL,
AddressTypeID int NOT NULL,
CustomerID int NOT NULL,
CityID int NULL,
StreetAddress nvarchar(255) NULL,
Postalcode nvarchar(255) NULL
) 

CREATE TABLE AddressType (
AddressTypeID int NOT NULL,
AddressTypename nvarchar(255) NULL
HomeAddress nvarchar(255) NULL,
OfficeAddress nvarchar(255) NULL,
Postalcode nvarchar(255) NULL
)

CREATE TABLE CustomerContact(
CustomerContactID int NOT NULL,
ContactTypeID int NOT NULL,
CustomerID int NOT NULL,
CustomerContactInfo nvarchar(255) NULL
)

CREATE TABLE ContactType(
ContactTypeID int NOT NULL,
CustomerTypeName nvarchar(255) NULL,
HomePhone nvarchar(50) NULL,
OfficePhone nvarchar(50) NULL,
MobilePhone nvarchar(50) NULL,
Email nvarchar(50) NULL
)

CREATE TABLE Stores (
StoreID int NULL,
cityID int NULL,
StoreLocation nvarchar(255) NULL
)

CREATE TABLE Associates (
AssociateID int NULL,
StoreID int NULL,
FirstName nvarchar(5) NULL,
LastName nvarchar(15) NULL
) 

CREATE TABLE PurchaseTrans(
PurchaseID int NULL,
PurchaseDate datetime NULL,
AssociateID int NULL,
CustomerID int NULL,
ProductID int NULL,
OrderQty float NULL,
UnitPrice float NULL,
UnitPriceDiscount float NULL,
SpecialOfferID int NULL,
UnitPrice float NULL,
StoreID int NULL,
PaymentMethodID int NULL,
CreatedDate datetime NULL,
CreatedBy nvarchar NULL,
ModifiedDate datetime NULL,
ModifiedBy nvarchar NULL
)

CREATE TABLE PaymentMethods(
PaymentMethodID int NULL,
PaymentMethod nvarchar(255) NULL
)


CREATE TABLE Product(
ProductID int NULL,
ProductCategoryID int NULL,
ProductName nvarchar(255) NULL,
UnitPrice float NULL
)

CREATE TABLE ProductCategory (
ProductCategoryID int NOT NULL,
CategoryID int NULL,
ProductID int NULL
)
	
CREATE TABLE PromotionTypes(
PromotionTypeID int NOT NULL,
PromotionType nvarchar(255) NULL,
)

CREATE TABLE Promotion(
PromotionID int NOT NULL,
PromotionTypeID int NOT NULL,
UnitPriceDiscount float NULL,
StartDate datetime NULL,
EndDate datetime NULL
)