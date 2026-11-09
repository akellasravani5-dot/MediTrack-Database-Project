create database meditrack_db;
use meditrack_db;
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(20),
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(100),
    address VARCHAR(255)
);

CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    speciality VARCHAR(100),
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(100),
    consultation_fee DECIMAL(10,2)
);

CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    reason VARCHAR(255),
    status VARCHAR(30),
    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id)
        REFERENCES doctors(doctor_id)
);

CREATE TABLE medicines (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100),
    manufacturer VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2),
    reorder_level INT
);

CREATE TABLE prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT,
    prescribed_on DATE,
    notes VARCHAR(255),
    FOREIGN KEY (appointment_id)
        REFERENCES appointments(appointment_id)
);

CREATE TABLE prescription_items (
    prescription_item_id INT AUTO_INCREMENT PRIMARY KEY,
    prescription_id INT,
    medicine_id INT,
    dosage VARCHAR(100),
    frequency VARCHAR(100),
    duration_days INT,
    quantity INT,
    FOREIGN KEY (prescription_id)
        REFERENCES prescriptions(prescription_id),
    FOREIGN KEY (medicine_id)
        REFERENCES medicines(medicine_id)
);

CREATE TABLE inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_id INT,
    batch_number VARCHAR(50),
    quantity_in_stock INT,
    expiry_date DATE,
    FOREIGN KEY (medicine_id)
        REFERENCES medicines(medicine_id)
);

CREATE TABLE invoices (
    invoice_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT UNIQUE,
    invoice_date DATE,
    consultation_charge DECIMAL(10,2),
    medicine_charge DECIMAL(10,2),
    other_charge DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    invoice_status VARCHAR(30),
    FOREIGN KEY (appointment_id)
        REFERENCES appointments(appointment_id)
);

CREATE TABLE payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_id INT,
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    reference_number VARCHAR(100),
    FOREIGN KEY (invoice_id)
        REFERENCES invoices(invoice_id)
);

INSERT INTO patients
(first_name,last_name,date_of_birth,gender,phone,email,address)
VALUES
('Asha','Reddy','2001-04-12','Female','9000000001','asha@gmail.com','Hyderabad'),
('Rahul','Kumar','1998-09-20','Male','9000000002','rahul@gmail.com','Secunderabad'),
('Priya','Sharma','2000-05-15','Female','9000000003','priya@gmail.com','Kukatpally'),
('Arun','Verma','1995-12-10','Male','9000000004','arun@gmail.com','Miyapur'),
('Sneha','Rao','2002-07-25','Female','9000000005','sneha@gmail.com','Madhapur');

INSERT INTO doctors
(first_name,last_name,speciality,phone,email,consultation_fee)
VALUES
('Meera','Shah','General Physician','9111111111','meera@gmail.com',500),
('Arjun','Rao','Dermatologist','9222222222','arjun@gmail.com',700),
('Kiran','Kumar','Cardiologist','9333333333','kiran@gmail.com',1000),
('Anita','Devi','Pediatrician','9444444444','anita@gmail.com',600),
('Raj','Sharma','Neurologist','9555555555','raj@gmail.com',900);

INSERT INTO medicines
(medicine_name,manufacturer,category,unit_price,reorder_level)
VALUES
('Paracetamol','ABC Pharma','Pain Relief',2.50,20),
('Cetirizine','XYZ Pharma','Allergy',3.00,15),
('Vitamin C','Health Labs','Supplement',5.00,10),
('Antacid','MediCare','Digestive',4.00,20),
('Cough Syrup','ABC Pharma','Cold',80.00,10);

INSERT INTO appointments
(patient_id,doctor_id,appointment_date,appointment_time,reason,status)
VALUES
(1,1,'2026-11-10','10:00:00','Fever','Scheduled'),
(2,2,'2026-11-10','11:00:00','Skin allergy','Scheduled'),
(3,3,'2026-11-11','12:00:00','Heart checkup','Scheduled'),
(4,4,'2026-11-12','10:30:00','Child health','Completed'),
(5,5,'2026-11-13','14:00:00','Headache','Scheduled');

