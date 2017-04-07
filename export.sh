#!/bin/bash
NOW=$(date +"%m_%d_%Y")
FILE="wp-data/data_$NOW.sql"
docker-compose exec db sh -c 'exec mysqldump "$MYSQL_DATABASE" -uroot -p"$MYSQL_ROOT_PASSWORD"' > $FILE
NEW_CONTENT=$(sed -n '1!p' $FILE) # Removes the password warning from the file
echo $NEW_CONTENT > $FILE
