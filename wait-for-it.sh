#!/bin/sh

# host:port -- command to wait for
HOST=$1
shift
CMD="$@"

# split host and port
HOST_NAME=$(echo "$HOST" | cut -d: -f1)
PORT=$(echo "$HOST" | cut -d: -f2)

echo "Waiting for $HOST_NAME:$PORT..."

while ! nc -z "$HOST_NAME" "$PORT"; do
  sleep 1
done

echo "$HOST_NAME:$PORT is available. Running command: $CMD"
exec $CMD
