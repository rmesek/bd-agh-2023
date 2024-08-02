--- Dodaj klienta
CREATE ROLE customer

-- Dodaj mu widoki
GRANT SELECT ON events TO customer;
GRANT SELECT ON basket_products TO customer; -- funkcje zrobić
GRANT SELECT ON abssence_list_courses TO customer;
GRANT SELECT ON abssence_list_studies_classes TO customer;
GRANT SELECT ON user_completed_payment_details TO customer; -- to i poniższe zastąpić funkcjami dla danego customer_id
GRANT SELECT ON user_pending_payment_details TO customer;

-- Dodaj mu funkcje
GRANT EXECUTE ON fn_get_bilocation_for_user TO customer;
GRANT EXECUTE ON fn_get_debt_for_user TO customer;
GRANT EXECUTE ON fn_get_presence TO customer;
GRANT EXECUTE ON fn_get_time_table_for_user TO customer;
GRANT EXECUTE ON fn_has_access TO customer;

-- Dodaj mu procedury
GRANT EXECUTE ON usp_orders_insert TO customer;
GRANT EXECUTE ON usp_change_address TO customer;
GRANT EXECUTE ON usp_change_user_data TO customer;
GRANT EXECUTE ON usp_complete_payment TO customer;
GRANT EXECUTE ON usp_delete_pending_order TO customer;