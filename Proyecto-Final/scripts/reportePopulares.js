require('../config/db');
const Prestamo = require('../models/Prestamo');
const Libro = require('../models/Libro');

async function reportePopulares() {
  try {
    const populares = await Prestamo.aggregate([
      {
        $group: {
          _id: '$libroId',
          prestamosCount: { $sum: 1 },
        },
      },
      {
        $sort: { prestamosCount: -1 },
      },
      {
        $lookup: {
          from: 'libros', 
          localField: '_id',
          foreignField: '_id',
          as: 'libroInfo',
        },
      },
      {
        $unwind: '$libroInfo',
      },
      {
        $project: {
          _id: 0,
          titulo: '$libroInfo.titulo',
          autor: '$libroInfo.autor',
          isbn: '$libroInfo.isbn',
          prestamos: '$prestamosCount',
          copias: '$libroInfo.copias',
          disponibles: '$libroInfo.disponibles',
        },
      },
    ]);

    if (populares.length === 0) {
      console.log('No hay datos de préstamos para generar un reporte.');
      return;
    }

    console.log('--- Reporte de Libros Más Populares y su Disponibilidad ---');
    populares.forEach((libro, index) => {
      console.log(
        `${index + 1}. Título: ${libro.titulo}, Autor: ${libro.autor}, Préstamos: ${libro.prestamos}, Disponibles: ${libro.disponibles}`
      );
    });
  } catch (error) {
    console.error('Error al generar el reporte de libros populares:', error);
  } finally {
    process.exit();
  }
}

reportePopulares();
