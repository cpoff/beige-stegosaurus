#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5fa9f19fa528ed001c965420/webhook/build/pull > /dev/null
curl -s -X POST https://api.stackbit.com/project/5fa9f19fa528ed001c965420/webhook/build/ssgbuild > /dev/null
make prepare && hugo --source demo --baseURL "/"
curl -s -X POST https://api.stackbit.com/project/5fa9f19fa528ed001c965420/webhook/build/publish > /dev/null
