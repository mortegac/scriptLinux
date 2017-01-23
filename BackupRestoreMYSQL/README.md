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