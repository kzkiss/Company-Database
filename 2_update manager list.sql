DROP TRIGGER trig_update_department_manager;

CREATE OR REPLACE TRIGGER trig_update_department_manager
AFTER INSERT OR UPDATE OF is_manager, department_id ON Employees
FOR EACH ROW
BEGIN
    -- Check if is_manager TRUE, if so add to department managers
    IF :NEW.is_manager = 'Yes' THEN
        UPDATE Departments
        SET manager_id = :NEW.employee_id
        WHERE department_id = :NEW.department_id;

    -- Check if is_manager changed from yes to no, if so remove from department managers
    ELSIF :OLD.is_manager = 'Yes' AND :NEW.is_manager = 'No' THEN
        UPDATE Departments
        SET manager_id = NULL
        WHERE department_id = :OLD.department_id
            AND manager_id = :OLD.employee_id;
    END IF;
END;
/    