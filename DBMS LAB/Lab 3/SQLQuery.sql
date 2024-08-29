SELECT *
FROM Orders
WHERE ShippedDate > RequiredDate

SELECT DISTINCT Country
FROM Employees


SELECT ProductName
FROM Products
WHERE Discontinued = 'true'


SELECT DISTINCT (OrderID)
FROM [Order Details]
WHERE Discount=0


SELECT CompanyName
FROM Customers
WHERE Region IS NULL


SELECT CompanyName,Phone
FROM Customers
WHERE Country = 'UK' OR Country ='USA'


SELECT ShipCountry
FROM Orders
WHERE ShippedDate LIKE '%1997%'


SELECT CustomerID
FROM Orders
WHERE ShippedDate IS NULL


SELECT SupplierID,CompanyName,City
FROM Suppliers


SELECT COUNT(DISTINCT Country)
FROM Employees

SELECT *
FROM Employees
WHERE City='London'


SELECT ProductName
FROM Products
WHERE Discontinued = 'false'


SELECT DISTINCT (OrderID)
FROM [Order Details]
WHERE Discount<=0.1


SELECT EmployeeID,FirstName, HomePhone,Extension
FROM Employees
WHERE Region IS NULL