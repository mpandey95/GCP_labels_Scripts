#!/bin/bash

# Define the environment variable
env="pilot"

# List the jobs in the specified environment and save to file
gcloud run jobs list | grep "$env" > "$env.txt"

# Clean up the file by removing "JOB:"
sed -i 's/JOB://g' "$env.txt"

# Loop through each job name and update the labels
while read -r job_name; do
  gcloud run jobs update "$job_name" \
    --region=asia-south1 \
    --update-labels=cloud_run_job_name="$job_name"
done < "$env.txt"

