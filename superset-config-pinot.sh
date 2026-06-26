#!/bin/bash

source .env

# Install pinot driver
docker exec -ti superset_app bash -c "uv pip install pinotdb==${PYTHON_PINOTDB_VERSION}"

# Install pinot datasource
docker exec -ti superset_app bash -c "superset import-datasources --path /app/docker/pinot-database.yml"


echo "Success! Superset-Pinot configured!"
