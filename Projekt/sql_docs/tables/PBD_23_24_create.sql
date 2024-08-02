-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2024-01-16 18:20:14.881

-- tables
-- Table: adress_details
CREATE TABLE adress_details (
    user_id int  NOT NULL,
    street nvarchar(max)  NOT NULL,
    number int  NOT NULL CHECK (number >= 1),
    zip nvarchar(max)  NOT NULL,
    city nvarchar(63)  NOT NULL,
    country nvarchar(63)  NOT NULL,
    CONSTRAINT adress_details_pk PRIMARY KEY  (user_id)
);

INSERT INTO address_details (user_id, street, number, zip, city, country)
VALUES
    (1, 'Main St', 123, '12345', 'Cityville', 'Countryland'),
    (2, 'Broadway', 456, '56789', 'Townton', 'Stateland'),
    (3, 'Maple Ave', 789, '98765', 'Villageton', 'Landia'),
    (4, 'Pine St', 101, '54321', 'Hamletown', 'Territoryia'),
    (5, 'Sunset Blvd', 222, '13579', 'Metropolis', 'Nationville'),
    (6, 'Ocean Dr', 333, '24680', 'Seaville', 'Islandia'),
    (7, 'Highland Ave', 444, '11223', 'Mountain City', 'Summitland'),
    (8, 'Valley Rd', 555, '99887', 'Valleyville', 'Hilltopia'),
    (9, 'Greenwood Ln', 666, '66554', 'Greenburg', 'Gardenland'),
    (10, 'Riverwalk', 777, '33445', 'Rivertown', 'Riverland'),
    (11, 'Lakeside Dr', 888, '77889', 'Lakeview', 'Aquatica'),
    (12, 'Meadow Ln', 999, '44556', 'Meadowville', 'Pastureland'),
    (13, 'Sycamore St', 1010, '11222', 'Treeville', 'Leafia'),
    (14, 'Hillside Dr', 1111, '33445', 'Hilltop', 'Uplandia'),
    (15, 'Park Ave', 1212, '99887', 'Parktown', 'Groveia'),
    (16, 'Garden Rd', 1313, '66554', 'Gardenville', 'Floraland'),
    (17, 'Crescent Blvd', 1414, '77889', 'Crescent City', 'Moonland'),
    (18, 'Sunrise Dr', 1515, '44556', 'Sunrise Town', 'Dayland'),
    (19, 'Milestone Ln', 1616, '11222', 'Milestonetown', 'Landmarkia'),
    (20, 'Harbor View', 1717, '33445', 'Harbor City', 'Portlandia'),
    (21, 'Golden Gate', 1818, '99887', 'Goldenville', 'Treasureland'),
    (22, 'Silver Ln', 1919, '66554', 'Silvertown', 'Silverland'),
    (23, 'Diamond Dr', 2020, '77889', 'Diamondville', 'Gemland'),
    (24, 'Ruby St', 2121, '44556', 'Ruby City', 'Jewelland'),
    (25, 'Emerald Rd', 2222, '11222', 'Emeraldtown', 'Greenia'),
    (26, 'Sapphire Blvd', 2323, '33445', 'Sapphire City', 'Blueland'),
    (27, 'Amber Ave', 2424, '99887', 'Amberstown', 'Yellowia'),
    (28, 'Pearl Dr', 2525, '66554', 'Pearlville', 'Whiteland'),
    (29, 'Onyx Ln', 2626, '77889', 'Onyxtown', 'Blackia'),
    (30, 'Topaz Rd', 2727, '44556', 'Topaz City', 'Orangia');;

-- Table: classroom_details
CREATE TABLE classroom_details (
    classroom_id int  NOT NULL,
    limit int  NOT NULL CHECK (limit>=0),
    identifier nvarchar(max)  NOT NULL,
    CONSTRAINT classroom_details_pk PRIMARY KEY  (classroom_id)
);

INSERT INTO classroom_details (classroom_id, limit, identifier)
VALUES
    (1, 30, 'Classroom A'),
    (2, 25, 'Classroom B'),
    (3, 20, 'Classroom C'),
    (4, 35, 'Classroom D'),
    (5, 30, 'Classroom E'),
    (6, 25, 'Classroom F'),
    (7, 20, 'Classroom G'),
    (8, 35, 'Classroom H'),
    (9, 30, 'Classroom I'),
    (10, 25, 'Classroom J'),
    (11, 30, 'Classroom K'),
    (12, 25, 'Classroom L'),
    (13, 20, 'Classroom M'),
    (14, 35, 'Classroom N'),
    (15, 30, 'Classroom O'),
    (16, 25, 'Classroom P'),
    (17, 20, 'Classroom Q'),
    (18, 35, 'Classroom R'),
    (19, 30, 'Classroom S'),
    (20, 25, 'Classroom T');;

-- Table: completed_payments
CREATE TABLE completed_payments (
    payment_id int  NOT NULL,
    order_id int  NOT NULL,
    payment_amount money  NOT NULL CHECK (payment_amount >= 0),
    payment_time datetime  NOT NULL CHECK (year(payment_time) >= 2020),
    CONSTRAINT completed_payments_pk PRIMARY KEY  (payment_id)
);

INSERT INTO completed_payments (payment_id, order_id, payment_amount, payment_time)
VALUES
    (1, 1, 50.00, '2024-01-04 12:30:00'),
    (2, 2, 75.50, '2024-01-04 14:00:00'),
    (3, 3, 120.00, '2024-01-04 15:30:00'),
    (4, 4, 90.25, '2024-01-04 17:00:00'),
    (5, 5, 200.00, '2024-01-04 18:30:00'),
    (6, 6, 45.75, '2024-01-04 20:00:00'),
    (7, 7, 80.50, '2024-01-04 21:30:00'),
    (8, 8, 110.00, '2024-01-05 11:30:00'),
    (9, 9, 150.25, '2024-01-05 13:00:00'),
    (10, 10, 95.75, '2024-01-05 14:30:00'),
    (11, 11, 120.50, '2024-01-05 16:00:00'),
    (12, 12, 180.00, '2024-01-05 17:30:00'),
    (13, 13, 50.25, '2024-01-05 19:00:00'),
    (14, 14, 85.75, '2024-01-05 20:30:00'),
    (15, 15, 130.50, '2024-01-05 22:00:00'),
    (16, 16, 75.00, '2024-01-06 10:30:00'),
    (17, 17, 110.25, '2024-01-06 12:00:00'),
    (18, 18, 160.75, '2024-01-06 13:30:00'),
    (19, 19, 90.50, '2024-01-06 15:00:00'),
    (20, 20, 75.25, '2024-01-06 16:30:00'),
    (21, 21, 105.00, '2024-01-06 18:00:00'),
    (22, 22, 140.50, '2024-01-06 19:30:00'),
    (23, 23, 200.25, '2024-01-06 21:00:00'),
    (24, 24, 85.75, '2024-01-06 22:30:00'),
    (25, 25, 120.50, '2024-01-07 12:00:00'),
    (26, 26, 160.00, '2024-01-07 13:30:00'),
    (27, 27, 95.25, '2024-01-07 15:00:00'),
    (28, 28, 130.75, '2024-01-07 16:30:00'),
    (29, 29, 180.50, '2024-01-07 18:00:00'),
    (30, 30, 110.25, '2024-01-07 19:30:00');;

-- Table: countries_cities
CREATE TABLE countries_cities (
    country nvarchar(63)  NOT NULL,
    city nvarchar(63)  NOT NULL,
    CONSTRAINT countries_cities_pk PRIMARY KEY  (country,city)
);

-- Table: course_classroom_modules
CREATE TABLE course_classroom_modules (
    module_id int  NOT NULL,
    classroom_id int  NOT NULL,
    CONSTRAINT course_classroom_modules_pk PRIMARY KEY  (module_id)
);

INSERT INTO course_classroom_modules (module_id, classroom_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 1),
    (12, 2),
    (13, 3),
    (14, 4),
    (15, 5),
    (16, 6),
    (17, 7),
    (18, 8),
    (19, 9),
    (20, 10);;

