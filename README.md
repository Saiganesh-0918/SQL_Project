Banking SQL Database Project
Overview

This project demonstrates the design and implementation of a relational banking database system using SQL.
It covers database creation, data loading, indexing, query execution, and advanced SQL concepts such as joins, CTEs, stored procedures, views, and window functions.

The project simulates real-world banking operations using datasets related to customers, accounts, and transactions.

Project Objectives

Design a normalized relational database

Load structured CSV data into tables

Perform analytical and operational SQL queries

Demonstrate enterprise-level SQL features

Project Structure
SQL_PROJECT
│
├── creation
│   ├── database.sql
│   └── tables.sql
│
├── data
│   ├── accounts.csv
│   ├── customers.csv
│   └── transactions.csv
│
├── load
│   └── data.sql
│
├── operations
│   ├── basic_queries.sql
│   ├── joins.sql
│   ├── cte.sql
│   ├── indexes.sql
│   ├── procedure.sql
│   ├── view.sql
│   └── w_functions.sql
│
└── exec.sql

Technologies Used

SQL (MySQL / PostgreSQL compatible syntax)

Relational Database Concepts

Data Modeling

Features Implemented

Database creation and table design

Data import from CSV files

Basic and advanced SQL queries

Joins and aggregations

Indexing for performance optimization

Views and stored procedures

Common Table Expressions (CTE)

Window functions

How to Run the Project (Local SQL)
Step 1: Create Database

Run:

creation/database.sql

Step 2: Create Tables

Run:

creation/tables.sql

Step 3: Load Data

Run:

load/data.sql


Ensure CSV file paths are correctly configured in the script.

Step 4: Execute Queries

Run individual SQL files from the operations folder
or run the master script:

exec.sql

Running the Project Using Docker (Recommended)

This project can be executed without installing MySQL locally using Docker.

Prerequisites

Docker installed on the system

Git (optional)

Steps

1. Run MySQL container

docker run -d \
  --name mysql-db \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=banking_db \
  -p 3306:3306 \
  mysql:8.0


2. Copy project into container

docker cp SQL_Project mysql-db:/sql_project


3. Enter the container

docker exec -it mysql-db bash


4. Start MySQL with local file loading enabled

mysql --local-infile=1 -u root -proot


5. Enable local infile

SET GLOBAL local_infile = 1;


6. Execute the project

SOURCE exec.sql;

Learning Outcomes

Practical experience in relational database design

Writing optimized SQL queries

Using advanced SQL concepts

Managing structured datasets

Running databases using Docker containers

Use Case

This project simulates a banking database system used to manage customers, accounts, and transaction data.

Future Improvements

Add ER diagram

Implement triggers

Connect with reporting or visualization tools