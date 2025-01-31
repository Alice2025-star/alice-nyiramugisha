create database TourTravelDB;

create user 'Alice'@'127.0.0.1' identified by '2405000674';
grant all privileges on TourTravelDB .* to 'Alice'@'127.0.0.1';

flush privileges; 


use TourTravelDB;
-- users Table
create table users(user_id int auto_increment primary key,
name varchar(100) not null,
email varchar(100) not null,
password varchar(255) not null,
phone varchar(20));

-- tour package Table
create table tourpackages(package_id int auto_increment primary key,
tittle varchar(255) not null,
description TEXT,
price DECIMAL(10,2) not null);

drop table users;
drop table tourpackages;



-- SQL
-- Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    Address VARCHAR(255));



-- TourPackage Table
CREATE TABLE TourPackage (
    PackageID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Duration INT,  -- Number of days
    Price DECIMAL(10, 2));
   


-- Destination Table
CREATE TABLE Destination (
    DestinationID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Country VARCHAR(255),
    Description TEXT);
 


-- Hotel Table
CREATE TABLE Hotel (
    HotelID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    Stars INT,
    Contact VARCHAR(255));
 


-- Flight Table
CREATE TABLE Flight (
    FlightID INT PRIMARY KEY AUTO_INCREMENT,
    FlightNumber VARCHAR(20) NOT NULL,
    Airline VARCHAR(255),
    DepartureDate DATE,
    DepartureTime TIME,
    ArrivalDate DATE,
    ArrivalTime TIME);
  

-- Transport Table
CREATE TABLE Transport (
    TransportID INT PRIMARY KEY AUTO_INCREMENT,
    Type VARCHAR(255) NOT NULL,  -- e.g., Bus, Train, Car
    VehicleNumber VARCHAR(20),
    DriverName VARCHAR(255));
 


-- Activity Table
CREATE TABLE Activity (
    ActivityID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2));
   
-- Booking Table

show tables;

-- PackageDestination (Junction Table)
CREATE TABLE PackageDestination (
    PackageID INT NOT NULL,
    DestinationID INT NOT NULL,
    PRIMARY KEY (PackageID, DestinationID), -- Composite Key
    FOREIGN KEY (PackageID) REFERENCES TourPackage(PackageID),
    FOREIGN KEY (DestinationID) REFERENCES Destination(DestinationID)
);

-- PackageHotel (Junction Table)
CREATE TABLE PackageHotel (
    PackageID INT NOT NULL,
    HotelID INT NOT NULL,
    PRIMARY KEY (PackageID, HotelID), -- Composite Key
    FOREIGN KEY (PackageID) REFERENCES TourPackage(PackageID),
    FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID)
);

-- PackageFlight (Junction Table)
CREATE TABLE PackageFlight (
    PackageID INT NOT NULL,
    FlightID INT NOT NULL,
    PRIMARY KEY (PackageID, FlightID), -- Composite Key
    FOREIGN KEY (PackageID) REFERENCES TourPackage(PackageID),
    FOREIGN KEY (FlightID) REFERENCES Flight(FlightID)
);

-- PackageTransport (Junction Table)
CREATE TABLE PackageTransport (
    PackageID INT NOT NULL,
    TransportID INT NOT NULL,
    PRIMARY KEY (PackageID, TransportID), -- Composite Key
    FOREIGN KEY (PackageID) REFERENCES TourPackage(PackageID),
    FOREIGN KEY (TransportID) REFERENCES Transport(TransportID)
);

-- PackageActivity (Junction Table)
CREATE TABLE PackageActivity (
    PackageID INT NOT NULL,
    ActivityID INT NOT NULL,
    PRIMARY KEY (PackageID, ActivityID), -- Composite Key
    FOREIGN KEY (PackageID) REFERENCES TourPackage(PackageID),
    FOREIGN KEY (ActivityID) REFERENCES Activity(ActivityID));
    -- insert into users
    
    
 INSERT INTO Users (user_id,name, email,password,phone)
VALUES (1, 'johndoe', 'John.doe@example.com','password123',078849476);

INSERT INTO tourpackages(package_id,tittle,description,price)
values(1,'enchating europe','this is tour is fantastic',999.00);

