const conectarDB = require('../config/db');
const Libro = require('../models/Libro');

const librosEjemplo = [
  {
    titulo: 'Cien años de soledad',
    autor: 'Gabriel García Márquez',
    isbn: '976',
    genero: 'Realismo mágico',
    anioPublicacion: 1967,
    copias: 4,
    disponibles: 4,
  },
  {
    titulo: '1984',
    autor: 'George Orwell',
    isbn: '977',
    genero: 'Distopía',
    anioPublicacion: 1949,
    copias: 5,
    disponibles: 5,
  },
  {
    titulo: 'El Principito',
    autor: 'Antoine de Saint-Exupéry',
    isbn: '975',
    genero: 'Fábula',
    anioPublicacion: 1943,
    copias: 3,
    disponibles: 3,
  },
  {
    titulo: 'Rayuela',
    autor: 'Julio Cortázar',
    isbn: '979',
    genero: 'Narrativa',
    anioPublicacion: 1963,
    copias: 2,
    disponibles: 2,
  },
  {
    titulo: 'Don Quijote de la Mancha',
    autor: 'Miguel de Cervantes',
    isbn: '978',
    genero: 'Novela clásica',
    anioPublicacion: 1605,
    copias: 6,
    disponibles: 6,
  }
];

const inicializarDB = async () => {
  await conectarDB();

  try {
    await Libro.deleteMany(); // limpia la colección antes de insertar
    const resultado = await Libro.insertMany(librosEjemplo);
    console.log(`✅ Base de datos inicializada con ${resultado.length} libros.`);
  } catch (error) {
    console.error('❌ Error al inicializar la base de datos:', error.message);
  } finally {
    process.exit();
  }
};

inicializarDB();
