const conectarDB = require('../config/db');
const Libro = require('../models/Libro');

const buscarLibros = async () => {
  await conectarDB();

  const criterio = process.argv[2];
  const valor = process.argv[3];

  if (!criterio || !valor) {
    console.log('⚠️ Uso: node buscarLibro.js [titulo|autor|genero] [valor]');
    return process.exit();
  }

  const filtro = {};
  filtro[criterio] = new RegExp(valor, 'i');

  try {
    const resultados = await Libro.find(filtro);
    if (resultados.length === 0) {
      console.log('🔍 No se encontraron libros.');
    } else {
      console.log('📚 Resultados encontrados:');
      resultados.forEach(libro => {
        console.log(`- ${libro.titulo} (${libro.autor})`);
      });
    }
  } catch (error) {
    console.error('❌ Error al buscar libros:', error.message);
  } finally {
    process.exit();
  }
};

buscarLibros();
