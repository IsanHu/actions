#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/heishi-ios.xcarchive \
            -exportOptionsPlist /Users/isanhu/Desktop/CICD/ExportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty
