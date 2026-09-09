# Project Notes

## Purpose

This academic database project models a university information system intended to centralize records that would otherwise be distributed across departments and administrative offices.

The final report identifies several problems with a fragmented environment: redundant and inconsistent data, limited accessibility, difficulty tracking alumni and internships, and inefficient event management. The proposed centralized database is intended to improve operational efficiency, reporting, data integrity, and the student experience.

## Users

The project identifies several user groups:

- Students
- Faculty
- Academic advisors
- Administrators
- Alumni
- Financial aid staff
- Department heads
- Student organization leaders
- Internship office staff

## Business Rules

The report defines rules including:

- Each student has a single academic advisor; one advisor can advise multiple students.
- Students maintain academic records.
- Students enroll in courses through the enrollment office.
- Student organization events are optional to attend.
- Alumni status follows graduation.
- Financial aid may support students and courses.
- Courses are associated with departments.
- Students belong to a department.
- Faculty are associated with departments.

## EER / Relational Design

The model includes Student, Advisor, AcademicRecords, EnrollmentOffice, Courses, Department, Faculty, FinancialAid, Scholarship, Events, StudentOrganization, Internship, Alumni, Company, Higher_Studies, Entrepreneur, and department subtype tables.

The report includes an Enhanced Entity-Relationship Diagram and a relational design normalized to at least Third Normal Form (3NF).

## Oracle Implementation

The schema uses Oracle data types and syntax such as:

- `NUMBER`
- `VARCHAR2`
- `DATE`
- `TO_DATE`
- Primary and foreign key constraints

The original coursework also includes screenshots from Oracle Application Express showing `DESC` output, table records, and query results.

## Query Coverage

The final project demonstrates at least 15 SELECT-query categories, including:

1. Projection and arithmetic expressions
2. Aliases
3. Concatenation
4. WHERE filtering
5. Comparison operators
6. Logical operators
7. Date functions
8. IN and subqueries
9. LIKE
10. Aggregation and GROUP BY
11. GROUP BY with HAVING
12. Conditional expressions
13. UNION and equivalent JOIN logic
14. MINUS and equivalent JOIN logic
15. INTERSECT and equivalent JOIN logic

Many of the examples join Student, AcademicRecords, Courses, Department, EnrollmentOffice, FinancialAid, Alumni, and Higher_Studies.

## Source Report

The original final report is a 44-page academic submission containing the project introduction, business rules, user requirements, EER diagram, normalized relations, Oracle APEX table screenshots, and tested SQL query screenshots.

This Markdown file summarizes that report so the project remains easy to review directly on GitHub.