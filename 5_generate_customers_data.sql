BEGIN
    FOR i in 1..300 LOOP
        INSERT INTO Customers (
        customer_id,first_name,middle_name,last_name,email,phone,address_line_1,address_line_2,town,postcode,is_billing_address_same,
        billing_address_line_1,billing_address_line_2,billing_town,billing_postcode,salesperson_assigned)
        VALUES(
            -- assign new customer_id
            50005+i,
            -- assign generic name to cust,  add in a middle name on every 5th iteration
            'Customer'||i,
            CASE WHEN MOD(i,5)=0 THEN 'Middle'||i ELSE NULL END,
            'Test'||i,
            -- assing email address
            LOWER('customer'||i||'@company.com'),
            --assign random phone number starting with 07 (UK mobile number format)
            '07'|| TRUNC(DBMS_RANDOM.VALUE(100000000,999999999)),
            -- assign address in either Edinburgh or Glasgow, add in flat number on every 6th iteration
            i||'Street',
            CASE WHEN MOD(i,6)=0 THEN 'Flat'||i ELSE NULL END,
            CASE WHEN MOD(i,2)=0 THEN 'Glasgow' ELSE 'Edinburgh' END,
            -- generate realsitic looking postcode for either Edinburgh or Glasgow. CHR values correspond to ASCII characters.
            CASE WHEN MOD(i,2)=0 
                THEN 'G'||TRUNC(DBMS_RANDOM.VALUE(10,99))||' '
                ||TRUNC(DBMS_RANDOM.VALUE(1,20))||CHR(TRUNC(DBMS_RANDOM.VALUE(65,91)))||CHR(TRUNC(DBMS_RANDOM.VALUE(65,91)))
            ELSE
                'EH'||TRUNC(DBMS_RANDOM.VALUE(10,99))||' '
                ||TRUNC(DBMS_RANDOM.VALUE(1,20))||CHR(TRUNC(DBMS_RANDOM.VALUE(65,91)))||CHR(TRUNC(DBMS_RANDOM.VALUE(65,91)))
            END,
            -- mark billing address as yes, fill billing address details with NULL
            'Yes', NULL, NULL, NULL, NULL,
            -- assign random salesperson
            TRUNC(DBMS_RANDOM.VALUE(30001,30006))
        );  
    END LOOP;
END;
/