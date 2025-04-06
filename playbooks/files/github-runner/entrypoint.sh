#!/bin/bash
set -e

cd /home/github-runner

# Change secret permissions
chmod 600 secrets/ssh-keys/*.key

# Configure only if needed
if [ ! -f ".runner" ]; then
  echo "Configuring runner..."
  ./config.sh --url "${RUNNER_URL}" --token "${RUNNER_TOKEN}" --name "${RUNNER_NAME}" --unattended --replace
else
  echo "Runner already configured. Skipping config."
fi

# Start the runner
exec ./run.sh