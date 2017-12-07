#!/usr/bin/env bash

# Wait until mysql is started and all dumps are imported
cat << EOF > /tmp/wait_for_mysql.php
<?php
\$connected = false;
while(!\$connected) {
    try{
        \$dbh = new pdo(
            'mysql:host=mysql1:3306;dbname=' . getenv('MYSQL_HOST'), getenv('MYSQL_USER'), getenv('MYSQL_PASSWORD'),
            array(PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION)
        );
        \$connected = true;
    }
    catch(PDOException \$ex){
        error_log("Could not connect to MySQL");
        error_log(\$ex->getMessage());
        error_log("Waiting for MySQL Connection.");
        sleep(5);
    }
}
EOF
php /tmp/wait_for_mysql.php
rm /tmp/wait_for_mysql.php

wait 5

echo "Starting Table daemon.."
/usr/bin/php /project/application/bin/cli.php NewQueue Table --name=touchTable &

echo "Starting Wallet daemon.."
/usr/bin/php /project/application/bin/cli.php NewQueue Wallet --name=newWallet &