-- Table: course_module_types
CREATE TABLE course_module_types (
    module_type_id int  NOT NULL,
    module_type_name nvarchar(max)  NOT NULL,
    CONSTRAINT course_module_types_pk PRIMARY KEY  (module_type_id)
);

-- Table: course_modules
CREATE TABLE course_modules (
    module_id int  NOT NULL,
    course_id int  NOT NULL,
    module_type_id int  NOT NULL,
    module_title nvarchar(max)  NOT NULL,
    teacher_id int  NOT NULL,
    start_time datetime  NOT NULL CHECK (year(start_time) >= 2020),
    end_time datetime  NOT NULL CHECK (year(end_time) >= 2020),
    CONSTRAINT end_time_po_start_time CHECK (end_time > start_time),
    CONSTRAINT course_modules_pk PRIMARY KEY  (module_id)
);

INSERT INTO course_modules (module_id, course_id, module_type_id, module_title, teacher_id, start_time, end_time)
VALUES
    (1, 1, 1, 'Physics Basics', 1, '2024-02-01 10:00:00', '2024-02-01 12:00:00'),
    (2, 1, 2, 'Experiments', 2, '2024-02-02 13:00:00', '2024-02-02 15:00:00'),
    (3, 2, 1, 'Introduction to Programming', 3, '2024-02-03 09:00:00', '2024-02-03 11:00:00'),
    (4, 2, 2, 'Code Debugging', 4, '2024-02-04 14:00:00', '2024-02-04 16:00:00'),
    (5, 3, 1, 'Math Tricks for Daily Life', 5, '2024-02-05 11:30:00', '2024-02-05 13:30:00'),
    (6, 3, 2, 'Solving Equations', 6, '2024-02-06 16:30:00', '2024-02-06 18:30:00'),
    (7, 4, 1, 'Python Basics', 7, '2024-02-07 12:45:00', '2024-02-07 14:45:00'),
    (8, 4, 2, 'Data Structures in Python', 8, '2024-02-08 17:15:00', '2024-02-08 19:15:00'),
    (9, 5, 1, 'Introduction to Chemistry', 9, '2024-02-09 09:30:00', '2024-02-09 11:30:00'),
    (10, 5, 2, 'Chemical Reactions', 10, '2024-02-10 14:30:00', '2024-02-10 16:30:00'),
    (11, 6, 1, 'Java Basics', 1, '2024-02-11 11:00:00', '2024-02-11 13:00:00'),
    (12, 6, 2, 'Advanced Java Concepts', 2, '2024-02-12 15:00:00', '2024-02-12 17:00:00'),
    (13, 7, 1, 'Historical Events Overview', 3, '2024-02-13 12:30:00', '2024-02-13 14:30:00'),
    (14, 7, 2, 'Famous Leaders', 4, '2024-02-14 16:00:00', '2024-02-14 18:00:00'),
    (15, 8, 1, 'Advanced JavaScript Concepts', 5, '2024-02-15 10:45:00', '2024-02-15 12:45:00'),
    (16, 8, 2, 'Frontend Development', 6, '2024-02-16 14:15:00', '2024-02-16 16:15:00'),
    (17, 9, 1, 'Literature Analysis Techniques', 7, '2024-02-17 11:15:00', '2024-02-17 13:15:00'),
    (18, 9, 2, 'Famous Literary Works', 8, '2024-02-18 15:30:00', '2024-02-18 17:30:00'),
    (19, 10, 1, 'Data Structures in Action', 9, '2024-02-19 10:00:00', '2024-02-19 12:00:00'),
    (20, 10, 2, 'Algorithm Design', 10, '2024-02-20 14:00:00', '2024-02-20 16:00:00'),
    (21, 1, 1, 'Geography Insights Overview', 1, '2024-02-21 11:30:00', '2024-02-21 13:30:00'),
    (22, 1, 2, 'World Geography', 2, '2024-02-22 16:45:00', '2024-02-22 18:45:00'),
    (23, 2, 1, 'Object-Oriented Programming Principles', 3, '2024-02-23 12:00:00', '2024-02-23 14:00:00'),
    (24, 2, 2, 'Design Patterns', 4, '2024-02-24 15:30:00', '2024-02-24 17:30:00'),
    (25, 3, 1, 'Introduction to Economics', 5, '2024-02-25 09:15:00', '2024-02-25 11:15:00'),
    (26, 3, 2, 'Microeconomics Concepts', 6, '2024-02-26 13:45:00', '2024-02-26 15:45:00'),
    (27, 4, 1, 'Machine Learning Fundamentals', 7, '2024-02-27 10:30:00', '2024-02-27 12:30:00'),
    (28, 4, 2, 'Deep Learning', 8, '2024-02-28 14:45:00', '2024-02-28 16:45:00'),
    (29, 5, 1, 'Data Structures in Action', 9, '2024-03-01 10:00:00', '2024-03-01 12:00:00'),
    (30, 5, 2, 'Algorithm Design', 10, '2024-03-01 14:00:00', '2024-03-01 16:00:00');;

-- Table: course_online_modules
CREATE TABLE course_online_modules (
    module_id int  NOT NULL,
    link nvarchar(max)  NOT NULL,
    CONSTRAINT course_online_modules_pk PRIMARY KEY  (module_id)
);

INSERT INTO course_online_modules (module_id, link)
VALUES
    (1, 'https://example.com/module1'),
    (2, 'https://example.com/module2'),
    (3, 'https://example.com/module3'),
    (4, 'https://example.com/module4'),
    (5, 'https://example.com/module5'),
    (6, 'https://example.com/module6'),
    (7, 'https://example.com/module7'),
    (8, 'https://example.com/module8'),
    (9, 'https://example.com/module9'),
    (10, 'https://example.com/module10');;

-- Table: course_presences
CREATE TABLE course_presences (
    module_id int  NOT NULL,
    customer_id int  NOT NULL,
    CONSTRAINT course_presences_pk PRIMARY KEY  (module_id,customer_id)
);

INSERT INTO course_presences (presence_id, module_id, customer_id)
VALUES
    (1, 1, 1),
    (2, 1, 2),
    (3, 2, 3),
    (4, 2, 4),
    (5, 3, 5),
    (6, 3, 6),
    (7, 4, 7),
    (8, 4, 8),
    (9, 5, 9),
    (10, 5, 10);;

-- Table: course_translations
CREATE TABLE course_translations (
    module_id int  NOT NULL,
    translator_id int  NOT NULL,
    CONSTRAINT course_translations_pk PRIMARY KEY  (module_id)
);

INSERT INTO course_translations (module_id, translator_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 7),
    (4, 1),
    (5, 2),
    (5, 3),
    (6, 4),
    (6, 5),
    (7, 6),
    (7, 7),
    (8, 1),
    (8, 2),
    (9, 3),
    (9, 4),
    (10, 5),
    (10, 6),
    (11, 7),
    (11, 1),
    (12, 2),
    (12, 3),
    (13, 4),
    (13, 5),
    (14, 6),
    (14, 7),
    (15, 1);;

-- Table: course_types
CREATE TABLE course_types (
    course_type_id int  NOT NULL,
    course_type nvarchar(max)  NOT NULL,
    CONSTRAINT course_types_pk PRIMARY KEY  (course_type_id)
);

INSERT INTO service_types (service_type_id, service_type)
VALUES
    (1, 'Stationary'),
    (2, 'Hybrid'),
    (3, 'Online');;

-- Table: courses
CREATE TABLE courses (
    course_id int  NOT NULL,
    course_type_id int  NOT NULL,
    title nvarchar(max)  NOT NULL,
    subject_name nvarchar(max)  NOT NULL,
    price money  NOT NULL CHECK (price >= 0),
    CONSTRAINT courses_pk PRIMARY KEY  (course_id)
);

