Select * from Customers
Select * from Orders


Select * 
From 
Orders,Customers

Select  *
From Orders as t1 ,Orders as t2 



SELECT *
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

SELECT *
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;


SELECT *
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.CustomerID, Orders.OrderDate
FROM Customers
Right JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;


SELECT Customers.CustomerID, Orders.OrderDate
FROM Customers
FULL OUTER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

SELECT Customers.CustomerID, Orders.OrderID, Orders.OrderDate
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerID, Orders.OrderID;


SELECT customers.CustomerID, orders.OrderID, orders.OrderDate
FROM customers
LEFT JOIN orders ON customers.CustomerID = orders.CustomerID
WHERE orders.OrderID IS NULL;


SELECT Customers.CustomerID, Orders.OrderID, Orders.OrderDate
FROM Customers
Left JOIN Orders ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderDate BETWEEN '1997-07-01' AND '1997-07-31'

SELECT customerID, COUNT(*) as totalorders
FROM orders
GROUP BY customerID

select * from Employees;


SELECT EmployeeID, FirstName, LastName
FROM (
    SELECT EmployeeID, FirstName, LastName, 1 as copy_num FROM employees
    UNION ALL
    SELECT EmployeeID, FirstName, LastName, 2 as copy_num FROM employees
    UNION ALL
    SELECT EmployeeID, FirstName, LastName, 3 as copy_num FROM employees
    UNION ALL
    SELECT EmployeeID, FirstName, LastName, 4 as copy_num FROM employees
    UNION ALL
    SELECT EmployeeID, FirstName, LastName, 5 as copy_num FROM employees
) AS copies
ORDER BY EmployeeID, copy_num

Select EmployeeID,BirthDate
FROM Employees
WHERE BirthDate BETWEEN '1996-07-04' AND '1997-08-04';

SELECT e.EmployeeID, d.Date
FROM Employees e
CROSS JOIN (
  SELECT CAST('1996-04-07' AS DATE) AS Date
  UNION ALL
  SELECT DATEADD(DAY, 1, Date) AS Date
  FROM (
    SELECT CAST('1996-04-07' AS DATE) AS Date
    UNION ALL
    SELECT DATEADD(DAY, 1, Date) AS Date
    FROM (
      SELECT CAST('1996-04-07' AS DATE) AS Date
    ) AS StartDate
    WHERE Date < '1997-04-08'
  ) AS Dates
) AS d
ORDER BY e.EmployeeID, d.Date

SELECT
  Customers.CustomerID,
  COUNT(Orders.OrderID) AS TotalOrders,
  SUM([Order Details].Quantity) AS TotalQuantity
FROM
  Customers
  JOIN Orders ON Customers.CustomerID = Orders.CustomerID
  JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID
WHERE
  Customers.Country = 'USA'
GROUP BY
  Customers.CustomerID

SELECT c.CustomerID, c.CompanyName, o.OrderID, o.OrderDate
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID AND o.OrderDate = '1997-07-04'

SELECT e.FirstName AS EmployeeFirstName, e.LastName AS EmployeeLastName,
       e.BirthDate AS EmployeeBirthDate,
       m.FirstName AS ManagerFirstName, m.LastName AS ManagerLastName,
       m.BirthDate AS ManagerBirthDate
FROM Employees e
INNER JOIN Employees m ON e.ReportsTo = m.EmployeeID AND e.BirthDate > m.BirthDate

SELECT CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName,
       DATEDIFF(YEAR, e.BirthDate, GETDATE()) AS Age,
       DATEDIFF(YEAR, m.BirthDate, GETDATE()) AS ManagerAge
FROM Employees e
INNER JOIN Employees m ON e.ReportsTo = m.EmployeeID AND e.BirthDate > m.BirthDate


SELECT p.ProductName, o.OrderDate
FROM Products p
JOIN [Order Details] od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID AND o.OrderDate = '1997-08-08'




