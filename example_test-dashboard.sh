#!/bin/bash

# Imports data into Apache Pinot
docker exec -ti pinot_db bash -c "sh ./examples/import-test-dashboard.sh"

# Imports dashboards
cd examples/test-dashboard
docker exec -ti superset_app bash -c "superset import-dashboards --path /app/docker/examples/test-dashboard/dashboard_ip_device.zip --username admin"

# Open the browser for Pinot and Superset
#open http://localhost:9000
#open http://localhost:8088

echo "Success! Imports IP Device data into Apache Pinot"
