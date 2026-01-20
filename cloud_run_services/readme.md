# Cloud Run Service Label Update Script

This script helps you update labels for Google Cloud Run services, specifically targeting services in a given environment (e.g., `dev`). It lists all the services, filters by the environment name, and then updates the labels for each service to include the service name.

## Requirements

- Google Cloud SDK installed and configured: https://cloud.google.com/sdk/docs/install
- Access to Google Cloud Project with Cloud Run permissions
- `gcloud` command-line tool available and authenticated

## How It Works

1. **Define Environment**: The script defines the environment name (e.g., `dev`).
2. **List Cloud Run Services**: It lists all services in Cloud Run using `gcloud run services list` and filters them by the environment name.
3. **Update Labels**: For each service, it updates the label `cloud_run_service_name` to the service's name.

## Usage

1. Clone this repository or copy the script to your local machine.
2. Choose your environment folder: `dev/`, `pilot/`, `uat/`, or `prod/`
3. Modify the `env` variable to specify the desired environment if needed.
4. Ensure you have the required permissions and the Google Cloud SDK is properly set up.
5. Run the script in your terminal:

```bash
#!/bin/bash

# Define environment name
env="dev"

# List Cloud Run services, filter for the environment, and extract SERVICE names
gcloud run services list --format="value(SERVICE)" | grep "$env" > "$env.txt"

# Read each service name and update labels
while IFS= read -r service; do
  service=$(echo "$service" | xargs)  # Trim spaces
  echo "Updating label for service: [$service]"

  gcloud run services update "$service" \
    --region=asia-south1 \
    --update-labels=cloud_run_service_name="$service"
done < "$env.txt"
```

## Supported Environments

- `dev` - Development environment
- `pilot` - Pilot/Testing environment
- `uat` - User Acceptance Testing environment
- `prod` - Production environment

## Environment-specific Directories

Each subdirectory contains pre-configured scripts for that specific environment:
- **dev/** - Scripts for development services
- **pilot/** - Scripts for pilot services
- **uat/** - Scripts for UAT services
- **prod/** - Scripts for production services

## Notes

- Always review the generated `.txt` file before running the update command
- The script filters services by environment name in the service listing
- Test in non-production environments first
- Ensure you have the appropriate GCP IAM permissions before running these scripts
- Services are updated in the `asia-south1` region by default

👨‍💻 Author
Manish Pandey Cloud | DevOps | Platform Engineer

🔗 GitHub: https://github.com/mpandey95
💼 LinkedIn: https://www.linkedin.com/in/manish-pandey95

⭐ Contributing
Contributions are welcome! Feel free to open issues or submit PRs to improve the script.

📜 License
MIT License – free to use, modify, and distribute.
