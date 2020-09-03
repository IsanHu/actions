#!/bin/sh
set -eo pipefail
echo "$IOS_KEYS"
echo "ddd1"
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/match_AppStore_comtiagosantocalculatorIOS.mobileprovision.mobileprovision ./.github/secrets/match_AppStore_comtiagosantocalculatorIOS.mobileprovision.gpg
echo "ddd2"
gpg --quiet --batch --yes --decrypt --passphrase="$IOS_KEYS" --output ./.github/secrets/Certificates.p12 ./.github/secrets/Certificates.p12.gpg
echo "ddd3"
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
echo "ddd4"
cp ./.github/secrets/match_AppStore_comtiagosantocalculatorIOS.mobileprovision.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/match_AppStore_comtiagosantocalculatorIOS.mobileprovision.mobileprovision
echo "ddd5"

security create-keychain -p "" build.keychain
echo "ddd6"
security import ./.github/secrets/Certificates.p12 -t agg -k ~/Library/Keychains/build.keychain -P "123456" -A
echo "ddd7"

security list-keychains -s ~/Library/Keychains/build.keychain
echo "ddd8"
security default-keychain -s ~/Library/Keychains/build.keychain
echo "ddd9"
security unlock-keychain -p "" ~/Library/Keychains/build.keychain
echo "ddd10"

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain
echo "ddd11"
