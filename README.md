# Farm-Inventory

---

# 🐔 Farm Inventory & Production Tracking System

This project is a **complete relational database design** implemented in **MySQL** for managing poultry farm operations. It tracks key components such as farms, houses, chicken batches, feed usage, egg production, staff roles, vaccinations, and mortality records.

---

## 📌 Objective

To design and implement a full-featured **Database Management System (DBMS)** using **only SQL (MySQL)**, following relational database best practices and including:

* Table creation with proper **constraints** (`PRIMARY KEY`, `FOREIGN KEY`, `NOT NULL`, `UNIQUE`)
* Logical **entity relationships** (1–1, 1–M, M–M)
* Use of **CHECK** constraints, **defaults**, and **normalized design**

---

## 🧱 Database Schema Overview

### **Main Entities:**

| Table               | Description                             |
| ------------------- | --------------------------------------- |
| `Farms`             | Stores farm information                 |
| `Houses`            | Chicken houses in each farm             |
| `Chicken_Batches`   | Batches of chickens by breed and house  |
| `Feeds`             | Types of feed used per batch            |
| `Feed_Usage`        | Track daily feed consumption (M–M)      |
| `Egg_Production`    | Daily egg production logs               |
| `Vaccinations`      | Vaccination events for each batch       |
| `Mortality_Records` | Tracks deaths per batch and cause       |
| `Suppliers`         | Feed and input suppliers                |
| `Users`             | Staff members of the farm               |
| `Roles`             | Role types (Admin, Worker, Vet, etc.)   |
| `User_Roles`        | Many-to-many mapping of users and roles |

---

## 🔄 Relationships

* **1 Farm → Many Houses**
* **1 House → Many Chicken Batches**
* **1 Batch → Many Feed Usage Logs**
* **1 Batch → Many Egg Production Records**
* **1 Batch → Many Vaccinations**
* **1 Batch → Many Mortality Records**
* **Many Users ↔ Many Roles** via `User_Roles`
* **Many Feeds ↔ Many Batches** via `Feed_Usage`
* **1 Supplier → Many Feeds**

---

## 📁 Files Included

| File                 | Description                                                                            |
| -------------------- | -------------------------------------------------------------------------------------- |
| `farm_inventory.sql` | SQL script containing all `CREATE TABLE` statements with constraints and relationships |
| `README.md`          | Project documentation and schema overview                                              |

---

## ⚙️ How to Run

1. Open MySQL Workbench, phpMyAdmin, or any MySQL client.
2. Run the following commands:

```sql
SOURCE path/to/farm_inventory.sql;
```

> Replace `path/to/` with the actual file path.

3. The database `farm_inventory` will be created with all required tables.

---

## ✅ Features Demonstrated

* ✅ Normalized Relational Design
* ✅ Primary & Foreign Keys
* ✅ One-to-Many and Many-to-Many Relationships
* ✅ CHECK and DEFAULT constraints
* ✅ Role-based user management (M–M)

---
