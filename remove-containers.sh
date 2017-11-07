#!/usr/bin/env bash

echo "Stopping containers.."
docker ps -a | awk '{ print $1,$2 }' | grep spreadshare | awk '{print $1 }' | xargs -I {} docker stop {}

echo "Removing containers.."
docker ps -a | awk '{ print $1,$2 }' | grep spreadshare | awk '{print $1 }' | xargs -I {} docker rm {}