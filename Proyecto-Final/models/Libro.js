const mongoose = require('mongoose');

const libroSchema = new mongoose.Schema({
  titulo: {
    type: String,
    required: true,
  },
  autor: {
    type: String,
    required: true,
  },
  isbn: {
    type: String,
    required: true,
    unique: true,  // ISBN debe ser único
  },
  genero: {
    type: String,
    required: true,
  },
  anioPublicacion: {
    type: Number,
    required: true,
  },
  copias: {
    type: Number,
    required: true,
    min: 0, //necesario para que no exsistan valores negativos
  },
  disponibles: {
    type: Number,
    required: true,
    min: 0,

  },
});

const Libro = mongoose.model('Libro', libroSchema);

module.exports = Libro;
