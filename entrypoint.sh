#!/bin/sh

SOURCE="${2:-$GITHUB_WORKSPACE}"

#echo "Config: $1"
#echo "Source $SOURCE"

# next version (post alpha.15)
# /senf once --root "$1" --output markdown > "$GITHUB_STEP_SUMMARY"

/senf once --config "$1" --source "$SOURCE" --output markdown > "$GITHUB_STEP_SUMMARY"
ret=$?

exit $ret
