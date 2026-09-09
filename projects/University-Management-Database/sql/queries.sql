--1. Statement using Projection arithmetic expressions
SELECT 
    s.StudentID, 
    s.FirstName || ' ' || s.LastName AS FullName,
    c.CreditHours * 3 AS TotalCreditHours,
    CASE
        WHEN a.Grade = 'A' THEN 'Excellent'
        WHEN a.Grade = 'B' THEN 'very Good'
        WHEN a.Grade = 'c' THEN 'Good'
        ELSE 'Average or Below'
    END AS GradeDescription
FROM 
    Student s
JOIN 
    AcademicRecords a ON s.StudentID = a.StudentID
JOIN 
    Courses c ON s.FID = c.FID;

--2. Statement Using Alias
SELECT 
    s.FirstName || ' ' || s.LastName AS FullName,
    s.Email AS EmailAddress
FROM 
    Student s;

--3. Statement Using Concatenation
SELECT 
    'Student Name: ' || FirstName || ' ' || LastName AS FullName, 
    'Contact: ' || Contact1 AS Contact
FROM 
    Student;

--4. Statement Using The WHERE Clause
SELECT StudentId, Firstname, department FROM Student
WHERE Department = 'CSE';

--using join and where
SELECT Student.FirstName, Student.LastName, FinancialAid.DueBills
FROM Student
JOIN FinancialAid ON Student.FID = FinancialAid.FID
WHERE FinancialAid.DueBills > 2;

-- Retrieve all students who graduated in the year 2022
SELECT * FROM Student
WHERE StudentID IN (
    SELECT StudentID
    FROM AcademicRecords
    WHERE YearOfPassout = 2022
);

--5. Statement Using Comparison Operations (Greater than…)
SELECT * FROM FinancialAid 
WHERE DueBills > 2;

--using join
SELECT Student.FirstName, Student.LastName, EnrollmentOffice.Semester
FROM Student
JOIN EnrollmentOffice ON Student.StudentID = EnrollmentOffice.StudentID
WHERE EnrollmentOffice.Semester > '4TH';

--6. Statement using Logical Operators (AND|OR)
--Using AND
SELECT StudentId, FirstName, Lastname, Department FROM Student 
WHERE Department = 'CSE' AND AdvisorID = 111;

--Using OR
SELECT StudentID, FirstName, Lastname, Department FROM Student 
WHERE Department = 'ECE' OR Department = 'MECH';

--Using both AND and OR
SELECT Studentid, department, Firstname FROM Student 
WHERE (Department = 'CSE' AND AdvisorID = 111) 
   OR (Department = 'ECE' AND AdvisorID = 122);

--7. Statement Using Date Functions
SELECT * FROM Events
WHERE StartDate >= DATE '2023-01-01' AND EndDate <= DATE '2023-12-31';

-- Retrieve all events that occurred after January 1, 2022
SELECT * FROM Events
WHERE StartDate > TO_DATE('01/01/2022', 'MM/DD/YYYY');

-- Retrieve all interns who started their internship after June 1, 2021
SELECT * FROM Internship
WHERE StartDate > TO_DATE('06/01/2021', 'MM/DD/YYYY');

--8. Statement using IN & Subquery
SELECT StudentID, FirstName, LastName, department
FROM Student
WHERE StudentID IN (
    SELECT eo.StudentID
    FROM EnrollmentOffice eo, Courses c, Department d
    WHERE eo.CourseID = c.CourseID
    AND c.DepartmentID = d.DepartmentID
    AND d.DepartmentName = 'CSE'
);

--using In, Subquery and join
SELECT Student.FirstName, Student.LastName, FinancialAid.DueBills
FROM Student
JOIN FinancialAid ON Student.FID = FinancialAid.FID
WHERE FinancialAid.FID IN (
    SELECT FID
    FROM FinancialAid
    WHERE DueBills < 3
);

--9. Statement using Like OPERATOR
SELECT * FROM Events 
WHERE EventName LIKE '%WELL%';

--10. Statement using AGGREGATION FUNCTIONS & GROUP BY
SELECT Department.DepartmentName, AVG(Courses.CreditHours) AS Avg_CreditHours
FROM Department
JOIN Courses ON Department.DepartmentID = Courses.DepartmentID
GROUP BY Department.DepartmentName;

--11. Statement using GROUP BY & HAVING
SELECT Department.DepartmentName, AVG(Courses.CreditHours) AS Avg_CreditHours
FROM Department
JOIN Courses ON Department.DepartmentID = Courses.DepartmentID
GROUP BY Department.DepartmentName
HAVING AVG(Courses.CreditHours) > 45;

--12. Statement Using Conditional Expressions
SELECT * FROM Higher_Studies
WHERE Continent = 'UNITED STATES';

--conditional expressions using the data from the Entrepreneur table.
SELECT * FROM Entrepreneur
WHERE Btype = 'HOUSING';

--using join
SELECT A.AluminiID, A.GraduationYear, A.EmploymentStatus, A.DegreesObtained, A.StudentID
FROM Alumni A
JOIN Higher_Studies HS ON A.AluminiID = HS.AluminiID
WHERE HS.Continent = 'UNITED STATES';

--13. Statement Using UNION & another statement having the same results using any join
SELECT AcademicRecordsNo, StudentStartDate, StudentEndDate, YearOfPassout, Grade, Transcripts, Blacklogs, StudentID
FROM AcademicRecords
WHERE Grade = 'A'
UNION
SELECT AcademicRecordsNo, StudentStartDate, StudentEndDate, YearOfPassout, Grade, Transcripts, Blacklogs, StudentID
FROM AcademicRecords
WHERE YearOfPassout >= 2020;

--Using JOIN
SELECT AR.AcademicRecordsNo, AR.StudentStartDate, AR.StudentEndDate, AR.YearOfPassout, AR.Grade, AR.Transcripts, AR.Blacklogs, AR.StudentID
FROM AcademicRecords AR
INNER JOIN Student S ON AR.StudentID = S.StudentID
WHERE AR.Grade = 'A' OR AR.YearOfPassout >= 2020;

--14. Statement Using MINUS & another statement having the same results using any join
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName AS Course, d.DepartmentName AS Department
FROM Student s
JOIN EnrollmentOffice eo ON s.StudentID = eo.StudentID
JOIN Courses c ON eo.CourseID = c.CourseID
JOIN Department d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'CSE'
MINUS
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName AS Course, d.DepartmentName AS Department
FROM Student s
JOIN EnrollmentOffice eo ON s.StudentID = eo.StudentID
JOIN Courses c ON eo.CourseID = c.CourseID
JOIN Department d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName != 'CSE';

--using join
SELECT s.StudentID, s.FirstName, s.LastName, c.CourseName AS Course, d.DepartmentName AS Department
FROM Student s
JOIN EnrollmentOffice eo ON s.StudentID = eo.StudentID
JOIN Courses c ON eo.CourseID = c.CourseID
JOIN Department d ON c.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'CSE';

--15. Statement Using INTERSECT & another statement having the same results using any join
SELECT AluminiID AS StudentID
FROM Alumni
INTERSECT
SELECT AluminiID AS StudentID
FROM Higher_Studies;

-- Using JOIN
SELECT DISTINCT a.AluminiID AS StudentID
FROM Alumni a
JOIN Higher_Studies hs ON a.AluminiID = hs.AluminiID;
