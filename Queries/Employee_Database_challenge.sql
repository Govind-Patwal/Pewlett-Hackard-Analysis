-----------------------------------------------------------------------------------
------------- Deliverable 1: The Number of Retiring Employees by Title -------------  
------------------------------------------------------------------------------------
​
-- Creating the table: retirement_titles
SELECT e.emp_no, 
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;
​
-- Check the retirement_titles table
SELECT * FROM retirement_titles;
​
-- Creating the table: unique_titles
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY rt.emp_no, rt.to_date DESC;
​
-- Check the unique_titles table
SELECT * FROM unique_titles;
​
-- Creating the table: retiring_titles
SELECT count(title), 
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;
​
-- Check the retiring_titles table
SELECT * FROM retiring_titles;
​
------------------------------------------------------------------------------------
--------- Deliverable 2: The Employees Eligible for the Mentorship Program ---------
------------------------------------------------------------------------------------
​
-- Creating the mentorship_eligibility table
SELECT DISTINCT ON (e.emp_no) 
	e.emp_no,
	e.first_name, 
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibilty	
FROM employees as e
INNER JOIN dept_employee as de
ON e.emp_no = de.emp_no
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no	
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND de.to_date = '9999-01-01'
ORDER BY e.emp_no;
​
-- Check the mentorship_eligibilty table
SELECT * FROM mentorship_eligibilty;