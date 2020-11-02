#!/bin/bash
set -e
VERSION=$(curl -sfL https://builds.coreos.fedoraproject.org/streams/stable.json | jq -r '.architectures.x86_64.artifacts.metal.release')
# make sure the return has a sane version
while [[ "${VERSION}" =~ ^[0-9]{2}.[0-9]{8}.[0-9]{1}.[0-9]{1} ]]; do
  echo "${VERSION}"
  exit 0
done
exit 1
