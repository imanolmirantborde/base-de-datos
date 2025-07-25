const readline = require('readline');
const conectarDB = require('../config/db');
const { prestarLibro } = require('../controllers/prestamoController');

const rl = readline.createInterface({
  input: process.stdin, //lee los datos ingresados 
  output: process.stdout // muestra preguntas y resultados por consola
});

(async () => {
  await conectarDB();

  rl.question('ISBN del libro a prestar: ', (isbn) => {
    rl.question('Nombre del usuario: ', async (usuario) => {
      // hay q verificar que el usuario exsista, que no se repita el prestamo?
      try {
        const resultado = await prestarLibro(isbn, usuario);
        console.log(resultado.mensaje);
        console.log('Préstamo registrado:', resultado.prestamo);
      } catch (error) {
        console.error('Error:', error.message);
      } finally {
        rl.close();
        process.exit();
      }
    });
  });
})();
