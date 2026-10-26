CREATE SEQUENCE orders_seq
START WITH 70005 INCREMENT BY 1 NOCACHE;

CREATE OR REPLACE PROCEDURE place_order (
    p_customer_id IN NUMBER,
    p_product_id IN NUMBER,
    p_amount_ordered IN NUMBER 
)
IS
    v_total_stock NUMBER := 0;
    v_reserved_stock NUMBER := 0;
    v_available_stock NUMBER := 0;
    v_new_order_id NUMBER;
BEGIN
    -- Check total stock for product across all warehouses
    SELECT NVL(SUM(amount_available),0) INTO v_total_stock FROM AvailableStock WHERE product_id = p_product_id;

    -- Check reserved stock for orders already on system
    SELECT NVL(SUM(orddet.amount_ordered),0) INTO v_reserved_stock FROM OrderDetails orddet JOIN Orders ord ON orddet.order_id = ord.order_id 
        WHERE orddet.product_id = p_product_id AND ord.order_status = 'Not dispatched';

    -- Calculate available stock
    v_available_stock := v_total_stock - v_reserved_stock;

    -- Check new order against results, accept or reject accordingly
    IF p_amount_ordered > v_available_stock THEN RAISE_APPLICATION_ERROR(-20001, 'Unable to fulfill order, insufficient stock avaialble. Availalbe amount:' || v_available_stock);
    END IF;
    
    -- Create order_id for new order from sequence
    SELECT orders_seq.NEXTVAL INTO v_new_order_id FROM dual;

    -- Insert new order into Orders
    INSERT INTO Orders (order_id,customer_id,order_date,order_status,shipment_date)
    VALUES (v_new_order_id,p_customer_id,SYSDATE,'Not dispatched',NULL);

    -- Insert new order into OrderDetails
    INSERT INTO OrderDetails (order_id,product_id,amount_ordered)
    VALUES (v_new_order_id,p_product_id,p_amount_ordered);

    COMMIT;

END;
/