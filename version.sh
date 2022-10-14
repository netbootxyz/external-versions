#!/bin/bash
set -e
VERSION=$(curl -sL https://www.ipfire.org/download | awk -F '(x/|/ipfire-)' '/-x86_64/ {print $3;exit}')
# make sure the return has a sane version
while [[ "${VERSION}" =~ ^[0-9].[0-9][0-9]-core* ]]; do
  echo "${VERSION}"
  exit 0
done
exit 1
