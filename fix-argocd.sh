#!/bin/bash
set -e

# Reapply Redis secret
oc apply -f argocd-redis-secret.yaml

# Recreate Redis deployment
oc delete deploy argocd-redis -n argocd --ignore-not-found
oc apply -f argocd-redis.yaml

# Link pull secret to default SA
oc get secret -n openshift-config pull-secret -o jsonpath='{.data.\.dockerconfigjson}' | base64 -d > /tmp/.dockerconfigjson
oc create secret generic pull-secret -n argocd --from-file=.dockerconfigjson=/tmp/.dockerconfigjson --type=kubernetes.io/dockerconfigjson --dry-run=client -o yaml | oc apply -f -
oc secrets link default pull-secret --for=pull -n argocd

# Restart all ArgoCD pods
oc delete pod -n argocd --all