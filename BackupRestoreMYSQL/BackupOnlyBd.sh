#SCRIPT QUE RESPALDA UNA BASE DE DATOS EN MYSQL
#!/bin/bash   


dbUser=userMysql
dbPass=PassMysql
dbName=GCA_ASFALTOMAULE
Home="."
FileOutput="logsoImport.log"
FileDump="dump.sql"

#Limpiar consola
clear
echo "IMPORTANDO..."
echo "======"


 echo -n "Desea eliminar la base de datos $dbName y el usuario $dbUser antes de importar la copia de seguridad? OPCIONES (S|N): "
    read ELIMINA_DB_USER
    if [ $ELIMINA_DB_USER == "S" ] || [ $ELIMINA_DB_USER == "s" ]; then
        
        echo "Eliminando la base de datos y el usuario del sistema del motor MySQL. Aguarde un momento..."
        mysql -v -u $dbUser -p$dbPass -e "drop database $dbName;" >> $Home/$FileOutput
        mysql -v -u $dbUser -p$dbPass -e "drop user $dbUser@localhost;" >> $Home/$FileOutput
        echo
    fi
    echo "Importando Base de Datos del sistema en MySQL. Aguarde un momento..."
    mysql -v -u $dbUser -p$dbPass < $Home/$FileDump >> $Home/$FileOutput
    mysql -v -u $dbUser -p$dbPass -e "grant all on $dbName.* to $dbUser@localhost identified by '$dbPass'" >> $Home/$FileOutput
     echo "Proceso de importación Finalizado! Para ver la salida edite el archivo '$Home/$FileOutput'."
    echo



