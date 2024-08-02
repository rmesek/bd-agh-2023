CREATE TYPE INSTALMENTS_TABLE_TYPE AS TABLE (
    instalment_id INT IDENTITY(0,1),
    instalment MONEY,
    payment_due DATETIME,
    payment_link VARCHAR(MAX)
)