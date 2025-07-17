const mongoose = require('mongoose');

exports.agregarLibro = async (datos) => {
  const libro = new Libro(datos);
  await libro.save();
  console.log('Libro agregado:', libro);
};

exports.buscarLibros = async () => {
  const libros = await Libro.find();
  console.log(libros);
};