CREATE TABLE IF NOT EXISTS `Department` (
	`department_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`departament_name` varchar(255) NOT NULL,
	`location` varchar(255) NOT NULL,
	`manager_id` int NOT NULL,
	PRIMARY KEY (`department_id`)
);

CREATE TABLE IF NOT EXISTS `employee` (
	`employee_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`manager_id` int NOT NULL,
	`hire_date` varchar(255) NOT NULL,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`position` varchar(255) NOT NULL,
	`salary` varchar(255) NOT NULL,
	`phone_number` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`departament_id` int NOT NULL,
	PRIMARY KEY (`employee_id`)
);

CREATE TABLE IF NOT EXISTS `order` (
	`order_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`shipping_address` varchar(255) NOT NULL,
	`employee_id` int NOT NULL,
	`order_date` varchar(255) NOT NULL,
	`shipping_date` varchar(255) NOT NULL,
	`payment_method` varchar(255) NOT NULL,
	`status` varchar(255) NOT NULL,
	`total_amount` varchar(255) NOT NULL,
	`customer_id` int NOT NULL,
	PRIMARY KEY (`order_id`)
);

CREATE TABLE IF NOT EXISTS `order_detail` (
	`Order_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`OrderDetailid` int NOT NULL,
	`ProductID` int NOT NULL,
	`Quantity` varchar(255) NOT NULL,
	`UnitPrice` varchar(255) NOT NULL,
	PRIMARY KEY (`Order_id`)
);

CREATE TABLE IF NOT EXISTS `customer` (
	`customer_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`address` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`phone_number` varchar(255) NOT NULL,
	`birth_date` varchar(255) NOT NULL,
	`registration_date` varchar(255) NOT NULL,
	`loyalty_points` varchar(255) NOT NULL,
	`discount` varchar(255) NOT NULL,
	PRIMARY KEY (`customer_id`)
);

CREATE TABLE IF NOT EXISTS `Product` (
	`Productid` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Stock` varchar(255) NOT NULL,
	`Name` varchar(255) NOT NULL,
	`CategoryID` int NOT NULL,
	`Price` varchar(255) NOT NULL,
	PRIMARY KEY (`Productid`)
);

CREATE TABLE IF NOT EXISTS `Category` (
	`CategoryID` int AUTO_INCREMENT NOT NULL UNIQUE,
	`CategoryName` int NOT NULL,
	PRIMARY KEY (`CategoryID`)
);

ALTER TABLE `Department` ADD CONSTRAINT `Department_fk3` FOREIGN KEY (`manager_id`) REFERENCES `employee`(`manager_id`);
ALTER TABLE `employee` ADD CONSTRAINT `employee_fk9` FOREIGN KEY (`departament_id`) REFERENCES `Department`(`department_id`);
ALTER TABLE `order` ADD CONSTRAINT `order_fk2` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`employee_id`);

ALTER TABLE `order` ADD CONSTRAINT `order_fk8` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`customer_id`);
ALTER TABLE `order_detail` ADD CONSTRAINT `order_detail_fk0` FOREIGN KEY (`Order_id`) REFERENCES `order`(`order_id`);

ALTER TABLE `order_detail` ADD CONSTRAINT `order_detail_fk2` FOREIGN KEY (`ProductID`) REFERENCES `Product`(`Productid`);

ALTER TABLE `Product` ADD CONSTRAINT `Product_fk3` FOREIGN KEY (`CategoryID`) REFERENCES `Category`(`CategoryID`);
