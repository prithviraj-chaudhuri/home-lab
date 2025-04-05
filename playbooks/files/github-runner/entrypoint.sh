#!/bin/bash
set -e

cd /tmp/github-runner

# Configure only if needed
if [ ! -f ".runner" ]; then
  echo "Configuring runner..."
  ./config.sh --url "${RUNNER_URL}" --token "${RUNNER_TOKEN}" --name "${RUNNER_NAME}" --unattended --replace
else
  echo "Runner already configured. Skipping config."
fi

# Start the runner
exec ./run.sh