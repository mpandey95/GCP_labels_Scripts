loud Run Service Label Update Script

This script helps you to update labels for Google Cloud Run services, specifically targeting services in a given environment (e.g., `dev`). It lists all the services, filters by the environment name, and then updates the labels for each service to include the service name.

## Requirements

- Google Cloud SDK installed and configured
- Access to Google Cloud Project with Cloud Run permissions
- `gcloud` command-line tool available

## How It Works

1. **Define Environment**: The script defines the environment name (e.g., `dev`).
2. **List Cloud Run Services**: It lists all services in Cloud Run using `gcloud run services list` and filters them by the environment name (in this case, services with `dev` in their name).
3. **Update Labels**: For each service, it updates the label `cloud_run_service_name` to the service's name.

## Usage

1. Clone this repository or copy the script to your local machine.
2. Modify the `env` variable to specify the desired environment (default is `dev`).
3. Ensure you have the required permissions and the Google Cloud SDK is properly set up.
4. Run the script in your terminal:

```bash
#!/bin/bash

# Define environment name
env="dev"

# List Cloud Run services, filter for 'dev', and extract SERVICE names
gcloud run services list --format="value(SERVICE)" | grep "$env" > "$env.txt"

# Read each service name and update labels
while IFS= read -r service; do
  service=$(echo "$service" | xargs)  # Trim spaces
  echo "Updating label for service: [$service]"

  gcloud run services update "$service" \
    --region=asia-south1 \
    --update-labels=cloud_run_service_name="$service"
done < "$env.txt"

