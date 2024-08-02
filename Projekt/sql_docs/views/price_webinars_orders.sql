USE [u_jmrozows]
GO

/****** Object:  View [dbo].[price_webinars_orders]    Script Date: 17/01/2024 15:40:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[price_webinars_orders]
AS
SELECT dbo.customers.customer_id, dbo.webinars.webinar_id, 
dbo.webinars.title, dbo.webinars.price
FROM     dbo.customers INNER JOIN
                  dbo.orders ON dbo.customers.customer_id = dbo.orders.customer_id 
                  INNER JOIN dbo.order_details 
                  ON dbo.orders.order_id = dbo.order_details.order_id 
                  INNER JOIN dbo.courses 
                  ON dbo.order_details.service_id = dbo.courses.course_id 
                  INNER JOIN dbo.course_modules 
                  ON dbo.courses.course_id = dbo.course_modules.course_id 
                  INNER JOIN dbo.webinars 
                  ON dbo.order_details.service_id = dbo.webinars.webinar_id
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[50] 4[11] 2[18] 3) )"
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
      ActivePaneConfig = 8
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "customers"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 126
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "orders"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 148
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "order_details"
            Begin Extent = 
               Top = 7
               Left = 532
               Bottom = 148
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "courses"
            Begin Extent = 
               Top = 7
               Left = 774
               Bottom = 170
               Right = 968
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "course_modules"
            Begin Extent = 
               Top = 7
               Left = 1016
               Bottom = 170
               Right = 1216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "webinars"
            Begin Extent = 
               Top = 216
               Left = 779
               Bottom = 379
               Right = 981
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'price_webinars_orders'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'price_webinars_orders'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'price_webinars_orders'
GO

