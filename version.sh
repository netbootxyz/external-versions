#!/bin/bash
set -e
VERSION=$(curl -fsL https://netboot.joyent.com/smartos.ipxe | awk '/^item --gap Platform Images/{flag=1;next}/^item --gap Options/{flag=0}flag {printf $4","}' |sed 's/.$//')
# make sure the return has a sane length
if [[ $(printf "${VERSION}" | wc -c) > 10 ]]; then
  echo "${VERSION}"
else
  exit 1
fi
