#!/usr/bin/env bash

# Wait until mysql is started
echo "Waiting 30 secs.."
sleep 30

echo "Starting Table daemon.."
/usr/bin/php /project/application/bin/cli.php NewQueue Table --name=touchTable &

echo "Starting Wallet daemon.."
/usr/bin/php /project/application/bin/cli.php NewQueue Wallet --name=newWallet &
