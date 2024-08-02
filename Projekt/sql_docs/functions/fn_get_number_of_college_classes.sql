CREATE FUNCTION [dbo].[fn_get_number_of_college_classes](@studies_id int)
RETURNS int AS
    BEGIN
        DECLARE @numberOfClasses int;
        SET @numberOfClasses = (SELECT COUNT(*) FROM dbo.studies_classes
                    WHERE studies_id = @studies_id);
        RETURN @numberOfClasses;
    end
GO
