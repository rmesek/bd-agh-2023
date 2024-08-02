CREATE FUNCTION fn_is_passed(@customer_id INT, @service_id INT, @service_type_id INT)
RETURNS BIT AS
BEGIN

     DECLARE @is_passed BIT = CASE

		-- webinary
        WHEN @service_type_id=1 THEN IIF(EXISTS (
			SELECT * 
			FROM dbo.presences_view pv 
			WHERE pv.event_id=@service_id
			AND pv.event_name='webinar'
			AND pv.customer_id=@customer_id 
			AND pv.was_present=1
			), 1, 0)

		-- kursy: 80% modułów
		WHEN @service_type_id=2 THEN IIF(
			(
			SELECT COUNT(*) 
			FROM dbo.presences_view pv 
			WHERE pv.event_id=@service_id 
			AND pv.event_name='course'
			AND pv.customer_id=@customer_id 
			AND pv.was_present=1
			) / 
			NULLIF((
			SELECT COUNT(*) 
			FROM dbo.presences_view pv 
			WHERE pv.event_id=@service_id 
			AND pv.event_name='course'
			AND pv.customer_id=@customer_id), 0) 
			>= 0.8, 1, 0)

		-- studia: 80% ćwiczeń + zaliczone praktyki
		WHEN @service_type_id=3 THEN IIF(
			(
			SELECT COUNT(*) 
			FROM dbo.presences_view pv 
			WHERE pv.event_id=@service_id 
			AND pv.event_name='studies_class'
			AND pv.customer_id=@customer_id 
			AND pv.was_present=1
			) / 
			NULLIF((
			SELECT COUNT(*) 
			FROM dbo.presences_view pv 
			WHERE pv.event_id=@service_id 
			AND pv.event_name='studies_class'
			AND pv.customer_id=@customer_id), 0) >= 0.8
			AND NOT EXISTS (
						SELECT * 
						FROM dbo.presences_view pv 
						WHERE pv.event_id=@service_id
						AND pv.event_name='practice' 
						AND pv.customer_id=@customer_id 
						AND pv.was_present=0
						)
			AND EXISTS (
						SELECT * 
						FROM dbo.presences_view pv 
						WHERE pv.event_id=@service_id
						AND pv.event_name='practice' 
						AND pv.customer_id=@customer_id 
						AND pv.was_present=1
						)
			, 1, 0)

		-- pojedyńcze spotkanie na studiach: obecność
		WHEN @service_type_id=4 THEN IIF(EXISTS (
			SELECT * 
			FROM dbo.presences_view pv 
			WHERE pv.event_id=@service_id 
			AND pv.event_name='studies_class' 
			AND pv.customer_id=@customer_id 
			AND pv.was_present=1
			), 1, 0)
		ELSE 0
    END;

    RETURN @is_passed;
END
GO
