USE [u_jmrozows]
GO

/****** Object:  View [dbo].[orders_for_user]    Script Date: 17/01/2024 15:40:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[orders_for_user]
AS
    SELECT 
    c.customer_id, od.order_id, od.service_id, od.service_type_id, st.service_type_name 
    FROM order_details od
    INNER JOIN service_types st ON st.service_type_id = od.service_type_id
    INNER JOIN orders o ON od.order_id = o.order_id
    INNER JOIN customers c ON o.customer_id = c.customer_id
GO

