#!/bin/bash
# zrwh-cbbu-jwnp-ovqm   github actions
set -eo pipefail

xcodebuild -workspace Calculator.xcworkspace \
            -scheme Calculator\ iOS \
            -destination platform=iOS\ Simulator,OS=13.6,name=iPhone\ 11 \
            clean test | xcpretty


