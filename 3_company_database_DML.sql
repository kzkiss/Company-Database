DELETE FROM AvailableStock;
DELETE FROM OrderDetails;
DELETE FROM WeeklyHours;
DELETE FROM Warehouses;
DELETE FROM Orders;
DELETE FROM Products;
DELETE FROM Customers;
DELETE FROM Dependents;
DELETE FROM Projects;
DELETE FROM Employees;
DELETE FROM Locations;
DELETE FROM Departments;



INSERT ALL
-- ID values for Departments start with 10
    INTO Departments (department_id, department_name, manager_id) VALUES (101, 'HR', NULL)
    INTO Departments (department_id, department_name, manager_id) VALUES (102, 'IT', NULL)
    INTO Departments (department_id, department_name, manager_id) VALUES (103, 'Operations', NULL)
    INTO Departments (department_id, department_name, manager_id) VALUES (104, 'Finance', NULL)
    INTO Departments (department_id, department_name, manager_id) VALUES (105, 'Sales', NULL)
SELECT * FROM dual;

INSERT ALL
-- ID values for Locations start with 20
    INTO Locations (location_id, location_name, address_line_1, address_line_2, town,postcode, department_id) VALUES (201, 'Edinburgh HQ', '1 Castlehill', NULL, 'Edinburgh', 'EH1 2NG', 101)
    INTO Locations (location_id, location_name, address_line_1, address_line_2, town,postcode, department_id) VALUES (202, 'Stirling', '25 Castle Wynd,', NULL, 'Stirling', 'FK8 1EJ', 102)
    INTO Locations (location_id, location_name, address_line_1, address_line_2, town,postcode, department_id) VALUES (203, 'Edinburgh 2', '134 Corstorphine Rd', 'Corstorphine', 'Edinburgh', 'EH12 6TS', 103)
    INTO Locations (location_id, location_name, address_line_1, address_line_2, town,postcode, department_id) VALUES (204, 'Aberdeen', '227 Guild Street', NULL, 'Aberdeen', 'AB11 5RG', 104)
    INTO Locations (location_id, location_name, address_line_1, address_line_2, town,postcode, department_id) VALUES (205, 'Glasgow', '730 Great Western Rd', NULL, 'Glasgow', 'G12 0UE', 105)
SELECT * FROM dual;

INSERT ALL
-- Employee IDs start from 30001
    INTO Employees (
        employee_id,first_name,middle_name,last_name,date_of_birth,ni_number,department_id,address_line_1,address_line_2,town,postcode,email,
        phone,landline_or_mobile,start_date,end_date,supervisor_id,is_manager,manager_start_date,manager_end_date,salary
    ) VALUES (
        30001,'Esta',NULL,'Schuricke',TO_DATE('1/12/1975', 'DD/MM/YYYY'),'IJ567890K',103,'101 Pine Avenue','Flat 5','Blairgowrie','PH10 6LX','eschuricke1@yolasite.com',
        '06761285861','Mobile',TO_DATE('6/7/2015', 'DD/MM/YYYY'),NULL,NULL,'Yes',TO_DATE('6/7/2015', 'DD/MM/YYYY'),NULL,147000)
    INTO Employees (
        employee_id,first_name,middle_name,last_name,date_of_birth,ni_number,department_id,address_line_1,address_line_2,town,postcode,email,
        phone,landline_or_mobile,start_date,end_date,supervisor_id,is_manager,manager_start_date,manager_end_date,salary
    ) VALUES (
        30002,'Bobinette','Almeria','Fealy',TO_DATE('3/6/1984', 'DD/MM/YYYY'),'PS986293J',105,'26 Apple Road','Flat 3-6','Achnasheen','IV22 2EG','afealy1n@cyberchimps.com',
        '02084696946','Landline',TO_DATE('31/7/2015', 'DD/MM/YYYY'),TO_DATE('30/6/2021', 'DD/MM/YYYY'),30001,'Yes',TO_DATE('31/7/2015', 'DD/MM/YYYY'),TO_DATE('30/6/2021', 'DD/MM/YYYY'),76000)
    INTO Employees (
        employee_id,first_name,middle_name,last_name,date_of_birth,ni_number,department_id,address_line_1,address_line_2,town,postcode,email,
        phone,landline_or_mobile,start_date,end_date,supervisor_id,is_manager,manager_start_date,manager_end_date,salary
    ) VALUES (
        30003,'Christy',NULL,'Windless',TO_DATE('11/12/1992', 'DD/MM/YYYY'),'PS986293J',101,'3 Station Road',NULL,'Cannich','IV4 7LP','cwindless17@seesaa.net',
        '02069746439','Landline',TO_DATE('6/7/2015', 'DD/MM/YYYY'),NULL,30001,'No',NULL,NULL,36750)
    INTO Employees (
        employee_id,first_name,middle_name,last_name,date_of_birth,ni_number,department_id,address_line_1,address_line_2,town,postcode,email,
        phone,landline_or_mobile,start_date,end_date,supervisor_id,is_manager,manager_start_date,manager_end_date,salary
    ) VALUES (
        30004,'Seth','Honor','Kirdsch',TO_DATE('28/5/1968', 'DD/MM/YYYY'),'DJ642695T',105,'58 Clarence Road',NULL,'Crianlarich','FK20 8RY','skirdschz@company.com',
        '06889622166','Mobile',TO_DATE('15/9/2019', 'DD/MM/YYYY'),NULL,30002,'No',NULL,NULL,32500)
    INTO Employees (
        employee_id,first_name,middle_name,last_name,date_of_birth,ni_number,department_id,address_line_1,address_line_2,town,postcode,email,
        phone,landline_or_mobile,start_date,end_date,supervisor_id,is_manager,manager_start_date,manager_end_date,salary
    ) VALUES (
        30005,'Maura','Blunsen','de Verson',TO_DATE('26/6/1973', 'DD/MM/YYYY'),'NB959651G',102,'6 Skyline Street',NULL,'Halkirk','KW12 6YB','mdeverson27@aboutads.info',
        '06135847946','Mobile',TO_DATE('16/10/2016', 'DD/MM/YYYY'),NULL,30001,'Yes',TO_DATE('16/10/2016', 'DD/MM/YYYY'),NULL,78750)
