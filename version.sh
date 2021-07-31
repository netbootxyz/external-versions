#!/bin/bash
set -e
VERSION=$(curl -sfL http://mirrors.kernel.org/archlinux/iso/latest/md5sums.txt | awk -F '(archlinux-|-x86_64.iso)' '/-x86_64.iso/ {print $2;exit}')
# make sure the return has a sane version
while [[ "${VERSION}" =~ ^[0-9]{4}.[0-9]{2}.[0-9]{2}$ ]]; do
  echo "${VERSION}"
  exit 0
done
exit 1
