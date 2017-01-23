#SCRIPT QUE RESPALDA UNA BASE DE DATOS EN MYSQL
#!/bin/bash


dbUser=userMysql
dbPass=PassMysql
dbName=BdMysql

Home="."
FileOutput="logImport.log"
FileDump="dump.sql"

#Limpiar consola
clear
echo "INICIANDO EL PROCESO DE IMPORTACION..."
echo "=========================================="

    echo "Chequeando Base de Datos..."

        RESULT=`mysql -u$dbUser -p$dbPass -e "SHOW DATABASES" | grep -Fo $dbName`
         if [ "$RESULT" == "$dbName" ]; then
                echo "La Base de Datos existe.." >> $Home/$FileOutput
        else
                echo "Creando Base de Datos.."
                mysql -v -u $dbUser -p$dbPass -e "create database $dbName;" >> $Home/$FileOutput
        fi

        mysql -v -u $dbUser -p$dbPass -e "use database $dbName;" >> $Home/$FileOutput
        echo "Restaurando Base de datos.."
        mysql -v -u $dbUser -p$dbPass $dbName < $Home/$FileDump
        mysql -v -u $dbUser -p$dbPass -e "grant all on $dbName.* to $dbUser@localhost identified by '$dbPass'" >> $Home/$FileOutput

    echo "Proceso de importación Finalizado! Para ver el detalle, revise el archivo '$Home/$FileOutput'."