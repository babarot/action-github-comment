#!/bin/bash

repository="${INPUT_REPOSITORY}"
number="${INPUT_NUMBER}"
body="${INPUT_BODY}"

if [[ ! ${repository} == */* ]]; then
  echo "[ERROR] repository ${repository}: invalid" >&2
  exit 1
fi

if [[ ! ${number} =~ ^[0-9]+$ ]]; then
  echo "[ERROR] number ${number}: invalid" >&2
  exit 1
fi

if [[ -z ${body} ]]; then
  echo "[ERROR] body: should not be empty" >&2
  exit 1
fi

github-comment \
  --repository="${repository}" \
  --number="${number}" \
  --body="${body}"

if (( ${?} == 0 )); then
  echo "[INFO] successfully done"
  exit 0
fi

exit 1
