#!/bin/bash

set -e
VERSION=$(git ls-remote --tags https://github.com/nix-community/nixos-images.git | grep -v assets | grep -v nixos-unstable | awk -F'/' '{print $3}' | sort -r | paste -s -d 'Q' -)

# make sure the return has a sane version
while [[ "${VERSION}" =~ ^nixos-.* ]]; do
  echo "${VERSION}"
  exit 0
done
exit 1

