CREATE FUNCTION [dbo].[fn_get_event_participants_with_access_to](@service_id int, @service_type nvarchar(MAX))
RETURNS TABLE AS RETURN
    SELECT customer_id,
           service_id,
           service_type,
           [online/stationary],
           price,
           title,
           start_time,
           end_time
    from event_participants
    WHERE service_id=@service_id AND service_type=@service_type AND has_access=1
GO

