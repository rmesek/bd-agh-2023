--- Dyrektor
CREATE ROLE principal;

--- Dyrektor ma uprawnienia administratora, co pozwala mu na calkowitą kontrolę nad dbo
GRANT ALL PRIVILEGES ON u_jmrozows TO principal;