CREATE ROLE Teacher;

-- Dodaj mu widoki
GRANT SELECT ON events TO Teacher;
GRANT SELECT ON abssence_list_courses TO Teacher;
GRANT SELECT ON abssence_list_studies_classes TO Teacher;

-- Dodaj mu funkcje
GRANT EXECUTE ON dbo.fn_get_presence TO Teacher;
GRANT EXECUTE ON dbo.fn_get_staff_time_table_for_teacher TO Teacher;
GRANT EXECUTE ON dbo.fn_get_event_participants_with_access_to TO Teacher;

-- Dodaj mu procedury
GRANT EXECUTE ON usp_change_address To Teacher;
GRANT EXECUTE ON usp_change_user_data To Teacher;
GRANT EXECUTE ON usp_add_presence TO Teacher;