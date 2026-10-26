DECLARE
 --store order date and shipment date as variables. This is required to ensure shipment date is always later or same as order date
    v_order_date DATE; 
    v_shipment_date DATE;
BEGIN
    FOR i IN 1..650 LOOP 
    v_order_date := TRUNC(SYSDATE - TRUNC(DBMS_RANDOM.VALUE(1,365))); --random date in last year
    v_shipment_date := v_order_date + TRUNC(DBMS_RANDOM.VALUE(1,121)); --random date max 4 months later than order date 

    INSERT INTO Orders(order_id,customer_id,order_date,order_status,shipment_date
    ) VALUES (
        70006 + i,
        --Assign order to one of the already existing customers
        TRUNC(DBMS_RANDOM.VALUE (50001,50305)),
        v_order_date,
        CASE
            WHEN MOD(i,3)=0 THEN 'Completed' 
            WHEN MOD(i,3)=1 THEN 'Dispatched'
            ELSE 'Not dispatched'
        END,
        -- Only set shipment date if status is completed or dispatched
        CASE 
            WHEN MOD(i,3)<2 THEN v_shipment_date
            ELSE NULL
        END
        );
    END LOOP;
END;
/
