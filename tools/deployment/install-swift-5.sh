#!/usr/bin/env bash

# This file is part of the Loobee package.
#
# (c) Andrey Savitsky <contact@qroc.pro>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "${SCRIPT_DIR}/../utils/os.sh"

if is_macOS; then
    URL_PATH_DATA1="xcode"
    URL_PATH_DATA2="osx.pkg"
else
    URL_PATH_DATA1="${OS_ID}${OS_VERSION_SHORT}"
    URL_PATH_DATA2="${OS_ID}${OS_VERSION}.tar.gz"

    packages_install curl
fi

SWIFT_SITE="https://swift.org"
URL_PATH_REGEX="/builds/swift-5.0-branch/${URL_PATH_DATA1}/swift-5.0-DEVELOPMENT-SNAPSHOT-[0-9]{4}-[0-9]{2}-[0-9]{2}-a/swift-5.0-DEVELOPMENT-SNAPSHOT-[0-9]{4}-[0-9]{2}-[0-9]{2}-a-${URL_PATH_DATA2}"
LAST_SNAPSHOT_URL_PATH=$(curl -s "${SWIFT_SITE}/download/" | grep -oE "${URL_PATH_REGEX}" | sort | tail -1)
[[ -z "${LAST_SNAPSHOT_URL_PATH}" ]] && { echo "Error: URLS NOT FOUND. Given regex: ${URL_PATH_REGEX}"; exit 1; }
LAST_SNAPSHOT_URL="${SWIFT_SITE}${LAST_SNAPSHOT_URL_PATH}"

source ${SCRIPT_DIR}/install-swift-snapshot.sh ${LAST_SNAPSHOT_URL}
