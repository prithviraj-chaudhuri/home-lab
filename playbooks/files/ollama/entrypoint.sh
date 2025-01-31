#!/bin/bash

/bin/ollama serve &
pid=$!

sleep 5

# echo "Retrieve Deepseek R1:8b model..."
# ollama pull deepseek-r1:8b
# echo "Done!"

wait $pid