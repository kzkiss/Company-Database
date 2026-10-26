SELECT emp.employee_id, emp.first_name, emp.middle_name, emp.last_name, emp.department_id,
    mgr.first_name AS manager_first_name, mgr.middle_name AS manager_middle_name,mgr.last_name AS manager_last_name,
    NVL(SUM(weekhrs.number_of_hours), 0) AS total_weekly_hours

FROM Employees emp
JOIN Departments dept ON emp.department_id = dept.department_id
LEFT JOIN Employees mgr ON dept.manager_id = mgr.employee_id
LEFT Join WeeklyHours weekhrs ON emp.employee_id = weekhrs.employee_id

GROUP BY emp.employee_id, emp.first_name, emp.middle_name, emp.last_name, emp.department_id,
    mgr.first_name, mgr.middle_name, mgr.last_name
ORDER BY total_weekly_hours DESC;