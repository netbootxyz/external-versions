#!/bin/bash
set -e
VERSION=$(git ls-remote --tags https://github.com/nix-community/nixos-images.git | awk -F'/' '{print $3}')
# make sure the return has a sane version
while [[ "${VERSION}" =~ ^nixos-.* ]]; do
  echo "${VERSION}"
  exit 0
done
exit 1
