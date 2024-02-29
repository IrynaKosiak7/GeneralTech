--Задача 1. Вывести данные о товарах (название, цена со скидкой в 0.5%).
SELECT
ProductName,
Price*.5 AS Price_down
FROM Products


--Задача 2. Вывести самый дорогой товар в диапазоне от 1 до 100 EUR.
SELECT *
FROM Products
WHERE
 Price BETWEEN 1 AND 100
 ORDER BY Price DESC
 LIMIT 1


--Задача 3. Вывести два самых дешевых товара из категории 4.
SELECT *
FROM Products
WHERE
CategoryID = 4
ORDER BY Price ASC
LIMIT 4


--Задача 4. Вывести один товар, который находится на пятом месте среди самых дорогих.
SELECT *
FROM Products
ORDER BY Price DESC
LIMIT 1 OFFSET 4


--Задача 5. Вывести товары, названия которых заканчиваются на букву a
SELECT *
FROM Products
WHERE
ProductName LIKE '%%a'