INSERT INTO prescriptions
(appointment_id,prescribed_on,notes)
VALUES
(1,'2026-11-10','Follow doctor instructions'),
(2,'2026-11-10','Allergy treatment'),
(3,'2026-11-11','Regular monitoring'),
(4,'2026-11-12','Routine care'),
(5,'2026-11-13','Follow-up advised');

INSERT INTO prescription_items
(prescription_id,medicine_id,dosage,frequency,duration_days,quantity)
VALUES
(1,1,'500 mg','As prescribed',3,6),
(2,2,'10 mg','As prescribed',5,5),
(3,3,'500 mg','As prescribed',7,7),
(4,4,'As prescribed','As prescribed',3,3),
(5,5,'As prescribed','As prescribed',5,1);

INSERT INTO inventory
(medicine_id,batch_number,quantity_in_stock,expiry_date)
VALUES
(1,'PCM101',100,'2027-12-31'),
(2,'CET202',60,'2027-06-30'),
(3,'VIT303',80,'2027-09-30'),
(4,'ANT404',50,'2027-11-30'),
(5,'COU505',30,'2027-10-31');

INSERT INTO invoices
(appointment_id,invoice_date,consultation_charge,
 medicine_charge,other_charge,total_amount,invoice_status)
VALUES
(1,'2026-11-10',500,40,0,540,'Partially Paid'),
(2,'2026-11-10',700,15,0,715,'Unpaid'),
(3,'2026-11-11',1000,35,0,1035,'Paid'),
(4,'2026-11-12',600,20,0,620,'Paid'),
(5,'2026-11-13',900,80,0,980,'Unpaid');

INSERT INTO payments
(invoice_id,payment_date,amount,payment_method,reference_number)
VALUES
(1,'2026-11-10',200,'UPI','UPI001'),
(3,'2026-11-11',1035,'Cash','CASH001'),
(4,'2026-11-12',620,'Card','CARD001');

Quries: 
Query-1:
SELECT * FROM patients;

Query:2
SELECT * FROM doctors;

Query: 3
SELECT * FROM appointments;

Query:4
SELECT * FROM medicines;

Query:5
SELECT * FROM prescriptions;

Query:6
SELECT * FROM inventory;

Query:7
SELECT * FROM invoices;

Query:8
SELECT * FROM payments;

Query:9
SELECT first_name,last_name,phone FROM patients;

Query:10
SELECT medicine_name,unit_price FROM medicines;

Query:11
SELECT * FROM patients
WHERE gender='Female';

Query:12
SELECT * FROM doctors
WHERE speciality='Cardiologist';

Query:13
SELECT * FROM medicines
WHERE unit_price > 10;

Query:14
SELECT * FROM appointments
WHERE status='Scheduled';

Query:15
SELECT * FROM patients
ORDER BY first_name ASC;

Query:16
SELECT * FROM doctors
ORDER BY consultation_fee DESC;

Query:17
SELECT * FROM medicines
WHERE medicine_name LIKE 'C%';

Query:18
SELECT * FROM appointments
WHERE appointment_date='2026-11-10';

Query:19
SELECT * FROM invoices
WHERE invoice_status='Unpaid';

Query:20
SELECT * FROM inventory
WHERE quantity_in_stock < 50;11
SELECT * FROM patients
WHERE gender='Female';

Query:21
SELECT COUNT(*) AS total_patients
FROM patients;

Query: 22
SELECT COUNT(*) AS total_doctors
FROM doctors;

Query:23
SELECT AVG(consultation_fee)
FROM doctors;

Query:24
SELECT MAX(unit_price)
FROM medicines;

Query:25
SELECT MIN(unit_price)
FROM medicines;

Query:26
SELECT SUM(total_amount)
FROM invoices;

Query:27
SELECT COUNT(*) AS total_appointments
FROM appointments;

Query:28
SELECT payment_method,SUM(amount)
FROM payments
GROUP BY payment_method;

Query:29
SELECT status,COUNT(*)
FROM appointments
GROUP BY status;

Query:30
SELECT invoice_status,COUNT(*)
FROM invoices
GROUP BY invoice_status;21
SELECT COUNT(*) AS total_patients
FROM patients;

