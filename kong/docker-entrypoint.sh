#!/bin/bash
# docker-entrypoint.sh

set -e

# Substitute env vars into template
envsubst < /usr/local/kong/declarative/kong.template.yaml > /usr/local/kong/declarative/kong.yaml

# Execute the original Kong entrypoint with all arguments
exec /entrypoint.sh "$@"