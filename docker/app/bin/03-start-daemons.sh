#!/usr/bin/env bash

echo "Starting Table daemon.."
/usr/bin/php /project/application/bin/cli.php NewQueue Table --name=touchTable &

echo "Starting Wallet daemon.."
/usr/bin/php /project/application/bin/cli.php NewQueue Wallet --name=newWallet &
