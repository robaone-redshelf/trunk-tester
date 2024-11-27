#!/bin/bash

# This scripts generates a matrix object string from a list of projects.
# The matrix object string is used in the GitHub Actions workflow file.

# The script expects a list of projects as input.

PROJECTS="$(cat)"

# generate the json object
MATRIX_OBJECT="{\"include\":[{\"project\":\".\"},"
for PROJECT in $PROJECTS; do
  MATRIX_OBJECT="${MATRIX_OBJECT}{\"project\":\"${PROJECT}\"},"
done
MATRIX_OBJECT="${MATRIX_OBJECT%?}]}" # remove the last comma

# print the json object

# Validate and output JSON
if ! echo "$MATRIX_OBJECT" | jq . >/dev/null 2>&1; then
    echo "Error: Generated invalid JSON" >&2
    exit 1
fi
echo "$MATRIX_OBJECT"