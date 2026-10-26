SELECT proj.project_id, proj.project_name, dpt.department_name, SUM(weekhrs.number_of_hours) as total_weekly_hours
FROM Projects proj
JOIN Departments dpt ON proj.department_id = dpt.department_id
JOIN WeeklyHours weekhrs ON proj.project_id = weekhrs.project_id
GROUP BY proj.project_id, proj.project_name, dpt.department_name
ORDER BY total_weekly_hours DESC;