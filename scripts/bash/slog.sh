#!/bin/bash

LOGFILE="server.log"

if [ ! -f "$LOGFILE" ]; then
    echo "Log file not found."
    exit 1
fi

COUNT=$(grep -c "Error" "$LOGFILE")
echo "Number of lines containing 'Error': $COUNT"

