#!/bin/bash
set -e

# Day 3 automation script – redeploy Nginx with ConfigMap, Service, and Route

NAMESPACE="day2-demo"
APP_NAME="nginx-deploy"
CONFIGMAP_NAME="nginx-html"
YAML_FILE="nginx-deploy-with-configmap.yaml"
INDEX_FILE="index.html"

echo "=== Day 3 Demo Automation ==="

# Step 1: Ensure namespace exists
oc get ns $NAMESPACE >/dev/null 2>&1 || oc create ns $NAMESPACE
oc project $NAMESPACE

# Step 2: Recreate ConfigMap from index.html
if [ -f "$INDEX_FILE" ]; then
  echo "Creating ConfigMap from $INDEX_FILE..."
  oc create configmap $CONFIGMAP_NAME \
    --from-file=$INDEX_FILE \
    --dry-run=client -o yaml | oc apply -f -
else
  echo "ERROR: $INDEX_FILE not found!"
  exit 1
fi

# Step 3: Apply Deployment + Service + Route
if [ -f "$YAML_FILE" ]; then
  echo "Applying $YAML_FILE..."
  oc apply -f $YAML_FILE
else
  echo "ERROR: $YAML_FILE not found!"
  exit 1
fi

# Step 4: Restart deployment to pick up ConfigMap changes
echo "Restarting deployment..."
oc rollout restart deployment/$APP_NAME

# Step 5: Wait for rollout
echo "Waiting for deployment rollout..."
oc rollout status deployment/$APP_NAME --timeout=60s

# Step 6: Show route URL
ROUTE=$(oc get route $APP_NAME -o jsonpath='{.spec.host}')
echo "Route available at: http://$ROUTE"

# Step 7: Test application
echo "Testing route..."
curl -k http://$ROUTE || echo "Curl test failed. Try in browser."
