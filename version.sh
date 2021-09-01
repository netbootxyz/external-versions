#!/bin/bash
set -e
for VERSION in stable testing next; do
  ITEM=$(curl -sfL https://builds.coreos.fedoraproject.org/streams/${VERSION}.json | jq -r '.architectures.x86_64.artifacts.metal.release')
  ALL_VERSIONS+=$ITEM-${VERSION},
done

# make sure the return has a sane version
while [[ "${ALL_VERSIONS}" =~ ^[0-9]{2}.[0-9]{8}.[0-9]{1}.[0-9]{1} ]]; do
  echo "${ALL_VERSIONS}" | sed 's/.$//'
  exit 0
done
exit 1
