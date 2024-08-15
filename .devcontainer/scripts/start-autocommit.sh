#!/bin/bash
# Run autocommit.sh in a loop
while true; do
    sleep 30 # runs every 5 min
    .devcontainer/scripts/autocommit.sh 
done &