# Use an Alpine Linux base image
FROM alpine/java:21-jdk

# Set working directory
WORKDIR /minecraft

# Copy all files and directories from the 'defaults' folder into '/minecraft/'
COPY minecraft/ /minecraft/
COPY scripts/ /scripts/
COPY .env /.env

# Make the startup script executable
RUN chmod +x /scripts/start.sh
RUN chmod +x /scripts/healthcheck.sh

# Expose the port the server will run on
EXPOSE 25565

# Command to start the Minecraft server using the startup script
CMD ["/scripts/start.sh"]

HEALTHCHECK --interval=5s --timeout=3s --start-period=20s --retries=3 CMD /scripts/healthcheck.sh
