#!/usr/bin/env bash

# Call composer install
echo "Updating composer dependencies (for $PROVISION_CONTEXT).."

if [ $PROVISION_CONTEXT != "development" ]; then
	composer --working-dir=/project/application/ install --no-dev
fi