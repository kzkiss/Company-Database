DROP TABLE AvailableStock CASCADE CONSTRAINTS;
DROP TABLE OrderDetails CASCADE CONSTRAINTS;
DROP TABLE WeeklyHours CASCADE CONSTRAINTS;
DROP TABLE Warehouses CASCADE CONSTRAINTS;
DROP TABLE Products CASCADE CONSTRAINTS;
DROP TABLE Orders CASCADE CONSTRAINTS;
DROP TABLE Customers CASCADE CONSTRAINTS;
DROP TABLE Dependents CASCADE CONSTRAINTS;
DROP TABLE Employees CASCADE CONSTRAINTS;
DROP TABLE Projects CASCADE CONSTRAINTS;
DROP TABLE Locations CASCADE CONSTRAINTS;
DROP TABLE Departments CASCADE CONSTRAINTS;

CREATE TABLE Departments
   (department_id NUMBER PRIMARY KEY, 
    department_name VARCHAR2(50),
    manager_id NUMBER
   );

CREATE TABLE Locations
   (location_id NUMBER PRIMARY KEY,
    location_name VARCHAR2(50) NOT NULL,
    address_line_1 VARCHAR2(50) NOT NULL,
    address_line_2 VARCHAR2(50),
    town VARCHAR2(50) NOT NULL,
    postcode VARCHAR2(10) NOT NULL,
    department_id NUMBER,
    CONSTRAINT FK_locations_department_id FOREIGN KEY (department_id) REFERENCES Departments(department_id)
   );

CREATE TABLE Projects
   (project_id NUMBER PRIMARY KEY,
    project_name VARCHAR2(100) NOT NULL,
    location_id NUMBER,
    department_id NUMBER,
    CONSTRAINT FK_location_id FOREIGN KEY (location_id) REFERENCES Locations(location_id),
    CONSTRAINT FK_projects_department_id FOREIGN KEY (department_id) REFERENCES Departments(department_id)
   );

CREATE TABLE Employees
   (employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    middle_name VARCHAR2(50),
    last_name VARCHAR2(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    ni_number VARCHAR2(9) NOT NULL,
    department_id NUMBER,
    address_line_1 VARCHAR2(50) NOT NULL,
    address_line_2 VARCHAR2(50),
    town VARCHAR2(50) NOT NULL,
    postcode VARCHAR2(10) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    phone VARCHAR2(25) NOT NULL,
    landline_or_mobile VARCHAR2(10) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    supervisor_id NUMBER,
    is_manager VARCHAR2(3) NOT NULL,
    manager_start_date DATE,
    manager_end_date DATE,
    salary NUMBER,
    CONSTRAINT FK_employees_department_id FOREIGN KEY (department_id) REFERENCES Departments(department_id),
    CONSTRAINT FK_employees_supervisor_id FOREIGN KEY (supervisor_id) REFERENCES Employees(employee_id) ON DELETE SET NULL,
    CONSTRAINT check_landline_or_mobile CHECK (landline_or_mobile IN ('Landline','L','Mobile','M')),
    CONSTRAINT check_is_manager CHECK (is_manager IN ('Yes','No'))
   );

ALTER TABLE Departments
ADD CONSTRAINT FK_departments_manager_id FOREIGN KEY (manager_id) REFERENCES Employees(employee_id);

CREATE TABLE Dependents
   (dependent_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    date_of_birth DATE,
    relationship VARCHAR2(25) NOT NULL,
    employee_id NUMBER,
    CONSTRAINT FK_dependents_employee_id FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
   );

CREATE TABLE Customers
   (customer_id	NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    middle_name VARCHAR2(50),
    last_name VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    phone VARCHAR2(25) NOT NULL,
    address_line_1 VARCHAR2(50) NOT NULL,
    address_line_2 VARCHAR2(50),
    town VARCHAR2(50) NOT NULL,
    postcode VARCHAR2(10) NOT NULL,
    is_billing_address_same VARCHAR2(3) NOT NULL,
    billing_address_line_1 VARCHAR2(50),
    billing_address_line_2 VARCHAR2(50),
    billing_town VARCHAR2(50),
    billing_postcode VARCHAR2(10),
    salesperson_assigned NUMBER,
    CONSTRAINT FK_customers_employee_id FOREIGN KEY (salesperson_assigned) REFERENCES Employees(employee_id),
    CONSTRAINT check_is_billing_address_same CHECK (is_billing_address_same IN ('Yes','No'))
   );

CREATE TABLE Orders 
   (order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    order_date DATE NOT NULL,
    order_status VARCHAR2(25) NOT NULL,
    shipment_date DATE,
    CONSTRAINT FK_orders_customer_id FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT check_order_status CHECK (order_status IN ('Not dispatched','Dispatched','Completed'))
   );

CREATE TABLE Products
   (product_id	NUMBER PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    price NUMBER NOT NULL
   );

CREATE TABLE Warehouses
   (warehouse_id NUMBER PRIMARY KEY,
    warehouse_name VARCHAR2(100) NOT NULL,
    address_line_1 VARCHAR2(50) NOT NULL,
    address_line_2 VARCHAR2(50),
    town VARCHAR2(50) NOT NULL,
    postcode VARCHAR2(10) NOT NULL
   );

CREATE TABLE WeeklyHours
   (employee_id REFERENCES Employees(employee_id),
    project_id REFERENCES Projects(project_id),
    number_of_hours NUMBER NOT NULL,
    CONSTRAINT WeeklyHours_PK PRIMARY KEY (employee_id, project_id)
   );

CREATE TABLE OrderDetails
   (order_id REFERENCES Orders(order_id),
    product_id REFERENCES Products(product_id),
    amount_ordered NUMBER NOT NULL,
    CONSTRAINT OrderDetails_PK PRIMARY KEY (order_id, product_id)
   );

CREATE TABLE AvailableStock
   (product_id	REFERENCES Products(product_id),
    warehouse_id REFERENCES Warehouses(warehouse_id),
    amount_available NUMBER NOT NULL,
    CONSTRAINT AvailableStock_PK PRIMARY KEY (product_id, warehouse_id)
   );










