#!/bin/bash

# Define the environment (dev in this case)
ENV="prod"

# List functions and filter based on the environment, save to functions.txt
gcloud functions list | grep "$ENV" > $ENV.txt

# Clean the functions.txt file
sed -i 's/NAME: //g' $ENV.txt
sed -i 's/TRIGGER: topic://g' $ENV.txt

# Read each line, clean it, and apply as label value
while IFS= read -r function_name; do
    # Convert to lowercase, replace underscores with dashes, and trim spaces
    clean_name=$(echo "$function_name" | tr '[:upper:]' '[:lower:]' | tr '_' '-' | sed 's/^[ \t]*//;s/[ \t]*$//')

    # Ensure the name is valid before proceeding
    if [[ ! "$clean_name" =~ ^[a-z0-9-]+$ ]] || [[ "$clean_name" =~ ^- || "$clean_name" =~ -$ ]] || [[ ${#clean_name} -gt 63 ]]; then
        echo "Skipping invalid service name: $function_name"
        continue
    fi

    echo "Adding label to Cloud Run service: $clean_name"

    # Update the Cloud Run service with the label
    gcloud run services update "$clean_name" \
        --update-labels="cloud_run_function_name=$clean_name" \
        --region=asia-south1 --platform=managed
done < $ENV.txt

