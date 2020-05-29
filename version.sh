#!/bin/bash
set -e
VERSION=$(curl -sL http://dl-cdn.alpinelinux.org/alpine/ | awk -F'(href="|/">)' '/href/ {print $2}' |grep -Po "v\d+.*" | sort -rV | head -n1 | sed 's/^v//')
# make sure the return has a sane version
while [[ "${VERSION}" =~ ^[0-9]{1}.[0-9] ]]; do
  echo "${VERSION}"
  exit 0
done
exit 1
