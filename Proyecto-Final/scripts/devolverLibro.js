const readline = require('readline');
const conectarDB = require('../config/db');
const { devolverLibro } = require('../controllers/prestamoController');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

(async () => {
  await conectarDB();

  rl.question('Titulo del libro a devolver: ', async (titulo) => {
    try {
      const resultado = await devolverLibroPorTitulo(titulo);
      console.log('\n si! Mensaje:', resultado.mensaje);
    } catch (error) {
      console.error('\noh no! Error:', error.message);
    } finally {
      rl.close();
    }
  });
})();

//para ejeecutar: node scripts/devolverLibro.js