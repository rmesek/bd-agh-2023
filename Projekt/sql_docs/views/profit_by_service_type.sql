USE [u_jmrozows]
GO

/****** Object:  View [dbo].[profit_by_service_type]    Script Date: 17/01/2024 15:40:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[profit_by_service_type]
AS -- BT
    SELECT od.service_type_id, st.service_type_name,
           SUM(dbo.fn_get_price_of_service(od.service_id, od.service_type_id)) AS 'Zysk'
    FROM order_details od
    INNER JOIN service_types st on od.service_type_id = st.service_type_id
    GROUP BY od.service_type_id, st.service_type_name
GO

