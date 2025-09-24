#!/bin/bash

echo "Adding 'birthnamees' table to Pinot..."

DIR=/opt/pinot/examples/birthnames

# Adds a new Pinot table for the USA birth names
/opt/pinot/bin/pinot-admin.sh AddTable -tableConfigFile $DIR/birthnames-table-config.json -schemaFile $DIR/birthnames-schema.json -exec

echo "Downloading USA birth names"
mkdir $DIR/rawdata
cd $DIR/rawdata

wget https://github.com/apache-superset/examples-data/raw/master/birth_names2.json.gz
gunzip -f birth_names2.json.gz

echo "USA birth names data downloaded!"

echo "Launching Pinot data ingestion job"

# Launch batch ingestion job from raw CSV files into Pinot
/opt/pinot/bin/pinot-admin.sh LaunchDataIngestionJob -jobSpecFile $DIR/birthnames-job-spec.yml
