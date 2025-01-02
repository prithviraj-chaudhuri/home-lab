#!/bin/bash

/bin/ollama serve &
pid=$!

sleep 5

echo "Retrieve Phi3 model..."
ollama pull phi3:medium
echo "Done!"

wait $pid