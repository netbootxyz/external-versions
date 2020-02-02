#!/bin/bash

curl -fsL https://netboot.joyent.com/smartos.ipxe | grep -A 4 'Platform Images' | awk '/space/ {printf $4","}' |sed 's/.$//'
