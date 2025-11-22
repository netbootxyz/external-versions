#!/bin/bash
set -e
# obtain latest releases having netboot available
VERSION=$(curl -sL http://dl-cdn.alpinelinux.org/alpine/ | awk -F'(href="|/">)' '/href/ {print $2}' | grep -Po "v\d+.*" | sort -rV | head -n 3 | sed 's/^v//')
# make sure the return has a sane version and netboot is at least available for x64
for this_version in $VERSION; do

    status_code=$(curl --output /dev/null --silent --write-out "%{http_code}" "http://dl-cdn.alpinelinux.org/alpine/v${this_version}/releases/x86_64/netboot/vmlinuz-lts")
    if [ "$status_code" = "200" ]; then
        echo "${this_version}"
        exit 0

    fi
done
exit 1