INSERT INTO courses (course_id, course_type_id, title, subject_name, price)
VALUES
    (1, 1, 'Introduction to Physics', 'Physics Basics', 29.99),
    (2, 2, 'Programming Fundamentals', 'Computer Science', 19.99),
    (3, 1, 'Mathematics Tricks', 'Mathematics', 24.99),
    (4, 2, 'Python for Beginners', 'Programming', 14.99),
    (5, 1, 'Chemistry Concepts', 'Chemistry', 34.99),
    (6, 2, 'Java Basics', 'Programming', 12.99),
    (7, 3, 'History Insights', 'History', 22.99),
    (8, 1, 'Advanced JavaScript', 'Web Development', 29.99),
    (9, 2, 'Literature Analysis', 'Literature', 16.99),
    (10, 3, 'Data Structures Overview', 'Computer Science', 21.99),
    (11, 1, 'Geography Insights', 'Geography', 27.99),
    (12, 2, 'Object-Oriented Programming', 'Programming', 15.99),
    (13, 3, 'Economics Fundamentals', 'Economics', 23.99),
    (14, 1, 'Machine Learning Basics', 'Machine Learning', 19.99),
    (15, 2, 'Psychology Insights', 'Psychology', 27.99),
    (16, 3, 'Database Management', 'Database Management', 14.99),
    (17, 1, 'Sociology Fundamentals', 'Sociology', 21.99),
    (18, 2, 'Cybersecurity Essentials', 'Cybersecurity', 29.99),
    (19, 3, 'Philosophy Overview', 'Philosophy', 15.99),
    (20, 1, 'Software Development Life Cycle', 'Software Development', 24.99),
    (21, 2, 'Political Science Insights', 'Political Science', 18.99),
    (22, 3, 'Mobile App Development Basics', 'Mobile App Development', 26.99),
    (23, 1, 'Environmental Science Fundamentals', 'Environmental Science', 13.99),
    (24, 2, 'Artificial Intelligence Overview', 'Artificial Intelligence', 20.99),
    (25, 3, 'Cultural Studies', 'Cultural Studies', 28.99),
    (26, 1, 'Web Development Basics', 'Web Development', 16.99),
    (27, 2, 'Health Science Insights', 'Health Science', 23.99),
    (28, 3, 'Network Security Fundamentals', 'Network Security', 19.99),
    (29, 1, 'Astrophysics Overview', 'Astrophysics', 27.99),
    (30, 2, 'Software Testing Essentials', 'Software Testing', 15.99);;

-- Table: customers
CREATE TABLE customers (
    customer_id int  NOT NULL,
    user_id int  NOT NULL,
    CONSTRAINT customers_pk PRIMARY KEY  (customer_id)
);

INSERT INTO customers (customer_id, user_id)
VALUES
    (1, 5),
    (2, 6),
    (3, 7),
    (4, 8),
    (5, 9),
    (6, 10),
    (7, 11),
    (8, 12),
    (9, 13),
    (10, 14),
    (11, 15),
    (12, 16),
    (13, 17),
    (14, 18),
    (15, 19),
    (16, 20),
    (17, 21),
    (18, 22),
    (19, 23),
    (20, 24),
    (21, 25),
    (22, 26),
    (23, 27),
    (24, 28),
    (25, 29),
    (26, 30),
    (27, 1),
    (28, 2),
    (29, 3),
    (30, 4);;

-- Table: languages
CREATE TABLE languages (
    language_id int  NOT NULL,
    language nvarchar(max)  NOT NULL,
    CONSTRAINT languages_pk PRIMARY KEY  (language_id)
);

INSERT INTO languages (language_id, language)
VALUES
    (1, 'English'),
    (2, 'Spanish'),
    (3, 'French'),
    (4, 'German'),
    (5, 'Chinese'),
    (6, 'Japanese'),
    (7, 'Arabic');;

-- Table: order_details
CREATE TABLE order_details (
    order_id int  NOT NULL,
    service_id int  NOT NULL,
    service_type_id int  NOT NULL,
    CONSTRAINT order_details_pk PRIMARY KEY  (order_id,service_id)
);

INSERT INTO order_details (order_id, service_id, service_type_id)
VALUES
    (1, 1, 1),
    (1, 2, 2),
    (2, 3, 3),
    (2, 4, 4),
    (3, 5, 1),
    (3, 6, 2),
    (4, 7, 3),
    (4, 8, 4),
    (5, 9, 1),
    (5, 10, 2),
    (6, 11, 3),
    (6, 12, 4),
    (7, 13, 1),
    (7, 14, 2),
    (8, 15, 3),
    (8, 16, 4),
    (9, 17, 1),
    (9, 18, 2),
    (10, 19, 3),
    (10, 20, 4),
    (11, 21, 1),
    (11, 22, 2),
    (12, 23, 3),
    (12, 24, 4),
    (13, 25, 1),
    (13, 26, 2),
    (14, 27, 3),
    (14, 28, 4),
    (15, 29, 1),
    (15, 30, 2);;

-- Table: orders
CREATE TABLE orders (
    order_id int  NOT NULL IDENTITY(1, 1),
    customer_id int  NOT NULL,
    order_time datetime  NOT NULL DEFAULT GETDATE() CHECK (year(order_time) >= 2020),
    CONSTRAINT orders_pk PRIMARY KEY  (order_id)
);

INSERT INTO orders (order_id, customer_id, order_time)
VALUES
    (1, 1, '2024-01-04 08:30:00'),
    (2, 2, '2024-01-04 09:15:00'),
    (3, 3, '2024-01-04 10:00:00'),
    (4, 4, '2024-01-04 11:45:00'),
    (5, 5, '2024-01-04 13:30:00'),
    (6, 6, '2024-01-04 14:15:00'),
    (7, 7, '2024-01-04 15:00:00'),
    (8, 8, '2024-01-04 16:45:00'),
    (9, 9, '2024-01-04 18:30:00'),
    (10, 10, '2024-01-04 19:15:00'),
    (11, 11, '2024-01-04 20:00:00'),
    (12, 12, '2024-01-04 21:45:00'),
    (13, 13, '2024-01-05 08:30:00'),
    (14, 14, '2024-01-05 09:15:00'),
    (15, 15, '2024-01-05 10:00:00'),
    (16, 16, '2024-01-05 11:45:00'),
    (17, 17, '2024-01-05 13:30:00'),
    (18, 18, '2024-01-05 14:15:00'),
    (19, 19, '2024-01-05 15:00:00'),
    (20, 20, '2024-01-05 16:45:00'),
    (21, 21, '2024-01-05 18:30:00'),
    (22, 22, '2024-01-05 19:15:00'),
    (23, 23, '2024-01-05 20:00:00'),
    (24, 24, '2024-01-05 21:45:00'),
    (25, 25, '2024-01-06 08:30:00'),
    (26, 26, '2024-01-06 09:15:00'),
    (27, 27, '2024-01-06 10:00:00'),
    (28, 28, '2024-01-06 11:45:00'),
    (29, 29, '2024-01-06 13:30:00'),
    (30, 30, '2024-01-06 14:15:00');;

-- Table: pending_payments
CREATE TABLE pending_payments (
    payment_id int  NOT NULL,
    order_id int  NOT NULL,
    payment_amount money  NOT NULL CHECK (payment_amount >= 0),
    payment_due datetime  NOT NULL CHECK (year(payment_due) >= 2020),
    payment_link nvarchar(max)  NOT NULL,
    CONSTRAINT pending_payments_pk PRIMARY KEY  (payment_id)
);

