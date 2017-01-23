#SCRIPT QUE RESTAURA UNA BASE DE DATOS EN MYSQL
#!/bin/bash   


dbUser=userMysql
dbPass=PassMysql

args="-u"$ dbUser" -p "$dbPass" --add-drop-database --add-locks --create-options --complete-insert --comments --disable-keys --dump-date --extended-insert --quick --routines --triggers"                                                     

mysql -u$ dbUser -p $dbPass -e 'show databases' | grep -Ev "(Database|information_schema)" > databases.list

echo "Dump Database..:"
mysql -u$ dbUser -p$dbPass -e 'select table_schema "DATABASE",convert(sum(data_length+index_length)/1048576, decimal(6,2)) "SIZE (MB)" from information_schema.tables where table_schema!="information_schema" group by table_schema;'
CONT=1
while [ $CONT -eq 1 ]
do
        echo -n "¿Do you wish to continue? (Y/N): "
        read -n 1 K
        [[ "$K" == "N" || "$K" == "n" ]] && { echo ""; exit 0; }
        [[ "$K" == "Y" || "$K" == "y" ]] && { CONT=0; }
        echo ""
done

while read DB
do
        dump="dump_"$DB".sql"
        echo -n $dump"... "
        mysqldump ${args} $DB > $dump
        echo "Dump Finished;;"
done < databases.list

rm databases.list