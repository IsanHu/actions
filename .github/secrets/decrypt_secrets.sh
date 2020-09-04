#!/bin/sh
set -eo pipefail
echo "$IOS_KEYS"
echo "ddd1"
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/Heishi_AppStore.mobileprovision ./.github/secrets/Heishi_AppStore.mobileprovision.gpg
echo "ddd2"
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/HeiShi.p12 ./.github/secrets/HeiShi.p12.gpg
echo "ddd3"
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
echo "ddd4"
cp ./.github/secrets/Heishi_AppStore.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/Heishi_AppStore.mobileprovision
ls -al ~/Library/MobileDevice/Provisioning\ Profiles
chmod 777 ~/Library/MobileDevice/Provisioning\ Profiles/Heishi_AppStore.mobileprovision
ls -al ~/Library/MobileDevice/Provisioning\ Profiles
echo "ddd5"

security create-keychain -p "" build.keychain
echo "ddd6"
security import ./.github/secrets/HeiShi.p12 -t agg -k ~/Library/Keychains/build.keychain -P "123456" -A
echo "ddd7"

security list-keychains -s ~/Library/Keychains/build.keychain
echo "ddd8"
security default-keychain -s ~/Library/Keychains/build.keychain
echo "ddd9"
security unlock-keychain -p "" ~/Library/Keychains/build.keychain
echo "ddd10"

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
echo "ddd11"
