BEGIN
    FOR i in 1..120 LOOP
        INSERT INTO Dependents(dependent_id,first_name,date_of_birth,relationship,employee_id)
        VALUES(
            50005+i,
            'Child'||i,
            TO_DATE('1/1/2010','DD/MM/YYYY') + (i*100),
            'Son',
            30000+i
        );
    END LOOP;
END;
/