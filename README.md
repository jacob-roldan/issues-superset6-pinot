# issues-superset6-pinot
Testing Superset 6 with Pinot


# Steps

1. Start the services:
   ```bash
   docker-compose up -d
   ```
2. Configure Superset to connect to Pinot:
   ```bash
   ./superset-config-pinot.sh
   ```
3. Load the example test dashboard:
   ```bash
   ./example_test-dashboard.sh
   ```
4. Open Superset in your browser at `http://localhost:8088` and log in with the default credentials (admin/admin).