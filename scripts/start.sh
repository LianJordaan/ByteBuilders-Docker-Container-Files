#!/bin/sh

# Load environment variables from .env file
export $(grep -v '^#' /.env | xargs)

# Replace placeholder with actual secret in paper-global.yml
sed -i "s/YOUR_SECRET_HERE/${VELOCITY_SECRET}/g" /minecraft/config/paper-global.yml

# Set server-port in server.properties
echo "server-port=${PORT}" >> /minecraft/server.properties

# Start the Minecraft server
exec java -Xmx2G -Xms1G -jar /minecraft/server.jar nogui
