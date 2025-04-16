-- Ejercicio 3: Concurrencia
CREATE TABLE cuentas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    saldo DECIMAL(10,2) NOT NULL
);
INSERT INTO cuentas (saldo) VALUES (1000.00), (2000.00), (3000.00);
--  nivel de aislamiento read commited
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

START TRANSACTION;

-- Leer saldo de la cuenta con id = 1
SELECT saldo FROM cuentas WHERE id = 1;

-- Sumar 100
UPDATE cuentas
SET saldo = saldo +100
WHERE id = 1;

-- no hago commit, es decir:
-- Ahora la transaccion esta activa pero sin confirmar
-- los cambios estan hechos solo para esta sesion
 
-- luego
commit;
-- consulto resultado final
SELECT * FROM cuentas WHERE id = 1;



