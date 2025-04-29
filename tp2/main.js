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

{ /* ---------------------EJERCICIO 1 --------------------- */}
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

{ /* ---------------------EJERCICIO 2 --------------------- */}
// Busca la edad de los empleados con edades entre 25 y 40 años
db.empleados.find({
  edad: { $gte: 25, $lte: 40 }
});

// Comprobar que los empleados están en la colección
db.empleados.find();
{ /* ---------------------EJERCICIO 3 --------------------- */}
// Recupera los nombres y puestos de todos los empleados, sin mostrar el _id.
db.empleados.find({}, { nombre: 1, puesto: 1, _id: 0 });
//Se utiliza una proyeccion para mostrar solamente ciertos campos 


db.empleados.find();

{ /* ---------------------EJERCICIO 4 --------------------- */}

// Para agregar la dirección a un empleado específico.

db.empleados.updateOne(
    { nombre: "Imanol" },
    {
        $set: {
            direccion: {
                calle: "Av. Colón 1234",
                ciudad: "Bahía Blanca",
                codigo_postal: "8000"
            }
        }
    }
);
db.empleados.updateOne(
    { nombre: "Jimena" },
    {
        $set: {
            direccion: {
                calle: "Av. Rivadavia 5678",
                ciudad: "Buenos Aires",
                codigo_postal: "1000"
            }
        }
    }
);

// Para agregar la dirección a todos los empleados.

db.empleados.updateMany(
    {},
    {
        $set: {
            direccion: {
                calle: "11 de abril 475",
                ciudad: "Bahía Blanca",
                codigo_postal: "8000"
            }
        }
    }
);

// Comprobar que se agregó el campo
db.empleados.find();

{ /* ---------------------EJERCICIO 5 --------------------- */}

// creación de la colección ventas
db.ventas.insertMany([
    { producto: "Camisa", cantidad: 5, precio_unitario: 20 },
    { producto: "Pantalón", cantidad: 3, precio_unitario: 50 },
    { producto: "Remera", cantidad: 2, precio_unitario: 20 },
    { producto: "Zapatos", cantidad: 1, precio_unitario: 80 },
    { producto: "Zapatillas", cantidad: 4, precio_unitario: 50 }
]);

// comprueba que se insertaron los documentos de ventas
db.ventas.find();

// calcula el total de ventas por producto.
db.ventas.aggregate([
    {
        $group: {   
            _id: "$producto", 
            totalVentas: { $sum: { $multiply: ["$cantidad", "$precio_unitario"] } } 
            // suma de cantidad * precio_unitario
        }
    }
]);

{ /* ---------------------EJERCICIO 6 --------------------- */}

// Creación de la colección clientes
db.createCollection("clientes");
// Inserción de documentos en la colección 
db.clientes.insertMany([
    { nombre: "Juan", apellido: "Pérez", edad: 30 },
    { nombre: "Ana", apellido: "Gómez", edad: 25 },
    { nombre: "Luis", apellido: "Fernández", edad: 40 }
]);

// Crear indice compuesto

db.clientes.createIndex(
    { apellido: 1, nombre: 1 }
);

// Comprobaciones
db.clientes.find();
db.clientes.getIndexes();

{ /* ---------------------EJERCICIO 7 --------------------- */}

// crea la colección cursos
db.cursos.insertMany([
    { nombre: "Base de datos II", duracion: "3 meses" },
    { nombre: "Programación", duracion: "4 meses" },
    { nombre: "Inglés", duracion: "1 mes" }
]);

// comprueba que se insertaron los documentos de cursos
db.cursos.find();
// una vez ejecutado, usamos el id para la coleccion alumnos

// crea la colección alumnos
db.alumnos.insertMany([
    {
        nombre: "Pedro",
        edad: 18,
        id_cursos: 
            [ObjectId("68112287db486c7359e79990"), // Base de datos II
            ObjectId("68112287db486c7359e79991")] // Programación
        },
        {
        nombre: "Belen",
        edad: 20,
        id_cursos: [
            ObjectId("68112287db486c7359e79991"),   // Programación
            ObjectId("68112287db486c7359e79992")]  // Inglés
        },
        {
        nombre: "Micaela",
        edad: 22,
        id_cursos: [
            ObjectId("68112287db486c7359e79990"),   // Base de datos II
            ObjectId("68112287db486c7359e79992")]  // Inglés
        }
]);

// comprueba que se insertaron los documentos de alumnos
db.alumnos.find();

{ /* ---------------------EJERCICIO 8 --------------------- */}
//Realiza una agregación donde se combinen los datos de alumnos y cursos usando $lookup.
db.alumnos.aggregate([
    {
        $lookup: {
            from: "cursos", //la coleccion a la que se quiere hacer la relacion
            localField: "id_cursos",//campo de  alumnos
            foreignField: "_id", //campo de cursos
            as: "cursos" //nombre del nuevo campo con los datos combinados
        }
    }
]);
// devuelve un array de objetos con los datos combinados de alumnos y cursos


{ /* ---------------------EJERCICIO 9 --------------------- */}
/*Los benefisios de usar Replica Set son que si falla algun nodo primario hay uno que lo rempalzara automaticamente.
Tambien tiene otra ventaja y es que al estar los datos replicados en distintos nodos, puede hacer tareas menores 
utilizando menos memoria y recursos.
Otra cosa que hace bien es que es facil detectar errores y actualizar nodos sin que el sistema deje de funcionar*/

/*Los beneficios del Sharding en bases de datos de alto volumen son que al divide los datos entre múltiples servidores es mas facil
manejar volúmenes mucho mayores.
Tambien ya que las consultas se distribuyen entre shards, reduciendo la carga en cada uno y acelerando la respuesta.
El Sharding tambien permite trabajar con mas de un servidor y ayuda a la distribucion de datos, y MongoDB balancea 
los datos entre shards cuando detecta que están desbalanceados.*/
