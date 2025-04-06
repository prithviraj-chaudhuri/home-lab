FROM ubuntu:24.04

# Set working directory
WORKDIR /home/github-runner

# Install dependencies
RUN apt update -y && apt upgrade -y && apt install -y \
    curl jq libicu-dev python3 ansible openssh-client

# Download and extract the GitHub Actions runner
RUN curl -o actions-runner-linux-x64-2.323.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.323.0/actions-runner-linux-x64-2.323.0.tar.gz && \
    tar xzf ./actions-runner-linux-x64-2.323.0.tar.gz && \
    rm actions-runner-linux-x64-2.323.0.tar.gz

# Set environment variable to allow running as root
ENV RUNNER_ALLOW_RUNASROOT=true

# Install runner dependencies
RUN ./bin/installdependencies.sh

# Add entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint to start the runner
ENTRYPOINT ["/entrypoint.sh"]