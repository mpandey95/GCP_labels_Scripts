# GCP Labels Scripts

This repository contains Google Cloud Platform (GCP) scripts to automatically label and manage Cloud Run functions, jobs, and services across different environments.

## Project Structure

```
cloud_run_function/     - Scripts for labeling Cloud Run Functions
cloud_run_job/          - Scripts for labeling Cloud Run Jobs
cloud_run_services/     - Scripts for labeling Cloud Run Services
```

Each directory contains scripts organized by environment:
- `dev/` - Development environment
- `pilot/` - Pilot/Testing environment
- `uat/` - User Acceptance Testing environment
- `prod/` - Production environment

## Overview

These scripts help manage and apply consistent labels to your GCP Cloud Run resources. Proper labeling is essential for:
- Resource organization and cost allocation
- Automated resource management
- Monitoring and logging
- Access control and security policies

## Getting Started

### Prerequisites

- Google Cloud SDK installed and configured: https://cloud.google.com/sdk/docs/install
- `gcloud` CLI properly authenticated with appropriate permissions
- Access to Google Cloud Project with Cloud Run management capabilities

### Usage

1. Navigate to the desired directory (e.g., `cloud_run_job/`)
2. Review and customize the environment variable in the script
3. Execute the appropriate script for your environment

Each directory contains a `readme.md` file with specific instructions for that resource type.

## Environments

| Environment | Purpose |
|---|---|
| dev | Development and testing |
| pilot | Pilot deployment and testing |
| uat | User Acceptance Testing |
| prod | Production environment |

## Resource Types

### Cloud Run Functions
Scripts to update labels for Cloud Run Functions with the function name as the label value.

### Cloud Run Jobs
Scripts to update labels for Cloud Run Jobs with the job name as the label value.

### Cloud Run Services
Scripts to update labels for Cloud Run Services with the service name as the label value.

## Notes

- All scripts target the `asia-south1` region by default
- Ensure you have proper IAM permissions before running scripts
- Test scripts in non-production environments first
- Review generated `.txt` files before applying labels to confirm correct resources are selected

## Support

For issues or questions, please review the individual `readme.md` files in each directory.

👨‍💻 Author
Manish Pandey Cloud | DevOps | Platform Engineer

🔗 GitHub: https://github.com/mpandey95
💼 LinkedIn: https://www.linkedin.com/in/manish-pandey95

⭐ Contributing
Contributions are welcome! Feel free to open issues or submit PRs to improve the script.

📜 License
MIT License – free to use, modify, and distribute.
