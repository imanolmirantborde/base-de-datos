// Inicio de tp
// mongosh

// Creación base de datos llamada empresa.
// use empresa

// Agrega una colección empleados con 3 documentos que incluyan nombre, edad y puesto.
db.empleados.insertMany([
    { nombre: "Imanol", edad: 30, puesto: "Software Developer" },
    { nombre: "Jimena", edad: 25, puesto: "Project Manager" },
    { nombre: "Nicolás", edad: 55, puesto: "Pasante" }
]);

// Comprobar que se insertaron los documentos
db.empleados.find();

// Ejercicio 1
// Actualizar la edad de uno de los empleados.
db.empleados.updateOne(
    { nombre: "Imanol" },
    { $set: { edad: 31 } }
);

// Comprobar el cambio
db.empleados.find({ nombre: "Imanol" });

// Eliminar el empleado que tiene el puesto de "Pasante".
db.empleados.deleteOne(
    { puesto: "Pasante" }
);

// Comprobar que se eliminó
db.empleados.find({ puesto: "Pasante" });
