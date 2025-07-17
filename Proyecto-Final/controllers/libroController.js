const mongoose = require('mongoose');
const Libro = require('../models/Libro');

exports.agregarLibro = async (datos) => {
  try {
    const libro = new Libro(datos);
    await libro.save();
    console.log('Libro agregado:', libro);
  } catch (error) {
    console.error('Error al agregar libro:', error.message);
  }
};

exports.buscarLibros = async () => {
  try {
    const libros = await Libro.find();
    console.log(libros);
  } catch (error) {
    console.error('Error al buscar libros:', error.message);
  }
};