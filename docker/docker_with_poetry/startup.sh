#!/bin/bash
source /opt/venv/bin/activate

# next line is needed to tell docker to run the command given by
# `docker compose run command`
exec "$@"
