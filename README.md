
CREATE TABLE person (
    person_id INT NOT NULL,
    name VARCHAR(20),
    PRIMARY KEY (person_id)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_number INT NOT NULL,
    person_id INT,
    FOREIGN KEY (person_id) REFERENCES person(person_id)
);

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

SELECT ProductID, ProductName, CategoryName
FROM Products
INNER JOIN Categories ON Products.CategoryID = Categories.CategoryID;


SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;


SELECT Shippers.ShipperName, COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID
GROUP BY ShipperName;

history | grep mysql

