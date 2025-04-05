#!/bin/bash

set -e

LOG_DIR="/app/logs"
mkdir -p $LOG_DIR

# Define log files
DEBUG_LOG="$LOG_DIR/firebase-debug.log"
FIRESTORE_LOG="$LOG_DIR/firestore.log"
PUBSUB_LOG="$LOG_DIR/pubsub.log"
ENTRYPOINT_LOG="$LOG_DIR/entrypoint.log"

# Start logging
exec > >(tee -a $ENTRYPOINT_LOG) 2>&1

echo "Starting Firebase Emulator with Separate Logs..."



# Start Firebase Emulator and log each service separately
firebase emulators:start --project "${FIREBASE_PROJECT_ID}" --only firestore,auth,storage,pubsub \
  --import="$LOG_DIR" \
  --export-on-exit \
  --debug 2>&1 | tee $DEBUG_LOG | awk '
  /firestore/ {print > "'$FIRESTORE_LOG'"}
  /pubsub/ {print > "'$PUBSUB_LOG'"}
'