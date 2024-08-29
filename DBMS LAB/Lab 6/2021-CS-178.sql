---------Task1
use dublinbikes
--1
--Give the list of all stations (Station Name) from where the rides were taken in year 2004.
SELECT Location AS [Station Name]
FROM Stations
WHERE Station_ID IN (
    SELECT Station_ID
    FROM Bike_Rentals
    WHERE YEAR(Start_Time) = '2004');

--2
--Give the total repairing cost of each bike. Schema should be like this. (Bike Id, Repairing Cost)
SELECT Bike_ID, 
    (SELECT SUM(Price) 
     FROM Repairs 
     WHERE Repairs.B_Status_ID = Bike_Status.B_Status_ID) AS Repairing_Cost
FROM Bike_Status


--4
--How many bikes are owned by each station? Schema should be (StationName, TotalBikes)
SELECT b.Station_ID Station_ID, COUNT(*) AS TotalBikes
FROM Bikes b
where b.Station_ID In(Select s.Station_ID From Stations s )
GROUP BY b.Station_ID

--5
--Given the name customers who never rented a bike. Schema is as follow. (CustomerFullName)
SELECT CONCAT(CD.Fname, ' ', CD.Lname) AS CustomerFullName
FROM Customers C
JOIN Customer_Details CD ON C.Customer_ID = CD.Customer_ID
WHERE C.Customer_ID NOT IN (
    SELECT DISTINCT Customer_ID 
    FROM Bike_Rentals);
--6
--Give the bike ids of those bikes who were renter after year 2016.
SELECT Bike_ID
FROM Bike_Rentals
WHERE YEAR(Start_Time) >  '2016';

--7
--Identify the customers who always pay using mastercard. Give the full name of customers.
SELECT CustomerFullName
FROM Customers C
JOIN ( SELECT CONCAT(Fname, ' ' ,Lname) AS CustomerFullName, Customer_ID
	   FROM Customer_Details ) CD
ON C.Customer_ID = CD.Customer_ID
WHERE C.Customer_ID IN (SELECT P.Customer_ID
						FROM Payments P
						WHERE P.Method_ID IN (SELECT M.Method_ID
											  FROM Payment_Method M
											  WHERE M.Method = 'mastercard'))
--8
--For which station (Station Name) the most bikes are moved using vans in year 2015.
--SELECT S.Location
--FROM Stations S
--JOIN (SELECT SUM(Bikes) AS bikes, Station_ID
--	  FROM Vans
--	  GROUP BY Station_ID ) V
--ON S.Station_ID = V.Station_ID
--ORDER BY bikes DESC

--10
--Give the BikeIds which were repaired in at least 3 year.



--Task2
use northwind

--1
--Give the names of customers whose orders were delayed. Your answer should have the following schema.
SELECT CustomerID,ContactName 
FROM Customers
WHERE CustomerId IN (SELECT CustomerId FROM Orders WHERE ShippedDate > RequiredDate)

--2
--Give the products details with its supplier company.Products(ProductName, SupplierName)
SELECT ProductName, CompanyName
FROM Products
INNER JOIN Suppliers ON Products.SupplierId = Suppliers.SupplierId

--3
--Give the name of top products which have highest sale in the year 1998.
SELECT Top 1 ProductName
FROM Products
WHERE ProductId IN (
    SELECT ProductId
    FROM [Order Details]
    WHERE OrderId IN (
        SELECT OrderId
        FROM Orders
        WHERE YEAR(OrderDate) = 1998
    )
GROUP BY ProductId)

--4
--Give the name of employees with its manager name. Schema should have the following schema. (EmployeeName, ManagerName)
SELECT e.FirstName+e.LastName, m.FirstName+m.LastName AS ManagerName
FROM Employees e
INNER JOIN Employees m ON e.ReportsTo = m.EmployeeId

--5
--Give the full names of managers who have less than two employees.
SELECT CONCAT(FirstName, ' ', LastName) AS ManagerName
FROM Employees
WHERE EmployeeId IN (
    SELECT ReportsTo
    FROM Employees
    GROUP BY ReportsTo
    HAVING COUNT(*) < 2)
--6
--List all the products whose price is more than average price.
SELECT ProductName
FROM Products
WHERE UnitPrice > (
    SELECT AVG(UnitPrice) FROM Products)