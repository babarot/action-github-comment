#!/bin/bash

github-comment \
  --repository="${INPUT_REPOSITORY}" \
  --number="${INPUT_NUMBER}" \
  --body="${INPUT_BODY}"
