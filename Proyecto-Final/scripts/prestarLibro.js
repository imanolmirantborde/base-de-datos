const readline = require('readline');
const conectarDB = require('../config/db');
const { prestarLibro } = require('../controllers/prestamoController');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

(async () => {
  await conectarDB();

  rl.question('ISBN del libro a prestar: ', (isbn) => {
    rl.question('Nombre del usuario: ', async (usuario) => {
        // hay q verificar que el usuario exsista, que no se repita el prestamo?
      try {
        const resultado = await prestarLibro(isbn, usuario);
        console.log('\nMensaje:', resultado.mensaje);
        console.log('Préstamo registrado:', resultado.prestamo);
      } catch (error) {
        console.error('\noh no! Error:', error.message);
      } finally {
        rl.close();
      }
    });
  });
})();

//para ejeecutar: node scripts/prestarLibro.js