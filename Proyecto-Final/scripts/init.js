const conectarDB = require('../config/db');
const Libro = require('../models/Libro');
const Prestamo = require('../models/Prestamo');

const librosEjemplo = [
  {
    titulo: 'Zama',
    autor: 'Antonio Di Benedetto',
    isbn: '1001',
    genero: 'Ficción histórica',
    anioPublicacion: 1956,
    copias: 3,
    disponibles: 3,
  },
  {
    titulo: 'El túnel',
    autor: 'Ernesto Sabato',
    isbn: '1002',
    genero: 'Psicológico',
    anioPublicacion: 1948,
    copias: 4,
    disponibles: 3,
  },
  {
    titulo: 'Rayuela',
    autor: 'Julio Cortázar',
    isbn: '1003',
    genero: 'Narrativa',
    anioPublicacion: 1963,
    copias: 5,
    disponibles: 5,
  },
  {
    titulo: 'Sobre héroes y tumbas',
    autor: 'Ernesto Sabato',
    isbn: '1004',
    genero: 'Drama',
    anioPublicacion: 1961,
    copias: 2,
    disponibles: 2,
  },
  {
    titulo: 'Los siete locos',
    autor: 'Roberto Arlt',
    isbn: '1005',
    genero: 'Novela',
    anioPublicacion: 1929,
    copias: 4,
    disponibles: 4,
  }
];

const prestamosEjemplo = [
  {
    usuario: 'shimma@gmail.com',
    fechaPrestamo: new Date(),
    devuelto: false
  },
  {
    usuario: 'mica@gmail.com',
    fechaPrestamo: new Date(),
    devuelto: true,
    fechaDevolucion: new Date()
  }
];

const inicializarDB = async () => {
  await conectarDB();

  try {
    await Libro.deleteMany();
    await Prestamo.deleteMany();

    const librosInsertados = await Libro.insertMany(librosEjemplo);
    console.log(`Se insertaron ${librosInsertados.length} libros.`);

    const libroPrestado = librosInsertados[1];
    prestamosEjemplo[0].libroId = libroPrestado._id;
    prestamosEjemplo[1].libroId = libroPrestado._id;

    const prestamosInsertados = await Prestamo.insertMany(prestamosEjemplo);
    console.log(`Se insertaron ${prestamosInsertados.length} préstamos.`);

  } catch (error) {
    console.error('Error al inicializar la base de datos:', error.message);
  } finally {
    process.exit();
  }
};

inicializarDB();
