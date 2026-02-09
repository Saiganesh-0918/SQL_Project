Banking SQL Database Project
Overview

This project demonstrates the design and implementation of a relational banking database system using SQL. It includes database creation, data loading, indexing, query execution, and advanced SQL concepts such as joins, CTEs, stored procedures, views, and window functions.

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

SQL (MySQL / PostgreSQL)

Relational Database Concepts

Data Modeling

Features Implemented

Database Creation and Table Design

Data Import from CSV Files

Basic and Advanced SQL Queries

Joins and Aggregations

Indexing for Performance Optimization

Views and Stored Procedures

Common Table Expressions (CTE)

Window Functions

How to Run the Project
Step 1: Create Database

Run the script located at:
creation/database.sql

Step 2: Create Tables

Run the script located at:
creation/tables.sql

Step 3: Load Data

Run the script located at:
load/data.sql

(Ensure CSV file paths are correctly configured in the script)

Step 4: Execute Queries

Run individual SQL files inside the operations folder or execute the master script:
exec.sql

Learning Outcomes

Practical experience in relational database design

Writing optimized SQL queries

Implementing advanced SQL concepts

Managing structured datasets

Use Case

This project simulates a Banking Database System used to manage customers, accounts, and transaction data.

Future Improvements

Add ER Diagram

Implement triggers

Connect with reporting or visualization tools
