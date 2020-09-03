#!/bin/bash

set -eo pipefail

xcodebuild -project heishi-ios/heishi-ios.xcodeproj \
            -scheme heishi-ios \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/heishi-ios.xcarchive \
            clean archive | xcpretty
