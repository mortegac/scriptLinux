### SCRIPT BASH CREAR BACKUP

Script que genera un backup de las bases de datos existentes en MsSql

#Pasos para ejecutarlo

- Editar archivo y cambiar usuario y clave de Base de Datos

- Asignar grupo y usuario root
```
# chown root:root BackupBd.sh

```

- Otorgar permisos de ejecución al Archivo
```
# chmod 500 backup_all_databases.sh

```

- Ejecutar Script
```
./backup_all_databases.sh
```



## Explicación Tag utilizados 

La variable ```args``` almacena todas las opciones que se le pasarán a ```mysqldump``` durante el volcado de cada base de datos:

--add-drop-database: agrega la sentencia "DROP DATABASE" antes de cada sentencia "CREATE DATABASE".
--add-locks: encierra cada volcado de tabla con un lock (resulta en inserts más rápidos al momento de restaurar).
--create-options: incluye todas las opciones específicas de MySQL en las sentencias "CREATE TABLE".
--complete-insert: incluye los nombres de columnas en las sentencias "INSERT".
--comments: incluye información útil como versiones de la aplicación y servidor, hostname, etc.
--disable-keys: crea los índices luego de insertar todas las filas (acelera el proceso de recuperación)
--dump-date: agrega la fecha de volcado.
--extended-insert: realiza insert de múltiples filas en una única sentencia.
--quick: útil para hacer dump de tablas grandes, recupera una fila por vez.
--routines: incluir en el dump las rutinas almacenadas (stored procedures y funciones).
--triggers: incluir triggers en el dump.
Luego de definir estas variables, obtiene los nombres de todas las bases de datos ejecutando la consulta show databases y los guarda en el archivo "databases.list".