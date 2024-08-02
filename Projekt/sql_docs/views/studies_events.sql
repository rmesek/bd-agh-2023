USE [u_jmrozows]
GO

/****** Object:  View [dbo].[studies_events]    Script Date: 17/01/2024 15:39:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[studies_events] -- BT
AS
    SELECT class_id, studies_id, dbo.fn_get_study_class_type(sc.class_id) as 'class_type',
           title, teacher_id, start_time, end_time from studies_classes sc
GO

