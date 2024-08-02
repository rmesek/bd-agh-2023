USE [u_jmrozows]
GO

/****** Object:  View [dbo].[price_for_customers_order]    Script Date: 17/01/2024 15:40:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[price_for_customers_order]
AS
SELECT dbo.customers.customer_id, dbo.orders.order_id, 
SUM(dbo.price_studies_orders.member_price) 
AS Per_module_for_member, SUM(dbo.price_studies_orders.non_member_price) 
AS Per_module_for_nonmember, 
SUM(dbo.price_courses_orders.price) 
AS [for courses], SUM(dbo.price_webinars_orders.price) AS [for webinars]
FROM     dbo.customers INNER JOIN
                  dbo.price_courses_orders 
                  ON dbo.customers.customer_id = dbo.price_courses_orders.customer_id 
                  INNER JOIN dbo.price_studies_orders 
                  ON dbo.customers.customer_id = dbo.price_studies_orders.customer_id 
                  INNER JOIN dbo.price_webinars_orders 
                  ON dbo.customers.customer_id = dbo.price_webinars_orders.customer_id 
                  INNER JOIN dbo.orders 
                  ON dbo.customers.customer_id = dbo.orders.customer_id
GROUP BY dbo.orders.order_id, dbo.customers.customer_id
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[29] 2[21] 3) )"
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
         Top = -240
         Left = 0
      End
      Begin Tables = 
         Begin Table = "customers"
            Begin Extent = 
               Top = 0
               Left = 25
               Bottom = 119
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "price_courses_orders"
            Begin Extent = 
               Top = 106
               Left = 599
               Bottom = 269
               Right = 793
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "price_webinars_orders"
            Begin Extent = 
               Top = 7
               Left = 801
               Bottom = 170
               Right = 995
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "orders"
            Begin Extent = 
               Top = 7
               Left = 267
               Bottom = 148
               Right = 461
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "price_studies_orders"
            Begin Extent = 
               Top = 178
               Left = 218
               Bottom = 341
               Right = 439
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
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
         Or = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'price_for_customers_order'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'price_for_customers_order'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'price_for_customers_order'
GO

