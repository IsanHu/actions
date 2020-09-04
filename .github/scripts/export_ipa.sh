#!/bin/bash

set -eo pipefail
echo "export111"
xcodebuild -archivePath $PWD/build/heishi-ios.xcarchive \
            -exportOptionsPlist /Users/isanhu/Desktop/CICD/ExportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
echo "export222"