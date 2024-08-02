USE [u_jmrozows]
GO

/****** Object:  View [dbo].[bilocation_raport]    Script Date: 17/01/2024 15:37:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[bilocation_raport] AS -- BT
SELECT    t1.id_klienta AS 'id_klienta',
          /*
          IIF(t1.start_time > t2.start_time, t1.start_time, t2.start_time
          ) AS 'poczatek_kolizji',
          IIF(t1.end_time < t2.end_time, t1.end_time, t2.end_time
          ) AS 'koniec_kolizji',
          */
          t1.id_modulu_nadrzednego AS 'id_modulu_nadrzednego_1',
          t1.nazwa_typu_serwisu AS 'nazwa_typu_serwisu_1',
          t1.tytul_zajec AS 'tytul_zajec_1',
          t1.start_time AS 'poczatek_modulu_1',
          t1.end_time AS 'koniec_modulu_1',
          t2.id_modulu_nadrzednego AS 'id_modulu_nadrzednego_2',
          t2.nazwa_typu_serwisu AS 'nazwa_typu_serwisu_2',
          t2.tytul_zajec AS 'tytul_zajec_2',
          t2.start_time AS 'poczatek_modulu_2',
          t2.end_time AS 'koniec_modulu_2'
FROM      time_table t1
INNER     JOIN time_table t2 ON t1.id_klienta = t2.id_klienta
AND       (
          (t1.id_modulu_nadrzednego = t2.id_modulu_nadrzednego
          AND       t1.nazwa_typu_serwisu >= t2.nazwa_typu_serwisu)
          OR        
          t1.id_modulu_nadrzednego > t2.id_modulu_nadrzednego
          )
WHERE     (
                    -- check if we have the same client_id
                    t1.id_klienta = t2.id_klienta
          AND       (
                    -- check if the service is different (any part of it)
                    t1.id_modulu_nadrzednego != t2.id_modulu_nadrzednego
                    OR        t1.id_zajec != t2.id_zajec
                    OR        t1.nazwa_typu_serwisu != t2.nazwa_typu_serwisu
                    )
          AND       (
                    dbo.fn_two_datetimes_intersect (
                    t1.start_time,
                    t1.end_time,
                    t2.start_time,
                    t2.end_time
                    ) = 1
                    )
          )
GO