SELECT * FROM dual;

INSERT ALL
-- Project ID starts from 40001
    INTO Projects (project_id,project_name,location_id,department_id) VALUES (40001, 'Project Alpha', 201, 103)
    INTO Projects (project_id,project_name,location_id,department_id) VALUES (40002, 'Project Beta', 204, 105)
    INTO Projects (project_id,project_name,location_id,department_id) VALUES (40003, 'Project Gamma', 202, 101)
    INTO Projects (project_id,project_name,location_id,department_id) VALUES (40004, 'Project Delta', 205,102)
    INTO Projects (project_id,project_name,location_id,department_id) VALUES (40005, 'Project Epsilon', 203, 104)
SELECT * FROM dual;

INSERT ALL
-- Project ID starts from 50001
    INTO Dependents (dependent_id,first_name,date_of_birth,relationship,employee_id) VALUES (50001, 'Stanton', TO_DATE('22/6/1999', 'DD/MM/YYYY'),'son',30001)
    INTO Dependents (dependent_id,first_name,date_of_birth,relationship,employee_id) VALUES (50002, 'Donia', TO_DATE('16/5/2008', 'DD/MM/YYYY'),'daughter',30001)
    INTO Dependents (dependent_id,first_name,date_of_birth,relationship,employee_id) VALUES (50003, 'Emmalynn', TO_DATE('2/2/2012', 'DD/MM/YYYY'),'daughter',30004)
    INTO Dependents (dependent_id,first_name,date_of_birth,relationship,employee_id) VALUES (50004, 'Darnall', TO_DATE('9/12/2022', 'DD/MM/YYYY'),'son',30005)
    INTO Dependents (dependent_id,first_name,date_of_birth,relationship,employee_id) VALUES (50005, 'Freida', TO_DATE('28/10/2016', 'DD/MM/YYYY'),'daughter',30004)
SELECT * FROM dual;

