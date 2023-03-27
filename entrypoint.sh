#!/bin/sh

SOURCE="${3:-$GITHUB_WORKSPACE}"

#echo "Policy dir: $1"
#echo "Config: $2"
#echo "Source $SOURCE"

/senf once --config "$2" --source "$SOURCE"  --output json > /tmp/result.json
ret=$?

/summary.sh /tmp/result.json "$GITHUB_STEP_SUMMARY"

exit $ret
