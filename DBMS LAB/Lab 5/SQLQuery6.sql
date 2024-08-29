1. SELECT CustomerId, Customers.ContactName
FROM Customers
WHERE CustomerId IN (
  SELECT CustomerId
  FROM Orders
  WHERE ShippedDate > RequiredDate
);

2. SELECT ProductName, (SELECT CompanyName FROM Suppliers
WHERE Suppliers.SupplierId = Products.SupplierId) AS SupplierName
FROM Products;

4. SELECT FirstName, 
       (SELECT ReportsTo 
        FROM employees 
        WHERE FirstName = e.ReportsTo) AS ManagerName 
FROM employees e;

select * from Employees;



