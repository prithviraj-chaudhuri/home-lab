#!/bin/bash
set -e

RUNNER_DIR="/actions-runner"
WORK_DIR="/home/github-runner"

cd "$WORK_DIR"

# Change secret permissions
chmod 600 secrets/ssh-keys/*.key

cd "$RUNNER_DIR"

# Configure only if needed
if [ -f ".runner" ]; then
  echo "Removing old runner config..."
  ./config.sh remove --token "${RUNNER_TOKEN}" || true
  rm -f .runner .credentials
fi

echo "Configuring runner..."

./config.sh \
  --url "${RUNNER_URL}" \
  --token "${RUNNER_TOKEN}" \
  --name "${RUNNER_NAME}" \
  --work "$WORK_DIR" \
  --unattended \
  --replace

exec ./run.sh