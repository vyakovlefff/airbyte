FROM ubuntu:20.04

WORKDIR /app

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    docker.io \
    docker-compose \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Add `/app/bin` to $PATH for script access
ENV PATH /app/bin:$PATH

# Copy script into the container
COPY run-ab-platform.sh ./

# Make the script executable
RUN chmod +x run-ab-platform.sh

# Expose necessary ports
EXPOSE 8000 8001

# Attempt to run the script
CMD ["./run-ab-platform.sh"]
