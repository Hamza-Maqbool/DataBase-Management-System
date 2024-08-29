SELECT Products.ProductName From Products
where Products.UnitPrice > (Select AVG(Products.UnitPrice) from Products);


SELECT OrderID From Orders
Order by ShippedDate;

Select Country from Suppliers
Group BY Country
Having count(*) >=2;

Select MONTH(ShippedDate) AS Month, DateDiff(day,RequiredDate,ShippedDate) AS OrderDelayed 
FROM Orders 
Where RequiredDate < ShippedDate;

Select OrderID , Discount From [Order Details]
where Discount > 0;

Select Count(OrderID) AS [Numbers of Orders] , Shipcity from Orders
Where ShipCountry = 'USA' AND YEAR(ShippedDate) = 1997
Group bY ShipCity;

Select ShipCountry AS Country, Count(DateDiff(day,RequiredDate,ShippedDate)) AS OrderDelayed 
FROM Orders
Where RequiredDate < ShippedDate
GROUP BY ShipCountry;

Select OrderID,UnitPrice,Discount From [Order Details]
Where Discount > 0;

SELECT  ShipRegion
  ShipCity, 
  COUNT(OrderID) AS Number_of_Orders
FROM Orders
WHERE YEAR(ShippedDate) = 1997
GROUP BY ShipRegion,ShipCity;