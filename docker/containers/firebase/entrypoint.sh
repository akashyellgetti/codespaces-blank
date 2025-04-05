#!/bin/bash
 
 set -e
 
 echo "Starting Firebase Emulator..."
 
 # Override binding for Codespaces
 if [ -n "$CODESPACES" ]; then
   echo "Detected Codespaces environment. Forcing host to 0.0.0.0"
   firebase emulators:start --project "${FIREBASE_PROJECT_ID}" --only firestore,auth,storage,pubsub
 else
   echo "Starting with default host binding..."
   firebase emulators:start --project "${FIREBASE_PROJECT_ID}" --only firestore,auth,storage,pubsub
 fi