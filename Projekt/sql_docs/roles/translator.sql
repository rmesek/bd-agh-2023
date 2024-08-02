CREATE ROLE Translator;

-- Dodaj mu widoki
GRANT SELECT ON events TO Translator;

-- Dodaj mu funkcje
GRANT EXECUTE ON fn_get_staff_time_table_for_translator TO Translator;

-- Dodaj mu procedury
GRANT EXECUTE ON usp_change_address TO Translator;
GRANT EXECUTE ON usp_change_user_data TO Translator;