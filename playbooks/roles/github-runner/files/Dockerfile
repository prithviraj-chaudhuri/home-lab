FROM ubuntu:24.04

# Set working directory
WORKDIR /actions-runner

# Configure SSH to accept new host keys
RUN mkdir -p /root/.ssh && \
    echo "StrictHostKeyChecking=accept-new" >> /root/.ssh/config

# Install dependencies
RUN apt update -y && apt upgrade -y && apt install -y \
    curl jq libicu-dev python3 ansible openssh-client make

# Download and extract the GitHub Actions runner
RUN curl -L -o actions-runner.tar.gz \
    https://github.com/actions/runner/releases/download/v2.334.0/actions-runner-linux-x64-2.334.0.tar.gz \
    && tar xzf actions-runner.tar.gz \
    && rm actions-runner.tar.gz

# Set environment variable to allow running as root
ENV RUNNER_ALLOW_RUNASROOT=true

# Install runner dependencies
RUN ./bin/installdependencies.sh

WORKDIR /home/github-runner

# Add entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint to start the runner
ENTRYPOINT ["/entrypoint.sh"]