#!/bin/bash
set -e
VERSION=$(curl -s http://tinycorelinux.net/downloads.html |awk -F '(<a href="|/x86/release/)' '/Core x86 Release Files/ {print $2}')
# make sure the return has a sane version
while [[ "${VERSION}" =~ ^[0-9][0-9].x* ]]; do
  echo "${VERSION}"
  exit 0
done
exit 1
