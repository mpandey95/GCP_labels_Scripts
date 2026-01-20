# Cloud Run Function Label Update Script

This script is designed to list Cloud Run functions in a specified environment, clean up the output, and then update each function's labels with its name.

## Prerequisites

- Ensure you have the [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) installed and configured.
- The script requires `gcloud` to be authenticated with the necessary permissions to manage Cloud Run functions in the desired project.
- This script assumes you have functions deployed in Cloud Run within the `asia-south1` region.

## Script Overview

This script performs the following steps:

1. Defines an environment variable (e.g., `prod`, `dev`, `uat`, `pilot`).
2. Lists all Cloud Run functions in the specified environment.
3. Filters and cleans the list of functions.
4. Iterates over each function name and updates its labels, setting the `cloud_run_function_name` label to the function's name.

## Usage

1. Clone or download this script to your local environment.
2. Choose your environment folder: `dev/`, `pilot/`, `uat/`, or `prod/`
3. Modify the `env` variable if needed in the script.
4. Run the appropriate script for your environment.

```bash
#!/bin/bash

# Define the environment variable
env="prod"

# List the functions in the specified environment and save to file
gcloud functions list | grep "$env" > "$env.txt"

# Loop through each function name and update the labels
while read -r function_name; do
  gcloud functions update "$function_name" \
    --region=asia-south1 \
    --update-labels=cloud_run_function_name="$function_name"
done < "$env.txt"
```

## Supported Environments

- `dev` - Development environment
- `pilot` - Pilot/Testing environment
- `uat` - User Acceptance Testing environment
- `prod` - Production environment

## Environment-specific Directories

Each subdirectory contains pre-configured scripts for that specific environment:
- **dev/** - Scripts for development functions
- **pilot/** - Scripts for pilot functions
- **uat/** - Scripts for UAT functions
- **prod/** - Scripts for production functions

## Notes

- Always review the generated `.txt` file before running the update command
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
