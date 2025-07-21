const conectarDB = require('../config/db');
const Libro = require('../models/libro');

const agregarLibro = async () => {
  await conectarDB();

  const nuevoLibro = new Libro({
    titulo: 'Cien años de soledad',
    autor: 'Gabriel García Márquez',
    isbn: '978-0307389732',
    genero: 'Realismo mágico',
    anioPublicacion: 1967,
    copias: 3,
    disponibles: 3,
  });

  try {
    const resultado = await nuevoLibro.save();
    console.log('📚 Libro agregado:', resultado);
  } catch (error) {
    console.error('❌ Error al agregar libro:', error.message);
  } finally {
    process.exit();
  }
};

agregarLibro();
