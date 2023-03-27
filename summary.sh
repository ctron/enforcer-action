#!/bin/bash

INPUT=$(cat "$1")
OUTPUT=$2

# Extract status and details from INPUT
# shellcheck disable=SC2086
status=$(echo $INPUT | jq -r '.status')
details=$(echo $INPUT | jq -c '.details[]')

# Add overall status and title
echo "# Seedwing Enforcer Dependency analysis" >> $OUTPUT
if [ "$status" = "Rejected" ]; then
  echo "" >> $OUTPUT
  echo "# ❌ $status" >> $OUTPUT
else
  echo "" >> $OUTPUT
  echo "# ✔️ $status" >> $OUTPUT
fi

echo "" >> $OUTPUT
echo "" >> $OUTPUT



# Define table header
echo "| PURL | Satisfied | Reason |" >> $OUTPUT
echo "| --- | --- | --- |" >> $OUTPUT

# Loop over details and extract input.purl, satisfied and reason
while read -r detail; do

  purl=$(echo "$detail" | jq -r '.dependency.purl')
  outcome=$(echo "$detail" | jq -r '.outcome')

  # Format table row
  if [ "$outcome" = "Ok" ]; then
    echo "| $purl | ✔️ | |" >> $OUTPUT
  else
    reason=$(echo "$outcome" | jq -r '.RejectedRaw')
    echo $reason
    echo "| $purl | ❌ | $reason |" >> $OUTPUT
  fi
done <<< "$details"

