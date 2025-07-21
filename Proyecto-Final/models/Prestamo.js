const mongoose = require('mongoose');

const prestamoSchema = new mongoose.Schema({
  libroId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'Libro',  //referenccia a libro
    required: true,
  },
  usuario: {
    type: String,
    required: true,
  },
  fechaPrestamo: {
    type: Date,
    required: true,
    default: Date.now,
  },
  fechaDevolucion: {
    type: Date,
  },
  devuelto: {
    type: Boolean,
    required: true,
    default: false,
  }
});

const Prestamo = mongoose.model('Prestamo', prestamoSchema);

module.exports = Prestamo;