INSERT ALL
-- Project ID starts from 50001
    INTO Customers (
        customer_id,first_name,middle_name,last_name,email,phone,address_line_1,address_line_2,town,postcode,is_billing_address_same,
    billing_address_line_1,billing_address_line_2,billing_town,billing_postcode,salesperson_assigned
    ) VALUES (50001,'Dasi',NULL,'Pedroli','dpedroli2n@squidoo.com',06846465165,'64 College Street','Auchtermuchty','Cupar','KY14 7DY','Yes',
    NULL,NULL,NULL,NULL,30003)
    INTO Customers (
        customer_id,first_name,middle_name,last_name,email,phone,address_line_1,address_line_2,town,postcode,is_billing_address_same,
    billing_address_line_1,billing_address_line_2,billing_town,billing_postcode,salesperson_assigned
    ) VALUES (50002,'Jacky',NULL,'Cowins','jcowins33@answers.com',06943895852,'21 School Road',NULL,'Elgin','IV30 1EF','No',
    '3 George Square',NULL,'St Andrews','KY16 9JK',30003)
    INTO Customers (
        customer_id,first_name,middle_name,last_name,email,phone,address_line_1,address_line_2,town,postcode,is_billing_address_same,
    billing_address_line_1,billing_address_line_2,billing_town,billing_postcode,salesperson_assigned
    ) VALUES (50003,'Filberto','Billie','Mayall','fmayall2w@company.com',06846469765,'144 River Court',NULL,'Bridge of Orchy','PA36 4AD','Yes',
    NULL,NULL,NULL,NULL,30005)
    INTO Customers (
        customer_id,first_name,middle_name,last_name,email,phone,address_line_1,address_line_2,town,postcode,is_billing_address_same,
    billing_address_line_1,billing_address_line_2,billing_town,billing_postcode,salesperson_assigned
    ) VALUES (50004,'Lynsey','Fealy','Ewence','lewence1l@wsj.com',069965643316,'64 King Street','Flat 6-6','Lerwick','ZE1 0NP','Yes',
    NULL,NULL,NULL,NULL,30003)
    INTO Customers (
        customer_id,first_name,middle_name,last_name,email,phone,address_line_1,address_line_2,town,postcode,is_billing_address_same,
    billing_address_line_1,billing_address_line_2,billing_town,billing_postcode,salesperson_assigned
    ) VALUES (50005,'Hilary',NULL,'Pley','hpley1y@washingtonpost.com',06846465164,'197 Woodland Road',NULL,'Dumfries','DG1 2GH','No',
    '4 Main Street','Flat 5','Peebles','EH45 8ST',30003)
SELECT * FROM dual;

INSERT ALL
-- product ID starts from 60001
    INTO Products (product_id,product_name,price) VALUES (60001,'Pro Cordless Drill', 79.99)
    INTO Products (product_id,product_name,price) VALUES (60002,'Impact Driver', 14.50)
    INTO Products (product_id,product_name,price) VALUES (60003,'Adjustable Wrench', 12.99)
    INTO Products (product_id,product_name,price) VALUES (60004,'Circular Saw', 149.99)
    INTO Products (product_id,product_name,price) VALUES (60005,'Spirit Level (600mm)', 9.99)
SELECT * FROM dual;

INSERT ALL
-- warehouse IDs start from 70001
    INTO Orders (order_id,customer_id,order_date,order_status,shipment_date) VALUES (70001,50005,TO_DATE('2/2/2025','DD/MM/YYYY'),'Completed',TO_DATE('26/2/2025','DD/MM/YYYY'))
    INTO Orders (order_id,customer_id,order_date,order_status,shipment_date) VALUES (70002,50002,TO_DATE('17/3/2025','DD/MM/YYYY'),'Dispatched',TO_DATE('18/5/2025','DD/MM/YYYY'))
    INTO Orders (order_id,customer_id,order_date,order_status,shipment_date) VALUES (70003,50004,TO_DATE('9/6/2025','DD/MM/YYYY'),'Not dispatched',NULL)
    INTO Orders (order_id,customer_id,order_date,order_status,shipment_date) VALUES (70004,50003,TO_DATE('12/7/2025','DD/MM/YYYY'),'Completed',TO_DATE('1/8/2025','DD/MM/YYYY'))
    INTO Orders (order_id,customer_id,order_date,order_status,shipment_date) VALUES (70005,50001,TO_DATE('8/8/2025','DD/MM/YYYY'),'Not dispatched',NULL)
SELECT * FROM dual;

