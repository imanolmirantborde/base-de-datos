const Libro = require("../models/Libro.js");
const Prestamo = require("../models/Prestamo.js");


async function prestarLibro(isbn, usuario) {
    const libro = await Libro.findOne({ isbn });
    if (!libro) {
        throw new Error(`No se encontro ningun libro con ISBN ${isbn}`);
    } if (libro.disponibles <= 0) {
        throw new Error(`No hay copias disponibles de "${libro.titulo}"`);
    }

    libro.disponibles -= 1;
    await libro.save();

    const fechaPrestamo = new Date();
    const fechaDevolucion = new Date();
    fechaDevolucion.setDate(fechaPrestamo.getDate() + 7); 

    const nuevoPrestamo = new Prestamo({
        libroId: libro._id,
        usuario,
        fechaPrestamo,
        fechaDevolucion,
        devuelto: false,
    });
    await nuevoPrestamo.save();

    return {
        mensaje: `Prestamo registrado para "${libro.titulo}"`,
        prestamo: nuevoPrestamo,
    };
}

async function devolverLibro(prestamoId) {
    const prestamo = await Prestamo.findById(prestamoId);
    if (!prestamo) {
        throw new Error(`No se encontro ningun prestamo con ID ${prestamoId}`);
    } if (prestamo.devuelto) {
        throw new Error("Este libro ya fue devuelto");
    }

    prestamo.devuelto = true;
    await prestamo.save();

    const libro = await Libro.findById(prestamo.libroId);
    libro.disponibles += 1;
    await libro.save();

    return { mensaje: `libro devuelto: "${libro.titulo}"` };
}

async function reportePopulares() {
    const populares = await Prestamo.aggregate([
        { $group: { _id: "$libroId", totalPrestamos: { $sum: 1 } } },
        { $sort: { totalPrestamos: -1 } },
        { $limit: 5 },
        {
        $lookup: {
            from: "libros",
            localField: "_id",
            foreignField: "_id",
            as: "libro",
        },
        },
        { $unwind: "$libro" },
        {
        $project: {
            titulo: "$libro.titulo",
            autor: "$libro.autor",
            totalPrestamos: 1,
        },
        },
    ]);

    return populares;
}

module.exports = {
    prestarLibro,
    devolverLibro,
    reportePopulares,
};
