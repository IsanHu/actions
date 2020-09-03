#!/bin/bash

set -eo pipefail

xcodebuild -scheme heishi-ios \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/heishi-ios.xcarchive \
            clean archive | xcpretty
