CREATE ROLE Accountant;

-- Dodaj mu widoki
GRANT SELECT ON debtors TO Accountant;
GRANT SELECT ON events TO Accountant;
GRANT SELECT ON events_purchase_deadline TO Accountant;
GRANT SELECT ON user_completed_payment_details TO Accountant;
GRANT SELECT ON user_pending_payment_details TO Accountant;

-- Dodaj mu funkcje
GRANT EXECUTE ON fn_calc_average_order_value TO Accountant;
GRANT EXECUTE ON fn_calc_enrollment TO Accountant;
GRANT EXECUTE ON fn_get_event_participants_with_access_to TO Accountant;
GRANT EXECUTE ON fn_get_least_expensive_order_price TO Accountant;
GRANT EXECUTE ON fn_get_most_expensive_order_price TO Accountant;

-- Dodaj mu procedury
GRANT EXECUTE ON usp_change_address TO Accountant;
GRANT EXECUTE ON usp_change_user_data TO Accountant;