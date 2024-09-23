#!/bin/sh

# Load environment variables from .env file
export $(grep -v '^#' /.env | xargs)

# Replace placeholder with actual secret in paper-global.yml
sed -i "s/YOUR_SECRET_HERE/${VELOCITY_SECRET}/g" /minecraft/config/paper-global.yml

# Replace placeholder with actual password in LuckPerms/config.yml
sed -i "s/YOUR_DATABASE_PASSWORD_HERE/${YOUR_DATABASE_PASSWORD_HERE}/g" /minecraft/plugins/LuckPerms/config.yml

# Set server-port in server.properties
echo "server-port=${PORT}" >> /minecraft/server.properties

# Start the Minecraft server
exec java -Xmx2G -Xms1G -jar /minecraft/server.jar nogui
