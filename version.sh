#!/bin/bash

set -e
VERSION=$(curl --silent "https://api.github.com/repos/kairos-io/kairos/releases/latest" | jq -r .tag_name)
echo "${VERSION}"
