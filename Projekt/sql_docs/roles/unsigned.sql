--- Klient niezarejestrowany
CREATE ROLE unsigned_customer;

-- Dodaj mu widoki (przeglądanie oferty)
GRANT SELECT ON events TO unsigned_customer;
-- Dodaj mu procedury (możliwość rejestracji)
GRANT EXECUTE ON usp_users_insert TO unsigned_customer