#!/bin/bash
set -eo pipefail
echo "====="
echo $PGY_API_KEY
echo "====="
result=`curl -F 'file=@'$PWD'/build/heishi-ios.ipa' -F "_api_key=$PGY_API_KEY" https://www.pgyer.com/apiv2/app/upload`
echo $result

