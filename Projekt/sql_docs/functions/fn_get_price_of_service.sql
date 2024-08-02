CREATE FUNCTION [dbo].[fn_get_price_of_service](@id int, @type_id int)
RETURNS money AS
BEGIN
    DECLARE @price money;
    SELECT @price = (
        CASE
            WHEN @type_id = 1 THEN (
                SELECT price 
                FROM webinars
                WHERE webinars.webinar_id = @id
            )
            WHEN @type_id = 2 THEN (
                SELECT price 
                FROM courses
                WHERE courses.course_id = @id
            )
            WHEN @type_id = 3 THEN (
                SELECT 
                pr.member_price * dbo.fn_get_number_of_college_classes(pr.studies_id) 
                FROM studies
                JOIN dbo.studies_price_per_classes pr 
                ON studies.studies_id = pr.studies_id
                WHERE studies.studies_id = @id
            )
            WHEN @type_id = 4 THEN (
                SELECT pr.non_member_price 
                FROM studies
                JOIN dbo.studies_price_per_classes pr 
                ON studies.studies_id = pr.studies_id
                WHERE studies.studies_id = @id
            )
        END
    );

    RETURN @price;
END;
GO