INSERT ALL
-- warehouse IDs start from 80001
    INTO Warehouses (warehouse_id,warehouse_name,address_line_1,address_line_2,town,postcode) VALUES (80001,'Tain WH','93 Cranberry Avenue','Goodtrees Industrial Estate','Tain','IV19 1AB')
    INTO Warehouses (warehouse_id,warehouse_name,address_line_1,address_line_2,town,postcode) VALUES (80002,'Peebles WH','129 Little France Crescent',NULL,'Peebles','EH45 8DL')
    INTO Warehouses (warehouse_id,warehouse_name,address_line_1,address_line_2,town,postcode) VALUES (80003,'Invergordon WH','2 Greyfriars Road', NULL,'Invergordon','IV18 0AG')
    INTO Warehouses (warehouse_id,warehouse_name,address_line_1,address_line_2,town,postcode) VALUES (80004,'Alford WH','98 College Street',NULL,'Alford','AB33 8XX')
    INTO Warehouses (warehouse_id,warehouse_name,address_line_1,address_line_2,town,postcode) VALUES (80005,'Annan WH','16 Quarry Street','Unit 6','Annan','DG12 6BT')
SELECT * FROM dual;

INSERT ALL
    INTO WeeklyHours (employee_id,project_id,number_of_hours) VALUES (30001,40003,3)
    INTO WeeklyHours (employee_id,project_id,number_of_hours) VALUES (30005,40005,10)
    INTO WeeklyHours (employee_id,project_id,number_of_hours) VALUES (30001,40001,16)
    INTO WeeklyHours (employee_id,project_id,number_of_hours) VALUES (30003,40003,13)
    INTO WeeklyHours (employee_id,project_id,number_of_hours) VALUES (30004,40002,5)
    INTO WeeklyHours (employee_id,project_id,number_of_hours) VALUES (30005,40002,1)
    INTO WeeklyHours (employee_id,project_id,number_of_hours) VALUES (30001,40005,28)
    INTO WeeklyHours (employee_id,project_id,number_of_hours) VALUES (30005,40003,24)
    INTO WeeklyHours (employee_id,project_id,number_of_hours) VALUES (30003,40001,5)
    INTO WeeklyHours (employee_id,project_id,number_of_hours) VALUES (30003,40004,8)
SELECT * FROM dual;

INSERT ALL
    INTO OrderDetails (order_id,product_id,amount_ordered) VALUES (70001,60001,6)
    INTO OrderDetails (order_id,product_id,amount_ordered) VALUES (70005,60002,6)
    INTO OrderDetails (order_id,product_id,amount_ordered) VALUES (70004,60002,4)
    INTO OrderDetails (order_id,product_id,amount_ordered) VALUES (70002,60004,12)
    INTO OrderDetails (order_id,product_id,amount_ordered) VALUES (70002,60001,3)
    INTO OrderDetails (order_id,product_id,amount_ordered) VALUES (70003,60001,1)
    INTO OrderDetails (order_id,product_id,amount_ordered) VALUES (70001,60004,5)
    INTO OrderDetails (order_id,product_id,amount_ordered) VALUES (70004,60003,5)
    INTO OrderDetails (order_id,product_id,amount_ordered) VALUES (70002,60005,4)
    INTO OrderDetails (order_id,product_id,amount_ordered) VALUES (70003,60002,2)
    INTO OrderDetails (order_id,product_id,amount_ordered) VALUES (70002,60003,1)
SELECT * FROM dual;

INSERT ALL
    INTO AvailableStock (product_id,warehouse_id,amount_available) VALUES (60005,80001,40)
    INTO AvailableStock (product_id,warehouse_id,amount_available) VALUES (60001,80002,16)
    INTO AvailableStock (product_id,warehouse_id,amount_available) VALUES (60002,80005,26)
    INTO AvailableStock (product_id,warehouse_id,amount_available) VALUES (60003,80003,13)
    INTO AvailableStock (product_id,warehouse_id,amount_available) VALUES (60001,80001,60)
    INTO AvailableStock (product_id,warehouse_id,amount_available) VALUES (60001,80005,68)
    INTO AvailableStock (product_id,warehouse_id,amount_available) VALUES (60003,80001,12)
    INTO AvailableStock (product_id,warehouse_id,amount_available) VALUES (60002,80004,43)
    INTO AvailableStock (product_id,warehouse_id,amount_available) VALUES (60003,80005,12)
    INTO AvailableStock (product_id,warehouse_id,amount_available) VALUES (60004,80002,56)
    INTO AvailableStock (product_id,warehouse_id,amount_available) VALUES (60003,80004,52)
    INTO AvailableStock (product_id,warehouse_id,amount_available) VALUES (60001,80003,25)
    INTO AvailableStock (product_id,warehouse_id,amount_available) VALUES (60005,80003,4)
    INTO AvailableStock (product_id,warehouse_id,amount_available) VALUES (60002,80003,2)
SELECT * FROM dual;
    

