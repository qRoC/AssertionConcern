#!/usr/bin/env bash

# This file is part of the Loobee package.
#
# (c) Andrey Savitsky <contact@qroc.pro>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

GYP_PY="${SCRIPT_DIR}/../external/gyb.py"
PROJECT_DIR="${SCRIPT_DIR}/../.."

if [ ! -f ${GYP_PY} ]; then
    echo "Downloads gyb.py..."

    source "${SCRIPT_DIR}/../utils/os.sh"
    packages_install curl

    curl -o ${GYP_PY} https://raw.githubusercontent.com/apple/swift/master/utils/gyb.py
    chmod +x ${GYP_PY}
fi

find ${PROJECT_DIR} -name '*.gyb' | while read file; do
    echo ${file}
    ${GYP_PY} --line-directive '' -o "${file%.gyb}" "$file";
done
