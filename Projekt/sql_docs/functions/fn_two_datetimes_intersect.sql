CREATE FUNCTION [dbo].[fn_two_datetimes_intersect](
    @start1 datetime,
    @end1 datetime,
    @start2 datetime,
    @end2 datetime
)
RETURNS bit AS
    BEGIN
        RETURN IIF(@start1 < @end2 AND @end1 > @start2, 1, 0)
    end
GO
