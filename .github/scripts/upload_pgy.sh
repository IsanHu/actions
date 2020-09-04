#!/bin/bash
set -eo pipefail
echo "upload111"
result=`curl -F 'file=@'$PWD'/build/heishi-ios.ipa' -F "_api_key=$PGY_API_KEY" https://www.pgyer.com/apiv2/app/upload`
echo $result
echo "upload222"