INSERT INTO pending_payments (payment_id, order_id, payment_amount, payment_due, payment_link)
VALUES
    (1, 1, 50.00, '2024-01-04 12:00:00', 'payment_link_1'),
    (2, 2, 75.50, '2024-01-04 13:30:00', 'payment_link_2'),
    (3, 3, 120.00, '2024-01-04 15:00:00', 'payment_link_3'),
    (4, 4, 90.25, '2024-01-04 16:30:00', 'payment_link_4'),
    (5, 5, 200.00, '2024-01-04 18:00:00', 'payment_link_5'),
    (6, 6, 45.75, '2024-01-04 19:30:00', 'payment_link_6'),
    (7, 7, 80.50, '2024-01-04 21:00:00', 'payment_link_7'),
    (8, 8, 110.00, '2024-01-05 10:00:00', 'payment_link_8'),
    (9, 9, 150.25, '2024-01-05 11:30:00', 'payment_link_9'),
    (10, 10, 95.75, '2024-01-05 13:00:00', 'payment_link_10'),
    (11, 11, 120.50, '2024-01-05 14:30:00', 'payment_link_11'),
    (12, 12, 180.00, '2024-01-05 16:00:00', 'payment_link_12'),
    (13, 13, 50.25, '2024-01-05 17:30:00', 'payment_link_13'),
    (14, 14, 85.75, '2024-01-05 19:00:00', 'payment_link_14'),
    (15, 15, 130.50, '2024-01-05 20:30:00', 'payment_link_15'),
    (16, 16, 75.00, '2024-01-06 09:00:00', 'payment_link_16'),
    (17, 17, 110.25, '2024-01-06 10:30:00', 'payment_link_17'),
    (18, 18, 160.75, '2024-01-06 12:00:00', 'payment_link_18'),
    (19, 19, 90.50, '2024-01-06 13:30:00', 'payment_link_19'),
    (20, 20, 75.25, '2024-01-06 15:00:00', 'payment_link_20'),
    (21, 21, 105.00, '2024-01-06 16:30:00', 'payment_link_21'),
    (22, 22, 140.50, '2024-01-06 18:00:00', 'payment_link_22'),
    (23, 23, 200.25, '2024-01-06 19:30:00', 'payment_link_23'),
    (24, 24, 85.75, '2024-01-06 21:00:00', 'payment_link_24'),
    (25, 25, 120.50, '2024-01-07 10:00:00', 'payment_link_25'),
    (26, 26, 160.00, '2024-01-07 11:30:00', 'payment_link_26'),
    (27, 27, 95.25, '2024-01-07 13:00:00', 'payment_link_27'),
    (28, 28, 130.75, '2024-01-07 14:30:00', 'payment_link_28'),
    (29, 29, 180.50, '2024-01-07 16:00:00', 'payment_link_29'),
    (30, 30, 110.25, '2024-01-07 17:30:00', 'payment_link_30');;

-- Table: service_types
CREATE TABLE service_types (
    service_type_id int  NOT NULL,
    service_type_name nvarchar(max)  NOT NULL,
    CONSTRAINT service_types_pk PRIMARY KEY  (service_type_id)
);

INSERT INTO service_types (service_type_id, service_type_name)
VALUES
    (1, 'webinar'),
    (2, 'course'),
    (3, 'studies');;

-- Table: studies
CREATE TABLE studies (
    studies_id int  NOT NULL,
    name nvarchar(max)  NOT NULL,
    start_date date  NOT NULL CHECK (year(start_date) >= 2020),
    student_limit int  NOT NULL CHECK (student_limit >= 0),
    CONSTRAINT studies_pk PRIMARY KEY  (studies_id)
);

INSERT INTO studies (studies_id, name, start_date, student_limit)
VALUES
    (1, 'Mathematics Fundamentals', '2024-02-01', 50),
    (2, 'Literature Exploration', '2024-02-15', 40),
    (3, 'History Insights', '2024-03-01', 45),
    (4, 'Physics in Everyday Life', '2024-03-15', 55),
    (5, 'Programming Basics', '2024-04-01', 30),
    (6, 'Chemistry Explorations', '2024-04-15', 35),
    (7, 'Geography Discoveries', '2024-05-01', 60),
    (8, 'Introduction to Economics', '2024-05-15', 40),
    (9, 'Literary Classics', '2024-06-01', 50),
    (10, 'Data Structures in Action', '2024-06-15', 30),
    (11, 'Philosophy Discussions', '2024-07-01', 45),
    (12, 'Advanced JavaScript Concepts', '2024-07-15', 35),
    (13, 'Machine Learning Fundamentals', '2024-08-01', 55),
    (14, 'Environmental Science Studies', '2024-08-15', 40),
    (15, 'Java Programming', '2024-09-01', 50),
    (16, 'Literary Analysis Techniques', '2024-09-15', 35),
    (17, 'Computer Networks', '2024-10-01', 45),
    (18, 'Microeconomics Concepts', '2024-10-15', 30),
    (19, 'Introduction to Psychology', '2024-11-01', 50),
    (20, 'Digital Marketing Strategies', '2024-11-15', 40),
    (21, 'Web Development Bootcamp', '2024-12-01', 55),
    (22, 'World History Overview', '2024-12-15', 40),
    (23, 'Artificial Intelligence Applications', '2025-01-01', 45),
    (24, 'Literary Masterpieces', '2025-01-15', 35),
    (25, 'Introduction to Sociology', '2025-02-01', 50),
    (26, 'Algorithm Design', '2025-02-15', 30),
    (27, 'Business Ethics', '2025-03-01', 45),
    (28, 'Deep Learning Fundamentals', '2025-03-15', 40),
    (29, 'Statistical Analysis Techniques', '2025-04-01', 55),
    (30, 'Spanish Language Studies', '2025-04-15', 35);;

-- Table: studies_class_translators
CREATE TABLE studies_class_translators (
    class_id int  NOT NULL,
    translator_id int  NOT NULL,
    CONSTRAINT studies_class_translators_pk PRIMARY KEY  (class_id)
);

INSERT INTO studies_class_translators (class_id, translator_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);;

-- Table: studies_classes
CREATE TABLE studies_classes (
    class_id int  NOT NULL,
    studies_id int  NOT NULL,
    title nvarchar(max)  NOT NULL,
    teacher_id int  NOT NULL,
    start_time datetime  NOT NULL CHECK (year(start_time) >= 2020),
    end_time datetime  NOT NULL CHECK (year(end_time) >= 2020),
    CONSTRAINT end_time_po_start_time CHECK (end_time > start_time),
    CONSTRAINT studies_classes_pk PRIMARY KEY  (class_id)
);

INSERT INTO studies_classes (class_id, studies_id, title, teacher_id, start_time, end_time)
VALUES
    (1, 1, 'Math Fundamentals Class', 1, '2024-02-01 09:00:00', '2024-02-01 11:00:00'),
    (2, 2, 'Literature Exploration Class', 2, '2024-02-15 10:00:00', '2024-02-15 12:00:00'),
    (3, 3, 'History Insights Class', 3, '2024-03-01 14:00:00', '2024-03-01 16:00:00'),
    (4, 4, 'Physics in Everyday Life Class', 4, '2024-03-15 11:00:00', '2024-03-15 13:00:00'),
    (5, 5, 'Programming Basics Class', 5, '2024-04-01 09:30:00', '2024-04-01 11:30:00'),
    (6, 6, 'Chemistry Explorations Class', 6, '2024-04-15 13:30:00', '2024-04-15 15:30:00'),
    (7, 7, 'Geography Discoveries Class', 7, '2024-05-01 12:00:00', '2024-05-01 14:00:00'),
    (8, 8, 'Economics Introduction Class', 8, '2024-05-15 15:00:00', '2024-05-15 17:00:00'),
    (9, 9, 'Literary Classics Class', 9, '2024-06-01 11:30:00', '2024-06-01 13:30:00'),
    (10, 10, 'Data Structures in Action Class', 10, '2024-06-15 09:30:00', '2024-06-15 11:30:00'),
    (11, 11, 'Philosophy Discussions Class', 1, '2024-07-01 14:30:00', '2024-07-01 16:30:00'),
    (12, 12, 'Advanced JavaScript Concepts Class', 2, '2024-07-15 12:00:00', '2024-07-15 14:00:00'),
    (13, 13, 'Machine Learning Fundamentals Class', 3, '2024-08-01 11:00:00', '2024-08-01 13:00:00'),
    (14, 14, 'Environmental Science Studies Class', 4, '2024-08-15 16:00:00', '2024-08-15 18:00:00'),
    (15, 15, 'Java Programming Class', 5, '2024-09-01 10:00:00', '2024-09-01 12:00:00'),
    (16, 16, 'Literary Analysis Techniques Class', 6, '2024-09-15 14:30:00', '2024-09-15 16:30:00'),
    (17, 17, 'Computer Networks Class', 7, '2024-10-01 13:30:00', '2024-10-01 15:30:00'),
    (18, 18, 'Microeconomics Concepts Class', 8, '2024-10-15 15:00:00', '2024-10-15 17:00:00'),
    (19, 19, 'Introduction to Psychology Class', 9, '2024-11-01 14:00:00', '2024-11-01 16:00:00'),
    (20, 20, 'Digital Marketing Strategies Class', 10, '2024-11-15 12:30:00', '2024-11-15 14:30:00'),
    (21, 21, 'Web Development Bootcamp Class', 1, '2024-12-01 09:00:00', '2024-12-01 11:00:00'),
    (22, 22, 'World History Overview Class', 2, '2024-12-15 10:30:00', '2024-12-15 12:30:00'),
    (23, 23, 'AI Applications Class', 3, '2025-01-01 13:00:00', '2025-01-01 15:00:00'),
    (24, 24, 'Literary Masterpieces Class', 4, '2025-01-15 16:30:00', '2025-01-15 18:30:00'),
    (25, 25, 'Introduction to Sociology Class', 5, '2025-02-01 14:30:00', '2025-02-01 16:30:00'),
    (26, 26, 'Algorithm Design Class', 6, '2025-02-15 11:00:00', '2025-02-15 13:00:00'),
    (27, 27, 'Business Ethics Class', 7, '2025-03-01 15:00:00', '2025-03-01 17:00:00'),
    (28, 28, 'Deep Learning Fundamentals Class', 8, '2025-03-15 13:30:00', '2025-03-15 15:30:00'),
    (29, 29, 'Statistical Analysis Techniques Class', 9, '2025-04-01 12:00:00', '2025-04-01 14:00:00'),
    (30, 30, 'Spanish Language Studies Class', 10, '2025-04-15 09:30:00', '2025-04-15 11:30:00');;

