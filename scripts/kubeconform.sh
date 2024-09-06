#!/bin/bash

# Define common parameters
COMMON_PARAMS="-verbose -summary -schema-location default -strict"

# Define each schema location and its corresponding ignore patterns
run_kubeconform() {
    local schema_location=$1
    shift
    local ignore_patterns="$@"
    
    # Build ignore parameters string
    local ignore_params=""
    for pattern in $ignore_patterns; do
        ignore_params="$ignore_params -ignore-filename-pattern $pattern"
    done
    
    # Run kubeconform command
    kubeconform $COMMON_PARAMS -schema-location "$schema_location" $ignore_params ./development
}

# Call run_kubeconform with different schemas and ignore patterns
run_kubeconform "./schemas/externalsecret_v1beta1.json" "secret-store.yaml" "apidefinitions.yaml"
run_kubeconform "./schemas/apidefinition_v1alpha1.json" "external-secret.yaml" "secret-store.yaml"
run_kubeconform "./schemas/secretstore_v1beta1.json" "external-secret.yaml" "apidefinitions.yaml"
