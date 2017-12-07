#!/usr/bin/env bash

# Wait until mysql is started and all dumps are imported
echo "Waiting 180 secs.."
sleep 180

echo "Starting Table daemon.."
/usr/bin/php /project/application/bin/cli.php NewQueue Table --name=touchTable &

echo "Starting Wallet daemon.."
/usr/bin/php /project/application/bin/cli.php NewQueue Wallet --name=newWallet &
