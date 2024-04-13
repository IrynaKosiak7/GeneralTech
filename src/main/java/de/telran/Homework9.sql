--1-Вывести компании-перевозчиков, которые доставили клиентам более 250 заказов (проекция: название_компании, ко-во заказов)
SELECT
Shippers.ShipperName,
COUNT(*) as total_order
FROM Orders
JOIN Shippers ON Shippers.ShipperID = Orders.ShipperID
GROUP BY Shippers.ShipperID
HAVING
 total_order > 250

--2-Вывести заказы, где ко-во товаров 3 и более (проекция: номерзаказа, ко-вотовароввзаказе)
SELECT
OrderID,
Count(*) as total_order
FROM OrderDetails
GROUP BY OrderID
having
total_order >= 3


--3-Вывести минимальную стоимость товара для каждой категории, кроме категории 2 (проекция: названиекатегории, минстоимость_товара)
SELECT
Categories.CategoryName,
MIN(Products.Price) as min_price
FROM OrderDetails
JOIN Products ON Products.ProductID = OrderDetails.ProductID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY Products.CategoryID
having
 not Products.CategoryID = 2

--4-Вывести менеджера, который находится на 4 месте по ко-ву созданных заказов (проекция: фамилияменеджера, к-восозданных_заказов)
SELECT
Employees.LastName,
count(*) as quality_orders
FROM Orders
JOIN Employees ON Employees.EmployeeID = Orders.EmployeeID
Group BY Orders.EmployeeID
order by quality_orders desc
LIMIT 3,1

--5-Вывести данные о товарах от поставщиков 4 и 8 (проекция: все имеющиеся поля, цена со скидкой 1.5 процента, цена с наценкой 0.5процента)
SELECT *,
Products.Price - Products.Price * 0.015 as price_down,
Products.Price*1.005 as price_up
FROM Products
WHERE
SupplierID = 4
OR
SupplierID = 8

