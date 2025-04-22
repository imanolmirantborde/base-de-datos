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
/*Las condiciones de aislamiento definen el comportamiento
 de la base de datos frente a operaciones simultaneas

  READ COMMITTED (Transaccion 1):

Permite que una transaccion vea solo
los datos que ya fueron
confirmados(committed) por otras transacciones.
Si la segunda transaccion intenta leer o actualizar 
el mismo dato antes de que se haga el COMMIT,
puede ocurrir que lea un dato no actualizado o que espere
Se pueden generar lecturas no repetibles o
 incluso perdida de actualizaciones si no se gestiona 
 bien el orden de commits.


SERIALIZABLE (Transaccion 2):

Asegura que la ejecucion de las transacciones 
sea como si se hubieran hecho en serie.

Si una transaccion está trabajando sobre un registro,
 la otra debe esperar a que se libere el recurso 

Evita conflictos, pero puede generar bloqueos y demoras.

    Por eso, el nivel de aislamiento debe elegirse según
     el nivel de integridad que se requiera
      y la tolerancia a la espera en cada caso.
*/