-- Table: studies_classroom_classes
CREATE TABLE studies_classroom_classes (
    class_id int  NOT NULL,
    classroom_id int  NOT NULL,
    CONSTRAINT studies_classroom_classes_pk PRIMARY KEY  (class_id)
);

-- Insert 20 rows of sample data into studies_classroom_classes table
INSERT INTO studies_classroom_classes (class_id, classroom_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10),
    (11, 11),
    (12, 12),
    (13, 13),
    (14, 14),
    (15, 15),
    (16, 16),
    (17, 17),
    (18, 18),
    (19, 19),
    (20, 20);;

-- Table: studies_online_classes
CREATE TABLE studies_online_classes (
    class_id int  NOT NULL,
    link nvarchar(max)  NOT NULL,
    CONSTRAINT studies_online_classes_pk PRIMARY KEY  (class_id)
);

INSERT INTO studies_online_classes (class_id, link)
VALUES
    (1, 'https://example.com/class1'),
    (2, 'https://example.com/class2'),
    (3, 'https://example.com/class3'),
    (4, 'https://example.com/class4'),
    (5, 'https://example.com/class5'),
    (6, 'https://example.com/class6'),
    (7, 'https://example.com/class7'),
    (8, 'https://example.com/class8'),
    (9, 'https://example.com/class9'),
    (10, 'https://example.com/class10');;

-- Table: studies_passes
CREATE TABLE studies_passes (
    practice_id int  NOT NULL,
    customer_id int  NOT NULL,
    CONSTRAINT studies_passes_pk PRIMARY KEY  (practice_id,customer_id)
);

INSERT INTO studies_passes (practice_id, customer_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);;

-- Table: studies_practice_modules
CREATE TABLE studies_practice_modules (
    practice_id int  NOT NULL,
    studies_id int  NOT NULL,
    start_date date  NOT NULL CHECK (year(start_date) >= 2020),
    end_date date  NOT NULL CHECK (year(end_date) >= 2020),
    company_name nvarchar(max)  NOT NULL,
    CONSTRAINT end_date_po_start_date CHECK (end_date > start_date),
    CONSTRAINT studies_practice_modules_pk PRIMARY KEY  (practice_id)
);

INSERT INTO studies_practice_modules (practice_id, studies_id, start_date, end_date, company_name)
VALUES
    (1, 1, '2024-02-01', '2024-02-15', 'ABC Corp'),
    (2, 2, '2024-02-15', '2024-03-01', 'XYZ Ltd'),
    (3, 3, '2024-03-01', '2024-03-15', '123 Company'),
    (4, 4, '2024-03-15', '2024-04-01', 'Tech Innovators'),
    (5, 5, '2024-04-01', '2024-04-15', 'Global Solutions'),
    (6, 6, '2024-04-15', '2024-05-01', 'Innovate Co.'),
    (7, 7, '2024-05-01', '2024-05-15', 'Future Tech'),
    (8, 8, '2024-05-15', '2024-06-01', 'Data Insights'),
    (9, 9, '2024-06-01', '2024-06-15', 'Smart Solutions'),
    (10, 10, '2024-06-15', '2024-07-01', 'Alpha Corp'),
    (11, 11, '2024-07-01', '2024-07-15', 'Beta Innovations'),
    (12, 12, '2024-07-15', '2024-08-01', 'Gamma Systems'),
    (13, 13, '2024-08-01', '2024-08-15', 'Delta Tech'),
    (14, 14, '2024-08-15', '2024-09-01', 'Epsilon Solutions'),
    (15, 15, '2024-09-01', '2024-09-15', 'Zeta Corp'),
    (16, 16, '2024-09-15', '2024-10-01', 'Theta Innovations'),
    (17, 17, '2024-10-01', '2024-10-15', 'Iota Tech'),
    (18, 18, '2024-10-15', '2024-11-01', 'Kappa Systems'),
    (19, 19, '2024-11-01', '2024-11-15', 'Lambda Solutions'),
    (20, 20, '2024-11-15', '2024-12-01', 'Mu Corp'),
    (21, 21, '2024-12-01', '2024-12-15', 'Nu Innovations'),
    (22, 22, '2024-12-15', '2025-01-01', 'Xi Tech'),
    (23, 23, '2025-01-01', '2025-01-15', 'Omicron Systems'),
    (24, 24, '2025-01-15', '2025-02-01', 'Pi Solutions'),
    (25, 25, '2025-02-01', '2025-02-15', 'Rho Corp'),
    (26, 26, '2025-02-15', '2025-03-01', 'Sigma Innovations'),
    (27, 27, '2025-03-01', '2025-03-15', 'Tau Tech'),
    (28, 28, '2025-03-15', '2025-04-01', 'Upsilon Systems'),
    (29, 29, '2025-04-01', '2025-04-15', 'Phi Solutions'),
    (30, 30, '2025-04-15', '2025-05-01', 'Chi Corp');;

-- Table: studies_presences
CREATE TABLE studies_presences (
    class_id int  NOT NULL,
    customer_id int  NOT NULL,
    is_excused_absence bit  NOT NULL DEFAULT 0,
    CONSTRAINT studies_presences_pk PRIMARY KEY  (class_id,customer_id)
);

INSERT INTO studies_presences (class_id, customer_id, is_excused_absence)
VALUES
    (1, 1, 0),
    (2, 2, 1),
    (3, 3, 0),
    (4, 4, 1),
    (5, 5, 0),
    (6, 6, 1),
    (7, 7, 0),
    (8, 8, 1),
    (9, 9, 0),
    (10, 10, 1);;

-- Table: studies_price_per_classes
CREATE TABLE studies_price_per_classes (
    studies_id int  NOT NULL,
    member_price money  NOT NULL CHECK (member_price >= 0),
    non_member_price money  NOT NULL CHECK (non_member_price >= 0),
    CONSTRAINT nonMemberPrice_wieksza_od_memberPrice CHECK (non_member_price >= member_price),
    CONSTRAINT studies_price_per_classes_pk PRIMARY KEY  (studies_id)
);

