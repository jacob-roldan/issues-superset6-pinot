#!/bin/bash

# Imports BirthNames data into Apache Pinot
docker exec -ti pinot_db bash -c "sh ./examples/import-birthnames.sh"

# Imports dashboards
cd examples/birthnames
zip -r dashboard_birthnames.zip dashboard/
docker exec -ti superset_app bash -c "superset import-dashboards --path /app/docker/examples/birthnames/dashboard_birthnames.zip --username admin"


# Open the browser for Pinot and Superset
#open http://localhost:9000
#open http://localhost:8088

echo "Success! Imports BirthNames data into Apache Pinot"
