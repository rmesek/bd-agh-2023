USE [u_jmrozows] GO / * * * * * * Object: VIEW [dbo].[time_table] Script DATE: 17 / 01 / 2024 15: 39: 20 * * * * * * /
SET      
ANSI_NULLS ON GO
SET      
QUOTED_IDENTIFIER ON GO
CREATE    VIEW [dbo].[time_table] AS
SELECT    o.customer_id AS 'id_klienta',
          course_id AS 'id_modulu_nadrzednego',
          module_id AS 'id_zajec',
          st.service_type_name AS 'nazwa_typu_serwisu',
          module_title AS 'tytul_zajec',
          start_time,
          end_time
FROM      course_modules
INNER     JOIN order_details od ON od.service_id = course_id
INNER     JOIN orders o ON od.order_id = o.order_id
INNER     JOIN service_types st ON st.service_type_id = od.service_type_id
WHERE     st.service_type_name = 'course'
UNION    
SELECT    o.customer_id,
          webinar_id,
          webinar_id,
          st.service_type_name,
          title,
          start_time,
          end_time
FROM      webinars
INNER     JOIN order_details od ON od.service_id = webinars.webinar_id
INNER     JOIN orders o ON od.order_id = o.order_id
INNER     JOIN service_types st ON st.service_type_id = od.service_type_id
WHERE     st.service_type_name = 'webinar'
UNION    
SELECT    o.customer_id,
          studies_id,
          class_id,
          st.service_type_name,
          title,
          start_time,
          end_time
FROM      studies_classes
INNER     JOIN order_details od ON od.service_id = studies_id
INNER     JOIN orders o ON od.order_id = o.order_id
INNER     JOIN service_types st ON st.service_type_id = od.service_type_id
WHERE     st.service_type_name = 'studies_classes'
OR        st.service_type_name = 'studies'
UNION    
SELECT    o.customer_id,
          studies_id,
          practice_id,
          'practices',
          company_name,
          start_date,
          end_date
FROM      studies_practice_modules
INNER     JOIN order_details od ON od.service_id = studies_id
INNER     JOIN orders o ON od.order_id = o.order_id 
GO 
EXEC sys.sp_addextendedproperty @name = N'MS_DiagramPane1',
          @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[3] 2[27] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -217
         Left = 0
      End
      Begin Tables = 
         Begin Table = "course_modules"
            Begin Extent = 
               Top = 488
               Left = 1125
               Bottom = 651
               Right = 1325
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "courses"
            Begin Extent = 
               Top = 510
               Left = 787
               Bottom = 673
               Right = 981
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "order_details"
            Begin Extent = 
               Top = 224
               Left = 940
               Bottom = 365
               Right = 1134
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "orders"
            Begin Extent = 
               Top = 233
               Left = 448
               Bottom = 374
               Right = 642
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "customers"
            Begin Extent = 
               Top = 247
               Left = 48
               Bottom = 366
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "studies_classes"
            Begin Extent = 
               Top = 455
               Left = 384
               Bottom = 618
               Right = 578
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "studies"
            Begin Extent = 
               Top = 451
               Left = 76
               Bottom = 614
               Right = 270
            End
',
          @level0type = N'SCHEMA',
          @level0name = N'dbo',
          @level1type = N'VIEW',
          @level1name = N'time_table' GO EXEC sys.sp_addextendedproperty @name = N'MS_DiagramPane2',
          @value = N'
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "teachers"
            Begin Extent = 
               Top = 674
               Left = 574
               Bottom = 793
               Right = 768
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "webinars"
            Begin Extent = 
               Top = 618
               Left = 48
               Bottom = 781
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
',
          @level0type = N'SCHEMA',
          @level0name = N'dbo',
          @level1type = N'VIEW',
          @level1name = N'time_table' GO EXEC sys.sp_addextendedproperty @name = N'MS_DiagramPaneCount',
          @value = 2,
          @level0type = N'SCHEMA',
          @level0name = N'dbo',
          @level1type = N'VIEW',
          @level1name = N'time_table' GO
