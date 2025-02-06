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

