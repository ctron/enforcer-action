#!/bin/sh

ROOT="${1:-$GITHUB_WORKSPACE}"

/senf once --root "$ROOT" --output markdown > "$GITHUB_STEP_SUMMARY"
ret=$?

exit $ret