INSERT INTO studies_price_per_classes (studies_id, member_price, non_member_price)
VALUES
    (1, 150.00, 200.00),
    (2, 120.00, 160.00),
    (3, 130.00, 180.00),
    (4, 180.00, 230.00),
    (5, 100.00, 150.00),
    (6, 110.00, 160.00),
    (7, 160.00, 210.00),
    (8, 140.00, 190.00),
    (9, 150.00, 200.00),
    (10, 100.00, 150.00),
    (11, 130.00, 180.00),
    (12, 110.00, 160.00),
    (13, 180.00, 230.00),
    (14, 140.00, 190.00),
    (15, 150.00, 200.00),
    (16, 110.00, 160.00),
    (17, 130.00, 180.00),
    (18, 100.00, 150.00),
    (19, 150.00, 200.00),
    (20, 120.00, 160.00),
    (21, 180.00, 230.00),
    (22, 140.00, 190.00),
    (23, 130.00, 180.00),
    (24, 110.00, 160.00),
    (25, 160.00, 210.00),
    (26, 100.00, 150.00),
    (27, 150.00, 200.00),
    (28, 120.00, 160.00),
    (29, 140.00, 190.00),
    (30, 180.00, 230.00);;

-- Table: teachers
CREATE TABLE teachers (
    teacher_id int  NOT NULL,
    user_id int  NOT NULL,
    CONSTRAINT teachers_pk PRIMARY KEY  (teacher_id)
);

INSERT INTO teachers (teacher_id, user_id)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);;

-- Table: translators
CREATE TABLE translators (
    translator_id int  NOT NULL,
    teacher_id int  NOT NULL,
    language_id int  NOT NULL,
    CONSTRAINT translators_pk PRIMARY KEY  (translator_id)
);

INSERT INTO translators (translator_id, teacher_id, language_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5),
    (6, 6, 6),
    (7, 7, 7);;

-- Table: user_types
CREATE TABLE user_types (
    user_type_id int  NOT NULL,
    user_type_name nvarchar(max)  NOT NULL,
    CONSTRAINT user_types_pk PRIMARY KEY  (user_type_id)
);

INSERT INTO user_types (user_type_id, user_type_name)
VALUES
    (1, 'Admin'),
    (2, 'Accontant'),
    (3, 'Director'),
    (4, 'Customer'),
    (5, 'Teahcer');;

-- Table: users
CREATE TABLE users (
    user_id int  NOT NULL,
    user_type_id int  NOT NULL,
    e_mail nvarchar(max)  NOT NULL CHECK (e_mail like '%@%.%'),
    hashed_passwd nvarchar(max)  NOT NULL,
    first_name nvarchar(max)  NOT NULL,
    last_name nvarchar(max)  NOT NULL,
    phone_number nvarchar(max)  NULL DEFAULT ISNUMERIC(phone_number),
    CONSTRAINT unique_email UNIQUE (e_mail),
    CONSTRAINT users_pk PRIMARY KEY  (user_id)
);

INSERT INTO users (user_id, user_type_id, e_mail, hashed_passwd, first_name, last_name, phone_number)
VALUES
    (1, 1, 'admin@example.com', 'hashed_admin_password', 'Admin', 'User', '123-456-7890'),
    (2, 2, 'accountant@example.com', 'hashed_accountant_password', 'Accountant', 'Smith', '987-654-3210'),
    (3, 3, 'director@example.com', 'hashed_director_password', 'Director', 'Doe', '555-123-4567'),
    (4, 3, 'director2@example.com', 'hashed_director2_password', 'Director2', 'Johnson', '777-888-9999'),
    (5, 4, 'customer1@example.com', 'hashed_customer1_password', 'Alice', 'Williams', '111-222-3333'),
    (6, 4, 'customer2@example.com', 'hashed_customer2_password', 'Bob', 'Brown', '444-555-6666'),
    (7, 5, 'teacher1@example.com', 'hashed_teacher1_password', 'Charlie', 'Davis', '666-777-8888'),
    (8, 5, 'teacher2@example.com', 'hashed_teacher2_password', 'David', 'Evans', '999-000-1111'),
    (9, 1, 'admin2@example.com', 'hashed_admin2_password', 'Admin2', 'User2', '999-888-7777'),
    (10, 1, 'accountant2@example.com', 'hashed_accountant2_password', 'Accountant2', 'Smith2', '222-111-0000'),
    (11, 2, 'director3@example.com', 'hashed_director3_password', 'Director3', 'Parker', '111-333-5555'),
    (12, 2, 'director4@example.com', 'hashed_director4_password', 'Director4', 'Quinn', '444-666-8888'),
    (13, 3, 'customer3@example.com', 'hashed_customer3_password', 'Catherine', 'Reed', '777-000-2222'),
    (14, 3, 'customer4@example.com', 'hashed_customer4_password', 'Christopher', 'Smith', '333-555-7777'),
    (15, 4, 'teacher3@example.com', 'hashed_teacher3_password', 'Sophie', 'Turner', '111-444-7777'),
    (16, 4, 'teacher4@example.com', 'hashed_teacher4_password', 'Samuel', 'Vaughn', '555-888-2222'),
    (17, 5, 'admin3@example.com', 'hashed_admin3_password', 'Admin3', 'White', '999-333-6666'),
    (18, 5, 'accountant3@example.com', 'hashed_accountant3_password', 'Accountant3', 'Young', '222-666-9999'),
    (19, 1, 'director5@example.com', 'hashed_director5_password', 'Director5', 'Zimmer', '111-666-0000'),
    (20, 1, 'director6@example.com', 'hashed_director6_password', 'Director6', 'Xavier', '444-999-2222'),
    (21, 2, 'customer5@example.com', 'hashed_customer5_password', 'Customer5', 'Hill', '555-666-7777'),
    (22, 2, 'customer6@example.com', 'hashed_customer6_password', 'Customer6', 'Irwin', '888-999-0000'),
    (23, 3, 'teacher5@example.com', 'hashed_teacher5_password', 'Teacher5', 'Jackson', '111-222-3333'),
    (24, 3, 'teacher6@example.com', 'hashed_teacher6_password', 'Teacher6', 'Kim', '444-555-6666'),
    (25, 4, 'admin4@example.com', 'hashed_admin4_password', 'Admin4', 'Lee', '777-888-9999'),
    (26, 4, 'accountant4@example.com', 'hashed_accountant4_password', 'Accountant4', 'Miller', '000-111-2222'),
    (27, 5, 'director7@example.com', 'hashed_director7_password', 'Director7', 'Nelson', '333-444-5555'),
    (28, 5, 'director8@example.com', 'hashed_director8_password', 'Director8', 'Owens', '666-777-8888'),
    (29, 1, 'customer7@example.com', 'hashed_customer7_password', 'Customer7', 'Vaughn', '111-444-7777'),
    (30, 1, 'customer8@example.com', 'hashed_customer8_password', 'Customer8', 'Young', '555-888-2222');;

-- Table: webinar_types
CREATE TABLE webinar_types (
    webinar_type_id int  NOT NULL,
    webinar_type nvarchar(max)  NOT NULL,
    CONSTRAINT webinar_types_pk PRIMARY KEY  (webinar_type_id)
);

INSERT INTO webinar_types (webinar_type_id, webinar_type)
VALUES
    (1, 'Stationary'),
    (2, 'Online');;

-- Table: webinars
CREATE TABLE webinars (
    webinar_id int  NOT NULL,
    webinar_type_id int  NOT NULL,
    price money  NOT NULL CHECK (price >= 0),
    title nvarchar(max)  NOT NULL,
    subject_name nvarchar(max)  NOT NULL,
    link nvarchar(max)  NULL,
    link_expires datetime  NULL DEFAULT GETDATE(),
    teacher_id int  NOT NULL,
    start_time datetime  NOT NULL CHECK (year(start_time) >= 2020),
    end_time datetime  NOT NULL CHECK (year(end_time) >= 2020),
    CONSTRAINT end_time_po_start_time CHECK (end_time > start_time),
    CONSTRAINT webinars_pk PRIMARY KEY  (webinar_id)
);

