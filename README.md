# 🚗 Vehicle Rental System — Database Project

## 📌 Overview & Objectives

This project evaluates the understanding of **relational database design**, **Entity-Relationship Diagrams (ERDs)**, and **SQL querying techniques**.  
The objective is to design and query a simplified **Vehicle Rental System** database that accurately represents real-world business logic, data integrity, and entity relationships.

---

## 🎯 Learning Outcomes

Upon successful completion of this project, you will be able to:

- Design ERDs with **1:1, 1:N, and N:1** relationships
- Understand and apply **primary key** and **foreign key** constraints
- Write efficient and structured SQL queries using:
  - `JOIN`
  - `EXISTS / NOT EXISTS`
  - `WHERE`
  - `GROUP BY` and `HAVING`

---

## 🗂️ Database Schema

The system consists of **three primary entities**, each designed to ensure normalization and referential integrity.

---

### 👤 Users Table

| Column     | Type    | Constraints       |
| ---------- | ------- | ----------------- |
| u_id       | INT     | Primary Key       |
| u_name     | VARCHAR | —                 |
| u_email    | VARCHAR | Unique            |
| u_password | VARCHAR | —                 |
| u_phone    | VARCHAR | —                 |
| user_role  | VARCHAR | Admin or Customer |

---

### 🚘 Vehicles Table

| Column                | Type    | Constraints                      |
| --------------------- | ------- | -------------------------------- |
| v_id                  | INT     | Primary Key                      |
| v_name                | VARCHAR | —                                |
| v_model               | VARCHAR | —                                |
| v_type                | VARCHAR | —                                |
| v_registration_no     | VARCHAR | Unique                           |
| v_rental_price        | INT     | —                                |
| v_availability_status | VARCHAR | Available / Rented / Maintenance |

---

### 📅 Bookings Table

| Column           | Type    | Constraints                                 |
| ---------------- | ------- | ------------------------------------------- |
| b_id             | INT     | Primary Key                                 |
| u_id             | INT     | Foreign Key → Users(u_id)                   |
| v_id             | INT     | Foreign Key → Vehicles(v_id)                |
| b_start_date     | DATE    | —                                           |
| b_end_date       | DATE    | —                                           |
| b_booking_status | VARCHAR | Pending / Confirmed / Completed / Cancelled |
| b_total_cost     | INT     | —                                           |

---

## 🔗 Entity Relationships

| Relationship        | Cardinality                                      |
| ------------------- | ------------------------------------------------ |
| Users → Bookings    | 1:N (One user can make zero or many bookings)    |
| Vehicles → Bookings | 1:N (One vehicle can have zero or many bookings) |
| Bookings → Users    | N:1 (Many bookings belong to one user)           |
| Bookings → Vehicles | N:1 (Many bookings belong to one vehicle)        |

---

## 🛠️ Technical Stack

- **Database**: PostgreSQL
- **Database Tool**: Beekeeper Studio
- **ERD Design Tool**: DrawSQL

---

## 🧩 ERD Design Reference

The complete ERD diagram with proper relationships was designed using DrawSQL.

🔗 **DrawSQL Project Link**  
👉 https://drawsql.app/teams/krypto-2/diagrams/vehicle-rental-system

---

## 🧪 SQL Queries

---

### 🔹 Query 1: JOIN

**Objective:**  
Retrieve booking information along with customer and vehicle details.

**Explanation:**  
This query uses `INNER JOIN` to combine data from the **bookings**, **users**, and **vehicles** tables.  
It provides a consolidated view of booking records, including:

- Booking ID
- Customer name
- Vehicle name
- Booking start and end dates
- Booking status

---

### 🔹 Query 2: NOT EXISTS

**Objective:**  
Find vehicles that have **never been booked**.

**Explanation:**

- This query identifies vehicles that do not appear in the **bookings** table.
- The `NOT EXISTS` clause checks, for each vehicle, whether a related booking record exists.
- If no matching booking is found, the vehicle is included in the result.

---

### 🔹 Query 3: WHERE

**Objective:**  
Retrieve all **available vehicles of a specific type**.

**Explanation:**  
This query filters the **vehicles** table using the `WHERE` clause with multiple conditions:

- Vehicle type must be `'car'`
- Vehicle status must be `'available'`

This ensures that only vehicles ready for booking are returned.

---

### 🔹 Query 4: GROUP BY with HAVING

**Objective:**  
Find vehicles with **more than two bookings**.

**Explanation:**

- This query groups booking records by vehicle and counts the total number of bookings per vehicle.
- The `HAVING` clause is used to filter aggregated results, returning only vehicles that have been booked **more than two times**.

---

**Designed and implemented by**  
**Md. Masayeakh Islam**
