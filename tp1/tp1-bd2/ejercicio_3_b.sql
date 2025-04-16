-- aislamiento serializable
--  impone el mayor nivel de control para evitar interferencias (puede bloquear otras)
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

START TRANSACTION;

-- Leer saldo de la cuenta con id = 1
SELECT saldo FROM cuentas WHERE id = 1;

-- Sumar 50
UPDATE cuentas
SET saldo = saldo + 50
WHERE id = 1;


COMMIT;