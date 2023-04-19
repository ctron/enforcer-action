#!/bin/sh

SOURCE="${3:-$GITHUB_WORKSPACE}"

#echo "Policy dir: $1"
#echo "Config: $2"
#echo "Source $SOURCE"

# next version (post alpha.15)
# /senf once --root "$2" --output markdown > "$GITHUB_STEP_SUMMARY"

/senf once --config "$2" --source "$SOURCE"  --output markdown > "$GITHUB_STEP_SUMMARY"
ret=$?

exit $ret
