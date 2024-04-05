--1. Вывести стоимость заказа 10258
SELECT
SUM(Products.Price * OrderDetails.Quantity) AS total_sum_10258
FROM OrderDetails
JOIN Products ON Products.ProductID = OrderDetails.ProductID
where
OrderID = 10258

--2. Вывести кол/распределение заказов по клиентам (проекция: имяклиента, ко-возаказов)
SELECT
Customers.CustomerName,
COUNT(*) AS total_orders
FROM Orders
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerName

--3. Вывести кол/распределение заказов по менеджерам (проекция: фамилияменеджера, ко-возаказов)
SELECT
Employees.LastName,
COUNT(*) AS total_orders
FROM Orders
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
GROUP BY Employees.LastName

--4. Вывести минимальную стоимость товаров для каждой категории (проекция: названиекатегории, минстоимость_товаров)
SELECT
Categories.CategoryID,
MIN(Price)
FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
GROUP BY Categories.CategoryID

--5. Вывести данные о заказах (проекция: номерзаказа, стоимостьзаказа)
SELECT
OrderDetails.OrderID,
Sum(OrderDetails.Quantity*Products.Price) AS total_price
FROM OrderDetails
JOIN Products ON Products.ProductID = OrderDetails.ProductID
GROUP BY OrderDetails.OrderID

--6. Вывести доход каждого менеджера за весь период, исходя из ставки в 5% от суммы его заказов (проекция: фамилия_менеджера, доход)
SELECT
Employees.LastName,
SUM(OrderDetails.Quantity*Products.Price)*.05  AS  total_income
FROM OrderDetails
JOIN Orders ON OrderDetails.OrderID = Orders.OrderID
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
JOIN Products ON OrderDetails.ProductID = Products.ProductID
GROUP BY Employees.LastName

