#!/usr/bin/env bash

set -euo pipefail

EXPECTED_SUBSCRIPTION_ID="${EXPECTED_SUBSCRIPTION_ID:-dcff2440-c9c8-4137-aa05-f786ebe55f6e}"
BACKEND_RESOURCE_GROUP="${BACKEND_RESOURCE_GROUP:-rg-dev-enterprise-001}"
BACKEND_STORAGE_ACCOUNT="${BACKEND_STORAGE_ACCOUNT:-stadvodevcusinfra}"
BACKEND_CONTAINER="${BACKEND_CONTAINER:-tfstate}"
BACKEND_KEY="${BACKEND_KEY:-dev/Advocate-Construction-Infra.tfstate}"
TFVARS_FILE="${TFVARS_FILE:-environments/dev/dev.tfvars}"
PLAN_OUT_FILE="${PLAN_OUT_FILE:-tfplan-dev}"

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

require_command() {
  local command_name="$1"
  if ! command -v "$command_name" >/dev/null 2>&1; then
    echo "Error: '$command_name' is required but not installed."
    exit 1
  fi
}

require_command az
require_command terraform

current_subscription_id="$(az account show --query id -o tsv)"
current_subscription_name="$(az account show --query name -o tsv)"
current_subscription_state="$(az account show --query state -o tsv)"
current_tenant_id="$(az account show --query tenantId -o tsv)"

echo "Tenant: $current_tenant_id"
echo "Subscription: $current_subscription_name ($current_subscription_id)"
echo "State: $current_subscription_state"

if [[ "$current_subscription_id" != "$EXPECTED_SUBSCRIPTION_ID" ]]; then
  echo "Warning: Active subscription does not match expected ID $EXPECTED_SUBSCRIPTION_ID"
fi

if [[ "$current_subscription_state" != "Enabled" ]]; then
  echo "Blocked: subscription state is '$current_subscription_state'. Re-enable it, then rerun this script."
  exit 2
fi

pushd "$ROOT_DIR" >/dev/null

terraform init -input=false -reconfigure \
  -backend-config="resource_group_name=$BACKEND_RESOURCE_GROUP" \
  -backend-config="storage_account_name=$BACKEND_STORAGE_ACCOUNT" \
  -backend-config="container_name=$BACKEND_CONTAINER" \
  -backend-config="key=$BACKEND_KEY"

terraform plan -input=false -var-file="$TFVARS_FILE" -out="$PLAN_OUT_FILE"

popd >/dev/null

echo "Success: Terraform plan written to $PLAN_OUT_FILE"