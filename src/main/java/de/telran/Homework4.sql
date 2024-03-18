--1. Вывести данные о товарах (проекция: названиетовара, цена, названиекатегории, названиекомпаниипоставщика)
SELECT
Products.ProductName,
Products.Price,
Categories.CategoryName,
Suppliers.SupplierName
FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID

--2. Вывести заказы клиентов не из France  (номерзаказа, имяклиента, страна_клиента)
SELECT
Orders.OrderID,
Customers.CustomerName,
Customers.Country
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
	Country != 'France'

--3. Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT
Products.ProductName AS ProductName_most_expensive_item,
Products.Price*1.09 AS Price_in_USD
FROM OrderDetails
JOIN Products ON Products.ProductID = OrderDetails.ProductID
    ORDER BY Price DESC
    LIMIT 1

--4. Вывести список стран, которые поставляют морепродукты
SELECT DISTINCT
Suppliers.Country
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
JOIN Categories ON Products.CategoryID = Categories.CategoryID
where
	CategoryName = "Seafood"



--5. Вывести два самых дорогих товара из категории Beverages из USA
SELECT *
FROM Products
JOIN Categories ON Categories.CategoryID = Products.CategoryID
JOIN Suppliers ON Suppliers.SupplierID = Products.SupplierID
WHERE
	CategoryName = "Beverages"
    AND
    Country = "USA"
	ORDER BY Price DESC
    LIMIT 2