#!/bin/bash
NOW=$(date +"%m_%d_%Y")
FILE="wp-data/data_$NOW.sql"
docker-compose exec db sh -c 'exec mysqldump "$MYSQL_DATABASE" -uroot -p"$MYSQL_ROOT_PASSWORD"' > $FILE
sed -i 1,1d $FILE # Removes the password warning from the file