#!/bin/bash

echo "Adding 'ip-device' table to Pinot..."

DIR=/opt/pinot/examples/test-dashboard

# Adds a new Pinot table
/opt/pinot/bin/pinot-admin.sh AddTable -tableConfigFile $DIR/ip_device-table-config.json -schemaFile $DIR/ip_device-schema.json -exec

echo "Import data"
mkdir $DIR/rawdata
cd $DIR/rawdata


tar -xvzf ../IP_DEVICE.csv.gz IP_DEVICE.csv

echo "Launching Pinot data ingestion job"

# Launch batch ingestion job from raw CSV files into Pinot
/opt/pinot/bin/pinot-admin.sh LaunchDataIngestionJob -jobSpecFile $DIR/ip_device-job-spec.yml
