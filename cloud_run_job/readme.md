# Cloud Run Job Label Update Script

This script is designed to list Cloud Run jobs in a specified environment (e.g., `prod`), clean up the output, and then update each job's labels with its name.

## Prerequisites

- Ensure you have the [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed and configured.
- The script requires `gcloud` to be authenticated with the necessary permissions to manage Cloud Run jobs in the desired project.
- This script assumes you have jobs deployed in Cloud Run within the `asia-south1` region.

## Script Overview

This script performs the following steps:

1. Defines an environment variable (`prod` by default).
2. Lists all Cloud Run jobs in the specified environment.
3. Filters and cleans the list of jobs by removing the `JOB:` prefix.
4. Iterates over each job name and updates its labels, setting the `cloud_run_job_name` label to the job's name.

## Usage

1. Clone or download this script to your local environment.
2. Choose your environment folder: `dev/`, `pilot/`, `uat/`, or `prod/`
3. Modify the `env` variable if you want to target a different environment.
4. Run the script:

```bash
#!/bin/bash

# Define the environment variable
env="prod"

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
```

## Supported Environments

- `dev` - Development environment
- `pilot` - Pilot/Testing environment
- `uat` - User Acceptance Testing environment
- `prod` - Production environment

## Environment-specific Directories

Each subdirectory contains pre-configured scripts for that specific environment:
- **dev/** - Scripts for development jobs
- **pilot/** - Scripts for pilot jobs
- **uat/** - Scripts for UAT jobs
- **prod/** - Scripts for production jobs

## Notes

- Always review the generated `.txt` file before running the update command
- The script filters jobs by environment name in the job listing
- Test in non-production environments first
- Ensure you have the appropriate GCP IAM permissions before running these scripts

👨‍💻 Author
Manish Pandey Cloud | DevOps | Platform Engineer

🔗 GitHub: https://github.com/mpandey95
💼 LinkedIn: https://www.linkedin.com/in/manish-pandey95

⭐ Contributing
Contributions are welcome! Feel free to open issues or submit PRs to improve the script.

📜 License
MIT License – free to use, modify, and distribute.
