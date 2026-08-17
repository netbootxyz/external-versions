#!/bin/bash
set -e

MIRROR=http://mirrors.kernel.org/mageia/distrib

# Walk release directories newest first and take the first official one.
# cauldron is skipped since it is always the devel tree.
for RELEASE in $(curl -sfL ${MIRROR}/ | grep -oE 'href="[0-9]+/"' | grep -oE '[0-9]+' | sort -rn); do
  VERSION=$(curl -sfL ${MIRROR}/${RELEASE}/x86_64/VERSION | grep Official | awk '{print $2}')
  # make sure the return has a sane version
  if [[ "${VERSION}" =~ ^[0-9]+$ ]]; then
    echo "${VERSION}"
    exit 0
  fi
done
exit 1
