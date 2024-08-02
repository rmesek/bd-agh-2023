USE [u_jmrozows]
GO

/****** Object:  View [dbo].[abssence_list_studies_classes]    Script Date: 17/01/2024 15:37:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[abssence_list_studies_classes]
AS
SELECT 
dbo.studies_classes.title, dbo.studies_classes.studies_id, dbo.studies_classes.class_id, 
dbo.users.last_name, dbo.users.first_name
FROM     dbo.orders INNER JOIN
                  dbo.order_details ON dbo.orders.order_id = dbo.order_details.order_id 
                  INNER JOIN
                  dbo.customers ON dbo.orders.customer_id = dbo.customers.customer_id 
                  INNER JOIN
                  dbo.studies_classes 
                  ON dbo.order_details.service_id = dbo.studies_classes.class_id 
                  INNER JOIN dbo.studies 
                  ON dbo.studies_classes.studies_id = dbo.studies.studies_id 
                  INNER JOIN
                  dbo.users ON dbo.customers.user_id = dbo.users.user_id
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
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
         Configuration = "(H (1[75] 4) )"
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
      ActivePaneConfig = 9
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "orders"
            Begin Extent = 
               Top = 11
               Left = 0
               Bottom = 152
               Right = 194
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "order_details"
            Begin Extent = 
               Top = 7
               Left = 290
               Bottom = 148
               Right = 484
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "users"
            Begin Extent = 
               Top = 167
               Left = 289
               Bottom = 330
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "customers"
            Begin Extent = 
               Top = 235
               Left = 67
               Bottom = 354
               Right = 261
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "studies"
            Begin Extent = 
               Top = 340
               Left = 318
               Bottom = 503
               Right = 512
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "studies_classes"
            Begin Extent = 
               Top = 175
               Left = 532
               Bottom = 338
               Right = 726
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
      PaneHidden = 
   End
   Begin DataPane = 
      PaneHidden = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin Co' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'abssence_list_studies_classes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'lumnWidths = 11
         Column = 1440
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'abssence_list_studies_classes'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'abssence_list_studies_classes'
GO

