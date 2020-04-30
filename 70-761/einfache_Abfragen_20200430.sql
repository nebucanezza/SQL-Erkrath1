SELECT *
FROM Sales.Customers
WHERE country='germany';

SELECT
	COUNT(custid) AS Anzahl, 
	MIN(country) As [MIN], 
	MAX(region) AS [MAX],
	AVG(custid) AS [AVG],
	SUM(custid) AS [SUM],
	country, 
	city
FROM Sales.Customers
GROUP BY city, country

SELECT
	COUNT(custid) AS Anzahl, 
	MIN(country) As [MIN], 
	MAX(region) AS [MAX],
	AVG(custid) AS [AVG],
	SUM(custid) AS [SUM],
	country, 
	city
FROM Sales.Customers
GROUP BY country, city, region
HAVING COUNT(custid)>1 
ORDER BY region;

SELECT * 
FROM Sales.Customers 
ORDER BY country, postalcode, address;

SELECT DISTINCT postalcode FROM Sales.Customers;

SELECT DISTINCT productid FROM Sales.OrderDetails;
SELECT * FROM Production.Products;

SELECT custid, companyname, country ,  COALESCE(region, fax, 'Nicht angegeben') as region
FROM Sales.Customers


DECLARE @z INT = 10;
SELECT CONCAT(@z, , ' Dies ist', 'Bla Bla');

SELECT SUBSTRING('test12345',6 ,4);
SELECT LEFT ('abcdefg', 4);
SELECT RIGHT ('abcdefg', 4);
SELECT  LEN(phone)  
FROM Sales.Customers

SELECT UPPER ('dsadsadasdada');








GO


DECLARE @z INT = 0;
SET @z = 1;
SELECT @z;
GO





