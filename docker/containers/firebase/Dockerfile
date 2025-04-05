# Dockerfile for Firebase Emulator
FROM node:22-alpine

WORKDIR /app

# Install Java and Firebase CLI
RUN apk update && \
    apk add --no-cache openjdk17-jre bash curl && \
    npm install -g firebase-tools@latest

# Copy config files
COPY containers/firebase/firebase.json /app/
COPY containers/firebase/firestore.rules /app/
COPY containers/firebase/storage.rules /app/
COPY containers/firebase/entrypoint.sh /app/

# Expose Ports
EXPOSE 4000 8080 9099 9199 8085

# Set environment variable to bind to all interfaces
ENV FIREBASE_EMULATOR_HOST=0.0.0.0

# Start Emulators
# Use the entrypoint script
ENTRYPOINT ["sh", "/app/entrypoint.sh"]
