
# Enterprise Azure Terraform

Production-grade reusable Terraform modules with Azure DevOps CI/CD.

## Features
- Modular Terraform structure
- Separate DEV and PROD tfvars
- Reusable modules
- Single Azure DevOps YAML
- Enterprise naming standards
- Multiple subnet support
- PostgreSQL Flexible Server
- App Service & WebApp
- KeyVault
- Storage Account
- Log Analytics
- Monitoring

## Recheck DEV plan
Run the helper script after a subscription is re-enabled:

```bash
chmod +x scripts/recheck-dev-plan.sh
./scripts/recheck-dev-plan.sh
```

Optional overrides:
- `EXPECTED_SUBSCRIPTION_ID`
- `BACKEND_RESOURCE_GROUP`
- `BACKEND_STORAGE_ACCOUNT`
- `BACKEND_CONTAINER`
- `BACKEND_KEY`
- `TFVARS_FILE`
- `PLAN_OUT_FILE`
