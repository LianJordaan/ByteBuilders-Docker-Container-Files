#!/bin/sh

STATUS_FILE="/ready.txt"

# Check if the "Done" message is present in the latest.log
if grep -q "Done (" /minecraft/logs/latest.log; then
  # Create a status file indicating that the server is ready
  echo "Server is ready" > "$STATUS_FILE"
  exit 0
else
  # If the status file exists, assume the server is ready
  if [ -f "$STATUS_FILE" ]; then
    exit 0
  else
    exit 1
  fi
fi
