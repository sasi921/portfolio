# University Management Database — Oracle SQL

A relational database project for managing core university operations including students, academic records, advisors, departments, courses, enrollment, financial aid, scholarships, events, student organizations, internships, faculty, and alumni outcomes.

## Project Overview

The database was designed as a centralized university information system to reduce duplicated records, improve accessibility, strengthen data integrity, simplify administrative workflows, and support reporting across academic and administrative functions.

The project includes an Enhanced Entity-Relationship Diagram (EERD), normalization to at least Third Normal Form (3NF), Oracle table definitions, sample data, and a collection of tested SQL queries using Oracle Application Express.

## Key Domain Areas

- Student profiles and contact information
- Academic advisors and academic records
- Departments, faculty, courses, and enrollment
- Financial aid and scholarships
- Student organizations and events
- Internship information
- Alumni tracking
- Alumni outcomes: company employment, higher studies, and entrepreneurship
- Department specializations: CSE, ECE, Mechanical, and Electrical

## Database Entities

The implementation includes the following tables:

`Scholarship` · `FinancialAid` · `Advisor` · `Student` · `Internship` · `StudentOrganization` · `Events` · `AcademicRecords` · `Department` · `Faculty` · `Courses` · `EnrollmentOffice` · `Alumni` · `Company` · `Higher_Studies` · `Entrepreneur` · `CSE` · `ECE` · `Mech` · `Electrical`

## Relationship Highlights

The database models relationships such as:

- One advisor advising multiple students
- Students maintaining academic records
- Students enrolling in courses through the enrollment office
- Student participation in organization events
- Department-to-course and department-to-faculty relationships
- Student-to-financial-aid relationships
- Student progression into alumni records
- Alumni specialization into company employment, higher studies, or entrepreneurship

## SQL Skills Demonstrated

The query set demonstrates Oracle SQL features including:

- Multi-table `JOIN`s
- Projection and arithmetic expressions
- Column aliases and concatenation
- `WHERE` filtering
- Comparison and logical operators
- Oracle date functions
- Subqueries and `IN`
- `LIKE`
- Aggregate functions
- `GROUP BY` and `HAVING`
- Conditional `CASE` expressions
- `UNION`
- `MINUS`
- `INTERSECT`

The final report contains at least 15 SELECT-query examples and includes multiple multi-table joins tested in Oracle Application Express.

## Repository Structure

```text
University-Management-Database/
├── README.md
├── sql/
│   ├── schema-and-data.sql
│   └── queries.sql
└── docs/
    └── PROJECT-NOTES.md
```

## Running the Project

This project uses Oracle SQL syntax, including `NUMBER`, `VARCHAR2`, `TO_DATE`, `MINUS`, and other Oracle-specific constructs.

1. Open Oracle SQL Developer, Oracle Database, or Oracle APEX SQL Workshop.
2. Run `sql/schema-and-data.sql` first to create the tables and insert sample data.
3. Run `sql/queries.sql` to execute the sample analytical and reporting queries.

> The scripts are preserved as part of the original academic project. Some sample values and statements reflect the original coursework implementation and may require small adjustments depending on the Oracle environment or constraints in use.

## Business Motivation

The project addresses common university data-management challenges such as data redundancy, inconsistent records, limited accessibility, fragmented alumni and internship tracking, and inefficient event administration. A centralized relational model provides a single source of truth and supports better reporting and decision-making.

## Technologies

- Oracle Database
- Oracle SQL
- Oracle Application Express (APEX)
- Relational Database Design
- EER Modeling
- Third Normal Form (3NF)

## Author

**Sasidhar Reddy Velkuri**

Academic database design and SQL project.