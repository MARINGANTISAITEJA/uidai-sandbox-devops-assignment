#!/bin/bash

NAMESPACE=$1
OUTPUT_FILE="${NAMESPACE}_crashloop_logs.txt"

if [ -z "$NAMESPACE" ]; then
  echo "Usage: ./triage.sh <namespace>"
  exit 1
fi

echo "Collecting CrashLoopBackOff pod logs in namespace: $NAMESPACE"

PODS=$(kubectl get pods -n $NAMESPACE --no-headers | grep CrashLoopBackOff | awk '{print $1}')

if [ -z "$PODS" ]; then
  echo "No CrashLoopBackOff pods found in namespace $NAMESPACE"
  exit 0
fi

for POD in $PODS
do
  echo "======================================" >> $OUTPUT_FILE
  echo "Pod Name: $POD" >> $OUTPUT_FILE
  echo "======================================" >> $OUTPUT_FILE

  kubectl logs $POD -n $NAMESPACE --tail=50 >> $OUTPUT_FILE 2>&1

  echo "" >> $OUTPUT_FILE
done

echo "Triage completed. Logs saved to $OUTPUT_FILE"
