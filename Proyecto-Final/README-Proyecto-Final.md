## Proyecto Final - Bases de Datos

### Biblioteca Digital

#### Se permite: agregar libros, registrar préstamos, devolver libros, buscar libros y obtener reportes.

## Tecnologías usadas:

- Node.js
- Mongoose
- MongoDB

## Cómo instalar el proyecto

1. Clonar el repositorio:

- _git clone https://github.com/imanolmirantborde/base-de-datos.git_

2. dirigirte hacia la carpeta:

- _cd base-de-datos_

3. dirigirte al proyecto:

- _cd Proyecto-Final_

4. instalar las dependencias necesarias:

- en este caso: _npm install mongoose_

5. tener MongoDB corriendo localmente

## Interface del sistema: Consola

## Uso de los scripts, de las funciones

#### Cargar libros y prestamos a la base:

- _node scripts/init.js_

#### Agregar Libro, se carga por parámetro:

uso:
_node scripts/agregarLibro.js "titulo" "autor" "isbn" "genero" año copias_

#### Buscar Libro:

puede ser por titulo, autor o genero

- Uso:
- _node scripts/buscarLibros.js titulo "Rota se camina igual"_
- _node scripts/buscarLibros.js genero "Crecimiento Personal"_
- _node scripts/buscarLibros.js autor "Lorena Pronsky"_

#### Prestar Libro:

_node scripts/prestarLibro.js_

- agregar isbn (1000,..., 1006) y nombre del usuario.

#### Devolver Libro:

_node scripts/devolverLibro.js_

- agregar titulo

#### Ver reportes de libros mas prestaos:

_node scripts/reportePopulares.js_

### Integrantes del grupo:

- Imanol Mirant borde
- Nicolas Velazquez
- Jimena Martinez Arana
- Micaela Rocío Zubiel
