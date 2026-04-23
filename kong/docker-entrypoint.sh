#!/bin/bash
# docker-entrypoint.sh

set -e

# Substitute env vars into template
KONG_CONFIG_PATH="${KONG_DECLARATIVE_CONFIG:-/tmp/kong.yaml}"

if ! touch "$KONG_CONFIG_PATH" 2>/dev/null; then
	KONG_CONFIG_PATH="/tmp/kong.yaml"
fi

envsubst < /usr/local/kong/declarative/kong.template.yaml > "$KONG_CONFIG_PATH"
export KONG_DECLARATIVE_CONFIG="$KONG_CONFIG_PATH"

# Execute the original Kong entrypoint with all arguments
exec /entrypoint.sh "$@"