const conectarDB = require('../config/db');
const Libro = require('../models/Libro');

const agregarLibro = async () => {
  await conectarDB();

  const [titulo, autor, isbn, genero, anioPublicacion, copias] = process.argv.slice(2);

  if (!titulo || !autor || !isbn || !genero || !anioPublicacion || !copias) {
    console.log('Uso: node agregarLibro.js "titulo" "autor" "isbn" "genero" anio copias');
    return process.exit();
  }

  const libro = new Libro({
    titulo,
    autor,
    isbn,
    genero,
    anioPublicacion: Number(anioPublicacion),
    copias: Number(copias),
    disponibles: Number(copias),
  });

  try {
    const resultado = await libro.save();
    console.log(' Libro agregado:', resultado);
  } catch (error) {
    console.error(' Error al agregar libro:', error.message);
  } finally {
    process.exit();
  }
};

agregarLibro();
