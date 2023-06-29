
-- use little_lemondb
use little_lemondb;

-- insert values in the table customers
INSERT INTO Customers (CustomerID, FullName, ContactNumber, Email)
VALUES ("C1", "Laney Fadden", "102-1137", "laney@gmail.com"),  
("C2", "Giacopo Bramich", "002-9013", "glacapo@gmail.com"),  
("C3", "Angel Veschambre", "031-1540", "angel2gmail.com"),  
("C4", "Tasia Fautly", "100-9132", "tasia@gmail.com"),  
("C5", "Merrill Baudon", "900-2310", "merrill@gmail.com"),  
("C6", "Mart Malsher", "321-0192", "mart@gmail.com");


-- insert values in the table menusitems
INSERT INTO MenuItems (MenuItemID, CourseName, StarterName, DessertName)
VALUES ("1", "Bean soup", "Falafel", "Afforgato"),  
("2", "Carbonara", "Faltbread", "Baklava"),  
("3", "Greek Salad", "Hummus", "Chessecake"),  
("4", "Kabasa", "Minestrone", "Greek youghurt"),  
("5", "Pizza", "Olivers", "Ice cream"),  
("6", "MacDonalds", "French Cake", "Youghurt");

-- insert values in the table menus
INSERT INTO Menus (MenuID, MenuItemID, MenuName, Cuisine)
VALUES ("1", "6", "Starters", "Italian"),  
("2", "4", "Main Courses", "Turkish"),  
("3", "1", "Drinks", "ITalian"),  
("4", "5", "Starters", "Greek"),  
("5", "3", "Desserts", "Turkish");


-- insert values in the table orders
INSERT INTO Orders (OrderID, MenuID, CustomerID, TotalCost, Quantity)
VALUES ("1", "2", "C3", 500.10, 2),  
("2", "2", "C1", 250.30, 1),  
("3", "1", "C4", 121.11, 3),  
("4", "3", "C1", 100.07, 2),  
("5", "3", "C4", 800.56, 1),
("6", "1", "C4", 150.31, 2),
("7", "5", "C5", 125.1, 2),
("8", "4", "C6", 100, 5);


-- Task 1 Create procedure GetMaxQuantity
DELIMITER //

CREATE PROCEDURE GetMaxQuantity()
BEGIN
SELECT MAX(Quantity) as MaxQuantity from Orders;
END //

DELIMITER ;

-- call procedure
CALL GetMaxQuantity();



-- Task 2 Create a procedure ManageBooking

DELIMITER //
CREATE PROCEDURE ManageBooking()
BEGIN
SELECT * FROM Orders;
END //
DELIMITER ;

-- call procedure ManageBooking
CALL ManageBooking();


-- Task 3 Create procedure UpdateOrder
DELIMITER //
CREATE PROCEDURE UpdateOrder(IN order_id INT) 
	BEGIN
    UPDATE Orders
    SET TotalCost = 250.0
    WHERE OrderID = order_id;
	END //

DELIMITER ;

-- call procedure UpdateOrder
CALL UpdateOrder(8);

-- Task 4 Create procedure AddBooking/Orders
DELIMITER //
CREATE PROCEDURE  AddBooking()
	BEGIN
	Insert into Orders(OrderID, MenuID, CustomerID, TotalCost, Quantity) 
	VALUES (9, 5, "C5", 230.4, 3), (10, 2, "C1", 330.15, 3);
	END //

DELIMITER ;

-- Call procedure AddBooking
CALL AddBooking();

-- Task 5 Create a Procedure CancelOrders

DELIMITER //
Create procedure CancelOrder(IN order_id INT)
BEGIN
DELETE FROM Orders
WHERE OrderID = order_id;
END//

DELIMITER ;

-- Call procedure Cnacel Order
call CancelOrder(5);

