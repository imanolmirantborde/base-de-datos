const readline = require('readline');
const conectarDB = require('../config/db');
const { devolverLibro } = require('../controllers/prestamoController');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

(async () => {
  await conectarDB();

  rl.question('ID del préstamo a devolver: ', async (prestamoId) => {
    try {
      const resultado = await devolverLibro(prestamoId);
      console.log('\nMensaje:', resultado.mensaje);
    } catch (error) {
      console.error('\nOh no! Error:', error.message);
    } finally {
      rl.close();
    }
  });
})();

//para ejeecutar: node scripts/devolverLibro.js