INSERT INTO webinars (webinar_id, webinar_type_id, price, title, subject_name, link, link_expires, teacher_id, start_time, end_time)
VALUES
    (1, 1, 20.00, 'Webinar 1', 'Physics Basics', 'webinar_link_1', '2024-01-08 12:00:00', 1, '2024-01-08 13:00:00', '2024-01-08 15:00:00'),
    (2, 2, 15.50, 'Webinar 2', 'Programming Fundamentals', 'webinar_link_2', '2024-01-09 14:30:00', 2, '2024-01-09 15:00:00', '2024-01-09 17:00:00'),
    (3, 1, 25.00, 'Webinar 3', 'Mathematics Tricks', 'webinar_link_3', '2024-01-10 10:00:00', 3, '2024-01-10 11:00:00', '2024-01-10 13:00:00'),
    (4, 2, 18.25, 'Webinar 4', 'Introduction to Python', 'webinar_link_4', '2024-01-11 15:30:00', 4, '2024-01-11 16:00:00', '2024-01-11 18:00:00'),
    (5, 1, 30.00, 'Webinar 5', 'Chemistry Concepts', 'webinar_link_5', '2024-01-12 09:00:00', 5, '2024-01-12 10:00:00', '2024-01-12 12:00:00'),
    (6, 2, 12.75, 'Webinar 6', 'Java Basics', 'webinar_link_6', '2024-01-13 19:30:00', 6, '2024-01-13 20:00:00', '2024-01-13 22:00:00'),
    (7, 1, 22.50, 'Webinar 7', 'History Insights', 'webinar_link_7', '2024-01-14 13:00:00', 7, '2024-01-14 14:00:00', '2024-01-14 16:00:00'),
    (8, 2, 30.00, 'Webinar 8', 'Advanced JavaScript', 'webinar_link_8', '2024-01-15 16:45:00', 8, '2024-01-15 17:00:00', '2024-01-15 19:00:00'),
    (9, 1, 17.25, 'Webinar 9', 'Literature Analysis', 'webinar_link_9', '2024-01-16 11:30:00', 9, '2024-01-16 12:00:00', '2024-01-16 14:00:00'),
    (10, 2, 22.75, 'Webinar 10', 'Data Structures Overview', 'webinar_link_10', '2024-01-17 19:15:00', 10, '2024-01-17 19:30:00', '2024-01-17 21:30:00'),
    (11, 1, 28.50, 'Webinar 11', 'Geography Insights', 'webinar_link_11', '2024-01-18 10:45:00', 11, '2024-01-18 11:00:00', '2024-01-18 13:00:00'),
    (12, 2, 16.00, 'Webinar 12', 'Object-Oriented Programming', 'webinar_link_12', '2024-01-19 14:15:00', 12, '2024-01-19 14:30:00', '2024-01-19 16:30:00'),
    (13, 1, 23.25, 'Webinar 13', 'Economics Fundamentals', 'webinar_link_13', '2024-01-20 09:30:00', 13, '2024-01-20 10:00:00', '2024-01-20 12:00:00'),
    (14, 2, 19.75, 'Webinar 14', 'Machine Learning Basics', 'webinar_link_14', '2024-01-21 15:00:00', 14, '2024-01-21 15:30:00', '2024-01-21 17:30:00'),
    (15, 1, 27.50, 'Webinar 15', 'Psychology Insights', 'webinar_link_15', '2024-01-22 12:30:00', 15, '2024-01-22 13:00:00', '2024-01-22 15:00:00'),
    (16, 2, 14.00, 'Webinar 16', 'Database Management', 'webinar_link_16', '2024-01-23 18:00:00', 16, '2024-01-23 18:30:00', '2024-01-23 20:30:00'),
    (17, 1, 21.25, 'Webinar 17', 'Sociology Fundamentals', 'webinar_link_17', '2024-01-24 10:15:00', 17, '2024-01-24 10:30:00', '2024-01-24 12:30:00'),
    (18, 2, 29.75, 'Webinar 18', 'Cybersecurity Essentials', 'webinar_link_18', '2024-01-25 16:00:00', 18, '2024-01-25 16:30:00', '2024-01-25 18:30:00'),
    (19, 1, 15.50, 'Webinar 19', 'Philosophy Overview', 'webinar_link_19', '2024-01-26 11:45:00', 19, '2024-01-26 12:00:00', '2024-01-26 14:00:00'),
    (20, 2, 24.00, 'Webinar 20', 'Software Development Life Cycle', 'webinar_link_20', '2024-01-27 19:30:00', 20, '2024-01-27 20:00:00', '2024-01-27 22:00:00'),
    (21, 1, 18.75, 'Webinar 21', 'Political Science Insights', 'webinar_link_21', '2024-01-28 13:15:00', 21, '2024-01-28 13:30:00', '2024-01-28 15:30:00'),
    (22, 2, 26.25, 'Webinar 22', 'Mobile App Development Basics', 'webinar_link_22', '2024-01-29 15:45:00', 22, '2024-01-29 16:00:00', '2024-01-29 18:00:00'),
    (23, 1, 13.00, 'Webinar 23', 'Environmental Science Fundamentals', 'webinar_link_23', '2024-01-30 10:00:00', 23, '2024-01-30 10:30:00', '2024-01-30 12:30:00'),
    (24, 2, 20.50, 'Webinar 24', 'Artificial Intelligence Overview', 'webinar_link_24', '2024-01-31 16:30:00', 24, '2024-01-31 17:00:00', '2024-01-31 19:00:00'),
    (25, 1, 28.25, 'Webinar 25', 'Cultural Studies', 'webinar_link_25', '2024-02-01 11:15:00', 25, '2024-02-01 11:30:00', '2024-02-01 13:30:00'),
    (26, 2, 16.50, 'Webinar 26', 'Web Development Basics', 'webinar_link_26', '2024-02-02 14:45:00', 26, '2024-02-02 15:00:00', '2024-02-02 17:00:00'),
    (27, 1, 23.00, 'Webinar 27', 'Health Science Insights', 'webinar_link_27', '2024-02-03 12:00:00', 27, '2024-02-03 12:30:00', '2024-02-03 14:30:00'),
    (28, 2, 19.50, 'Webinar 28', 'Network Security Fundamentals', 'webinar_link_28', '2024-02-04 15:15:00', 28, '2024-02-04 15:30:00', '2024-02-04 17:30:00'),
    (29, 1, 27.00, 'Webinar 29', 'Astrophysics Overview', 'webinar_link_29', '2024-02-05 10:30:00', 29, '2024-02-05 11:00:00', '2024-02-05 13:00:00'),
    (30, 2, 15.75, 'Webinar 30', 'Software Testing Essentials', 'webinar_link_30', '2024-02-06 19:00:00', 30, '2024-02-06 19:30:00', '2024-02-06 21:30:00');;

-- Table: webinars_translations
CREATE TABLE webinars_translations (
    webinar_id int  NOT NULL,
    translator_id int  NOT NULL,
    CONSTRAINT webinars_translations_pk PRIMARY KEY  (webinar_id)
);

INSERT INTO webinars_translations (webinar_id, translator_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4),
    (3, 5),
    (3, 6),
    (4, 7);;

-- foreign keys
-- Reference: adress_details_countries_cities (table: adress_details)
ALTER TABLE adress_details ADD CONSTRAINT adress_details_countries_cities
    FOREIGN KEY (country,city)
    REFERENCES countries_cities (country,city);

-- Reference: adress_details_users (table: users)
ALTER TABLE users ADD CONSTRAINT adress_details_users
    FOREIGN KEY (user_id)
    REFERENCES adress_details (user_id);

-- Reference: classroom_details_studies_classroom_classes (table: studies_classroom_classes)
ALTER TABLE studies_classroom_classes ADD CONSTRAINT classroom_details_studies_classroom_classes
    FOREIGN KEY (classroom_id)
    REFERENCES classroom_details (classroom_id);

-- Reference: course_classroom_modules_classroom_details (table: course_classroom_modules)
ALTER TABLE course_classroom_modules ADD CONSTRAINT course_classroom_modules_classroom_details
    FOREIGN KEY (classroom_id)
    REFERENCES classroom_details (classroom_id);

-- Reference: course_modules_course_classroom_modules (table: course_modules)
ALTER TABLE course_modules ADD CONSTRAINT course_modules_course_classroom_modules
    FOREIGN KEY (module_id)
    REFERENCES course_classroom_modules (module_id);

-- Reference: course_modules_course_module_types (table: course_modules)
ALTER TABLE course_modules ADD CONSTRAINT course_modules_course_module_types
    FOREIGN KEY (module_type_id)
    REFERENCES course_module_types (module_type_id);

