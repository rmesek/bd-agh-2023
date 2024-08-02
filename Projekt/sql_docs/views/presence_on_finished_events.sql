USE [u_jmrozows]
GO

/****** Object:  View [dbo].[presence_on_finished_events]    Script Date: 17/01/2024 15:41:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[presence_on_finished_events] AS -- BT
    SELECT service_id, service_type_name, rodzaj_uslugi, customer_id,
           dbo.fn_get_presence(customer_id,
           service_id, service_type_id) as 'was_present'
           from dbo.event_participants
    WHERE ( service_type_id = 2 OR service_type_id = 4 )
GO

