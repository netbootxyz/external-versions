#!/bin/bash
set -e
VERSION=$(curl -sfL http://mirrors.kernel.org/mageia/distrib/8/x86_64/VERSION | awk '{print $2}')
# make sure the return has a sane version
echo $VERSION
exit 0