INSERT INTO Customer (
    CustomerID,name,email,phone,address)
  values(2,'Alice','Alice34@gmail.com',078563535,'Musanze');



INSERT INTO Destination (destinationID, name,country, description)
VALUES (1, 'kalisa', 'rwanda','a tour of europe'),
       (1,'anitha', 'burundi','a tour of canada');


INSERT INTO Hotel (hotel_id, hotel_name, address, rating)
VALUES (1, 'Hotel Ritz', '15 Place Vendôme', 5),
       (2, 'Park Hyatt Tokyo', '3-7-1 Nishishinjuku', 


INSERT INTO Flight (departure_city, arrival_city, airline, flight_number)
VALUES ('New York', 'Paris', 'Air France', 'AF001'),
       ('London', 'Tokyo', 'Japan Airlines', 'JL002');


INSERT INTO Transport (transport_type, company)
VALUES ('Train', 'SNCF'),
       ('Bus', 'Japan Bus Lines');


INSERT INTO Activity (destination_id, activity_name, description)
VALUES (1, 'Eiffel Tower Visit', 'Visit the iconic Eiffel Tower'),  -- Paris is destination_id 1
       (2, 'Sushi Making Class', 'Learn to make sushi'); -- Tokyo is destination_id 2


INSERT INTO Package (package_name, description, price)
VALUES ('European Delight', 'A tour of Europe', 2999.00),
       ('Japan Explorer', 'Explore Japan', 2499.00);


INSERT INTO Booking (customer_id, package_id, booking_date, number_of_travelers)
VALUES (1, 1, '2024-10-15', 2),  -- Alice booked European Delight
       (2, 2, '2025-02-20', 1);  -- Bob booked Japan Explorer



INSERT INTO PackageDestination (packageID, destinationID)
VALUES (1, 1), 
       (2, 2);  
       
       UPDATE Customer
SET email = 'new_email@example.com'
WHERE customerID = 1;

UPDATE Destination
SET description = 'The most romantic city in the world!'
WHERE destinationID = 1;


UPDATE Hotel
SET rating = 4
WHERE hotelID = 2;

UPDATE Flight
SET airline = 'British Airways'
WHERE flightID = 1;

UPDATE Transport
SET company = 'New bland'
WHERE transportID = 1;

UPDATE Transport
SET transport_type = 'Car'
WHERE transportID= 1;

UPDATE Activity
SET description = 'A guided tour of the Eiffel Tower'
WHERE activityID = 1;

UPDATE Package
SET price ='3499.00'
WHERE packageID = 1;

UPDATE Booking
SET number_of_travelers = 3
WHERE bookingID = 1;

UPDATE Booking
SET booking_date = '2024-11-01'
WHERE bookingID = 1;

DELETE FROM Customer
WHERE customerID = 1; 

DELETE FROM Destination
WHERE destinationID= 1;

DELETE FROM Hotel
WHERE hotelID = 2; 

DELETE FROM Flight
WHERE flightID = 1;

DELETE FROM Transport
WHERE transportID= 1;

DELETE FROM Activity
WHERE activityID = 1;

DELETE FROM Booking
WHERE bookingID = 1;

DELETE FROM Package
WHERE packageID = 1;

-- View 1: Customer Bookings
CREATE VIEW CustomerBookings AS
SELECT c.CustomerID, c.Name, c.Email, b.BookingID, tp.Name AS PackageName, b.BookingDate
FROM Customer c
JOIN Booking b ON c.CustomerID = b.CustomerID
JOIN TourPackage tp ON b.PackageID = tp.PackageID;

-- View 2: Package Destinations
CREATE VIEW PackageDestinations AS
SELECT tp.PackageID, tp.Name AS PackageName, d.DestinationID, d.Name AS DestinationName, d.Country
FROM TourPackage tp
JOIN PackageDestination pd ON tp.PackageID = pd.PackageID
JOIN Destination d ON pd.DestinationID = d.DestinationID;

-- View 3: Hotel Details by Destination
CREATE VIEW HotelDestinations AS
SELECT d.DestinationID, d.Name AS DestinationName, h.HotelID, h.Name AS HotelName, h.Stars
FROM Destination d
JOIN Hotel h ON d.DestinationID = h.DestinationID;

-- View 4: Available Activities by Destination
CREATE VIEW DestinationActivities AS
SELECT d.DestinationID, d.Name AS DestinationName, a.ActivityID, a.Name AS ActivityName, a.Price
FROM Destination d
JOIN Activity a ON d.DestinationID = a.DestinationID;

-- View 5: Booking Summary with Customer and Package Details
CREATE VIEW BookingSummary AS
SELECT b.BookingID, c.Name AS CustomerName, tp.Name AS PackageName, b.BookingDate, b.NumberOfTravelers, b.TotalPrice
FROM Booking b
JOIN Customer c ON b.CustomerID = c.CustomerID
JOIN TourPackage tp ON b.PackageID = tp.PackageID;

-- Procedures


-- 2. Update Customer Address
DELIMITER //
CREATE PROCEDURE UpdateCustomerAddress (
    IN p_customerID INT,
    IN p_address VARCHAR(255)
)
BEGIN
    UPDATE Customer
    SET Address = p_address
    WHERE CustomerID = p_customerID;
END //
DELIMITER ;

-- 3. Get Destination Details
DELIMITER //
CREATE PROCEDURE GetDestinationDetails (
    IN p_destinationID INT
)
BEGIN
    SELECT * FROM Destination WHERE DestinationID = p_destinationID;
END //
DELIMITER ;

-- 4. Add Package to Destination
DELIMITER //
CREATE PROCEDURE AddPackageToDestination (
    IN p_packageID INT,
    IN p_destinationID INT
)
BEGIN
    INSERT INTO PackageDestination (PackageID, DestinationID)
    VALUES (p_packageID, p_destinationID);
END //
DELIMITER ;

-- 5. Calculate Total Booking Price
DELIMITER //
CREATE PROCEDURE CalculateTotalBookingPrice (
    IN p_bookingID INT,
    OUT p_totalPrice DECIMAL(10, 2)
)
BEGIN
    SELECT tp.Price * b.NumberOfTravelers INTO p_totalPrice
    FROM Booking b
    JOIN TourPackage tp ON b.PackageID = tp.PackageID
    WHERE b.BookingID = p_bookingID;
END //
DELIMITER ;


-- Triggers

-- 1. Before Inserting a Booking, Check Package Availability (Example)
DELIMITER //
CREATE TRIGGER BeforeBookingInsert
BEFORE INSERT ON Booking
FOR EACH ROW
BEGIN
    -- You would add more complex logic here to check if the package has available slots, etc.
    -- For this example, a simple check:
    IF NEW.NumberOfTravelers <= 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid number of travelers.';
    END IF;
END //
DELIMITER ;

-- 3. Before Deleting a Destination, Delete Related PackageDestinations
DELIMITER //
CREATE TRIGGER BeforeDestinationDelete
BEFORE DELETE ON Destination
FOR EACH ROW
BEGIN
    DELETE FROM PackageDestination WHERE DestinationID = OLD.DestinationID;
END //
DELIMITER ;

-- 4. After Updating a Package Price, Update Related Bookings (If Needed)
DELIMITER //
CREATE TRIGGER AfterPackagePriceUpdate
AFTER UPDATE ON TourPackage
FOR EACH ROW
BEGIN
    -- If you want to automatically update the TotalPrice in Bookings when the Package Price changes:
    UPDATE Booking
    SET TotalPrice = NEW.Price * NumberOfTravelers
    WHERE PackageID = NEW.PackageID;
END //
DELIMITER ;

-- 5. Before Inserting into PackageDestination, Check if Package and Destination Exist
DELIMITER //
CREATE TRIGGER BeforePackageDestinationInsert
BEFORE INSERT ON PackageDestination
FOR EACH ROW
BEGIN
    IF NOT EXISTS (SELECT 1 FROM TourPackage WHERE PackageID = NEW.PackageID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Package does not exist.';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM Destination WHERE DestinationID = NEW.DestinationID) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Destination does not exist.';
    END IF;
END //
DELIMITER ;

CALL AddNewCustomer('Charlie Brown', 'charlie.b@example.com', '555-111-1111', '123 Main St');
CALL UpdateCustomerAddress(1, 'New Address');
CALL GetDestinationDetails(1);

SET @total_price = 0;  -- Declare an output variable
SELECT @total_price;   -- View the result

