--1. Вывести ко-во поставщиков не из UK и не из China
SELECT
COUNT(*) AS total_suppliers
FROM Suppliers
WHERE
	NOT Country IN ("UK" ,"China")

--2.Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5
SELECT
avg(Price) AS avg_price,
max(Price)AS max_price,
min(Price)AS min_price
FROM Products
Where
	CategoryID IN (3, 5)

--3. Вывести общую сумму проданных товаров
SELECT
Count(*) as total_orderDetails
FROM OrderDetails;

--4. Вывести данные о заказах (номерзаказа, имяклиента, странаклиента, фамилияменеджера, названиекомпанииперевозчика)
SELECT
Orders.OrderID,
Customers.CustomerName,
Customers.Country AS country_customer,
Employees.LastName AS Last_name_of_employee,
Shippers.ShipperName
FROM Orders
Join Customers on Customers.CustomerID = Orders.CustomerID
Join Employees on Employees.EmployeeID = Orders.EmployeeID
Join Shippers on Shippers.ShipperID = Orders.ShipperID

--5. Вывести сумму, на которую было отправлено товаров клиентам в Germany
SELECT
SUM(Price) AS sum_orderDetails_in_Germany
FROM OrderDetails
JOIN Orders ON Orders.OrderID = OrderDetails.OrderID
JOIN Products ON Products.ProductID = OrderDetails.ProductID
JOIN Customers ON Customers.CustomerID = Orders.CustomerID
Where
 Customers.Country = "Germany"
