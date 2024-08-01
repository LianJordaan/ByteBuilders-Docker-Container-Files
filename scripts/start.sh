#!/bin/sh
# Modify server.properties
echo "server-port=${PORT}" >> /minecraft/server.properties

# Start the Minecraft server
exec java -Xmx2G -Xms1G -jar server.jar nogui
