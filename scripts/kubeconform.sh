#!/bin/bash

kubeconform -verbose -summary -strict ./development/apps/**/deployment/*
kubeconform -verbose -summary -strict -schema-location "./schemas/secretstore_v1beta1.json" ./development/apps/**/secret/secret-store.yaml
kubeconform -verbose -summary -strict -schema-location "./schemas/externalsecret_v1beta1.json" ./development/apps/**/secret/external-secret.yaml
kubeconform -verbose -summary -strict -schema-location "./schemas/apidefinition_v1alpha1.json" ./development/apps/**/secret/apidefinitions.yaml
