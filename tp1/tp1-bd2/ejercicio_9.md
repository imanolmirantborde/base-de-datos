# 1. Backup completo en PostgreSQL

### Usar pg_dump

```
pg_dump -U usuario_bd -d nombre_bd -f backup_completo.sql
```

Parámetros:
- `-U`: Usuario de la base de datos
- `-d`: Nombre de la base de datos
- `-f`: Nombre de archivo donde se guardará el backup
- ` | gzip > backup_completo.gz` : Opcional para comprimir
- `pg_dumpall` : Para backupear todas las bases de datos

## 2. Restauración de backup en PostgreSQL

### Restaurar desde archivo SQL

```
psql -U usuario_bd -d nombre_bd -f backup_completo.sql
```

### Desde archivo comprimido

```
gunzip -c backup_completo.gz | psql -U usuario_bd -d nombre_bd
```

#  Simulación 

### Paso 1: Crear una base de datos de prueba

```
createdb -U postgres test_db
psql -U postgres -d test_db
```

### Paso 2: Crear tablas de ejemplo y cargar datos

```
CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

INSERT INTO clientes (nombre, email) VALUES 
('Nicolás Velazquez', 'nicolas@gmail.com'),
('Imanol', 'imanol@ixu.com');
```

### Paso 3: Crear backup de la base de datos

```
pg_dump -U postgres -d test_db -f test_backup.sql
```

### Paso 4: Simular pérdida de datos

```
DELETE FROM clientes WHERE nombre = 'Nico';
DROP TABLE clientes;
```

### Paso 5: Restaurar desde el backup

```
psql -U postgres -d test_db -f test_backup.sql
```

### Paso 6: Verificar la recuperación

```
SELECT * FROM clientes;
```

Este proceso debería mostrará que se recuperaron todos los datos. No es excluyente.


