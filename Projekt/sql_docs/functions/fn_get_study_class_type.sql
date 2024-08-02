CREATE FUNCTION [dbo].[fn_get_study_class_type](@class_id int) --BT
RETURNS nvarchar(MAX) AS
    BEGIN
        DECLARE @class_type nvarchar(MAX);
        IF EXISTS (SELECT class_id FROM studies_online_classes WHERE class_id = @class_id)
        BEGIN
            SET @class_type = 'Online';
        end
        ELSE
        BEGIN
            SET @class_type = 'Stationary'
        end
        RETURN @class_type;
    end
GO
