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

## Uso de los scripts, de las funciones

#### Cargar libros y prestamos a la base:

- node scripts/init.js

#### Agregar Libro, se carga por parámetro:

uso:
node scripts/agregarLibro.js "titulo" "autor" "isbn" "genero" año copias

#### Buscar Libro:

puede ser por titulo, autor o genero

- Uso:
- node scripts/buscarLibros.js titulo "Rota se camina igual"
- node scripts/buscarLibros.js genero "Crecimiento Personal"
- node scripts/buscarLibros.js autor "Lorena Pronsky"

#### Prestar Libro:

node scripts/prestarLibro.js

- agregar isbn (1000,..., 1006) y nombre del usuario.

#### Devolver Libro:

node scripts/devolverLibro.js

- agregar titulo

#### Ver reportes de libros mas prestaos:

node scripts/reportePopulares.js

### Integrantes del grupo:

- Imanol Mirant borde
- Nicolas Velazquez
- Jimena Martinez Arana
- Micaela Rocío Zubiel
