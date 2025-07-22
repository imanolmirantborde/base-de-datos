const readline = require('readline');
const conectarDB = require('../config/db');
const { devolverLibroPorTitulo } = require('../controllers/prestamoController');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

(async () => {
  await conectarDB();

  rl.question('Titulo del libro a devolver: ', async (titulo) => {
    try {
      const resultado = await devolverLibroPorTitulo(titulo);
      console.log(resultado.mensaje);
    } catch (error) {
      console.error('Error:', error.message);
    } finally {
      rl.close();
      process.exit();
    }
  });
})();
