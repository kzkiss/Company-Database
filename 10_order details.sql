SELECT ord.order_id, cust.customer_id, cust.first_name, NVL(cust.middle_name, '') AS cust_middle_name, cust.last_name, 
prod.product_id, prod.product_name, orddet.amount_ordered, ord.order_status, NVL(ord.shipment_date,'') AS shipment_date

FROM Customers cust
JOIN Orders ord ON cust.customer_id = ord.customer_id
JOIN OrderDetails orddet ON ord.order_id = orddet.order_id
JOIN Products prod ON orddet.product_id = prod.product_id

ORDER BY ord.order_id;