-- Reference: course_modules_course_online_modules (table: course_modules)
ALTER TABLE course_modules ADD CONSTRAINT course_modules_course_online_modules
    FOREIGN KEY (module_id)
    REFERENCES course_online_modules (module_id);

-- Reference: course_modules_course_presences (table: course_presences)
ALTER TABLE course_presences ADD CONSTRAINT course_modules_course_presences
    FOREIGN KEY (module_id)
    REFERENCES course_modules (module_id);

-- Reference: course_modules_courses (table: course_modules)
ALTER TABLE course_modules ADD CONSTRAINT course_modules_courses
    FOREIGN KEY (course_id)
    REFERENCES courses (course_id);

-- Reference: course_modules_teachers (table: course_modules)
ALTER TABLE course_modules ADD CONSTRAINT course_modules_teachers
    FOREIGN KEY (teacher_id)
    REFERENCES teachers (teacher_id);

-- Reference: course_types_courses (table: courses)
ALTER TABLE courses ADD CONSTRAINT course_types_courses
    FOREIGN KEY (course_type_id)
    REFERENCES course_types (course_type_id);

-- Reference: courses_order_details (table: order_details)
ALTER TABLE order_details ADD CONSTRAINT courses_order_details
    FOREIGN KEY (service_id)
    REFERENCES courses (course_id);

-- Reference: customers_course_presences (table: course_presences)
ALTER TABLE course_presences ADD CONSTRAINT customers_course_presences
    FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id);

-- Reference: customers_studies_presences (table: studies_presences)
ALTER TABLE studies_presences ADD CONSTRAINT customers_studies_presences
    FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id);

-- Reference: customers_users (table: customers)
ALTER TABLE customers ADD CONSTRAINT customers_users
    FOREIGN KEY (user_id)
    REFERENCES users (user_id);

-- Reference: languages_translators (table: translators)
ALTER TABLE translators ADD CONSTRAINT languages_translators
    FOREIGN KEY (language_id)
    REFERENCES languages (language_id);

-- Reference: order_details_orders (table: order_details)
ALTER TABLE order_details ADD CONSTRAINT order_details_orders
    FOREIGN KEY (order_id)
    REFERENCES orders (order_id);

-- Reference: orders_completed_payments (table: completed_payments)
ALTER TABLE completed_payments ADD CONSTRAINT orders_completed_payments
    FOREIGN KEY (order_id)
    REFERENCES orders (order_id);

-- Reference: orders_customers (table: orders)
ALTER TABLE orders ADD CONSTRAINT orders_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id);

-- Reference: pending_payments_orders (table: pending_payments)
ALTER TABLE pending_payments ADD CONSTRAINT pending_payments_orders
    FOREIGN KEY (order_id)
    REFERENCES orders (order_id);

-- Reference: service_types_order_details (table: order_details)
ALTER TABLE order_details ADD CONSTRAINT service_types_order_details
    FOREIGN KEY (service_type_id)
    REFERENCES service_types (service_type_id);

-- Reference: studies_class_translators_studies_classes (table: studies_class_translators)
ALTER TABLE studies_class_translators ADD CONSTRAINT studies_class_translators_studies_classes
    FOREIGN KEY (class_id)
    REFERENCES studies_classes (class_id);

-- Reference: studies_classes_order_details (table: order_details)
ALTER TABLE order_details ADD CONSTRAINT studies_classes_order_details
    FOREIGN KEY (service_id)
    REFERENCES studies_classes (class_id);

-- Reference: studies_classes_studies (table: studies_classes)
ALTER TABLE studies_classes ADD CONSTRAINT studies_classes_studies
    FOREIGN KEY (studies_id)
    REFERENCES studies (studies_id);

-- Reference: studies_modules_studies_classroom_modules (table: studies_classes)
ALTER TABLE studies_classes ADD CONSTRAINT studies_modules_studies_classroom_modules
    FOREIGN KEY (class_id)
    REFERENCES studies_classroom_classes (class_id);

-- Reference: studies_modules_studies_online_modules (table: studies_classes)
ALTER TABLE studies_classes ADD CONSTRAINT studies_modules_studies_online_modules
    FOREIGN KEY (class_id)
    REFERENCES studies_online_classes (class_id);

-- Reference: studies_order_details (table: order_details)
ALTER TABLE order_details ADD CONSTRAINT studies_order_details
    FOREIGN KEY (service_id)
    REFERENCES studies (studies_id);

-- Reference: studies_passes_customers (table: studies_passes)
ALTER TABLE studies_passes ADD CONSTRAINT studies_passes_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers (customer_id);

-- Reference: studies_practice_modules_studies (table: studies_practice_modules)
ALTER TABLE studies_practice_modules ADD CONSTRAINT studies_practice_modules_studies
    FOREIGN KEY (studies_id)
    REFERENCES studies (studies_id);

-- Reference: studies_practice_modules_studies_passes (table: studies_passes)
ALTER TABLE studies_passes ADD CONSTRAINT studies_practice_modules_studies_passes
    FOREIGN KEY (practice_id)
    REFERENCES studies_practice_modules (practice_id);

-- Reference: studies_presences_studies_modules (table: studies_presences)
ALTER TABLE studies_presences ADD CONSTRAINT studies_presences_studies_modules
    FOREIGN KEY (class_id)
    REFERENCES studies_classes (class_id);

-- Reference: studies_prices_studies (table: studies_price_per_classes)
ALTER TABLE studies_price_per_classes ADD CONSTRAINT studies_prices_studies
    FOREIGN KEY (studies_id)
    REFERENCES studies (studies_id);

-- Reference: teachers_studies_classes (table: studies_classes)
ALTER TABLE studies_classes ADD CONSTRAINT teachers_studies_classes
    FOREIGN KEY (teacher_id)
    REFERENCES teachers (teacher_id);

-- Reference: teachers_users (table: teachers)
ALTER TABLE teachers ADD CONSTRAINT teachers_users
    FOREIGN KEY (user_id)
    REFERENCES users (user_id);

-- Reference: translations_course_modules (table: course_translations)
ALTER TABLE course_translations ADD CONSTRAINT translations_course_modules
    FOREIGN KEY (module_id)
    REFERENCES course_modules (module_id);

-- Reference: translators_course_translations (table: course_translations)
ALTER TABLE course_translations ADD CONSTRAINT translators_course_translations
    FOREIGN KEY (translator_id)
    REFERENCES translators (translator_id);

-- Reference: translators_studies_class_translators (table: studies_class_translators)
ALTER TABLE studies_class_translators ADD CONSTRAINT translators_studies_class_translators
    FOREIGN KEY (translator_id)
    REFERENCES translators (translator_id);

-- Reference: translators_teachers (table: translators)
ALTER TABLE translators ADD CONSTRAINT translators_teachers
    FOREIGN KEY (teacher_id)
    REFERENCES teachers (teacher_id);

-- Reference: translators_webinars_transaltions (table: webinars_translations)
ALTER TABLE webinars_translations ADD CONSTRAINT translators_webinars_transaltions
    FOREIGN KEY (translator_id)
    REFERENCES translators (translator_id);

-- Reference: users_user_types (table: users)
ALTER TABLE users ADD CONSTRAINT users_user_types
    FOREIGN KEY (user_type_id)
    REFERENCES user_types (user_type_id);

-- Reference: webinar_types_webinars (table: webinars)
ALTER TABLE webinars ADD CONSTRAINT webinar_types_webinars
    FOREIGN KEY (webinar_type_id)
    REFERENCES webinar_types (webinar_type_id);

-- Reference: webinars_order_details (table: order_details)
ALTER TABLE order_details ADD CONSTRAINT webinars_order_details
    FOREIGN KEY (service_id)
    REFERENCES webinars (webinar_id);

-- Reference: webinars_teachers (table: webinars)
ALTER TABLE webinars ADD CONSTRAINT webinars_teachers
    FOREIGN KEY (teacher_id)
    REFERENCES teachers (teacher_id);

-- Reference: webinars_transaltions_webinars (table: webinars_translations)
ALTER TABLE webinars_translations ADD CONSTRAINT webinars_transaltions_webinars
    FOREIGN KEY (webinar_id)
    REFERENCES webinars (webinar_id);

-- End of file.

