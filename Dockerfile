# Use Alpine Linux base image with OpenJDK
FROM alpine/java:21-jdk

# Install necessary packages
RUN apk add --no-cache dos2unix

# Set working directory
WORKDIR /minecraft

# Copy all files and directories from the 'defaults' folder into '/minecraft/'
COPY minecraft/ /minecraft/
COPY scripts/ /scripts/
COPY .env /.env

# Convert script line endings to Unix format
RUN dos2unix /scripts/start.sh

# Ensure the startup script and healthcheck script are both executable
RUN chmod +x /scripts/start.sh
RUN chmod +x /scripts/healthcheck.sh

# Expose the port the server will run on
EXPOSE 25565

# Use CMD to run the script
CMD ["/scripts/start.sh"]

HEALTHCHECK --interval=5s --timeout=3s --start-period=20s --retries=3 CMD /scripts/healthcheck.sh
