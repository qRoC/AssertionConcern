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
    curl -o Swift.pkg $1
    sudo installer -pkg Swift.pkg -target /
    export TOOLCHAINS=swift
else
    packages_install curl clang libicu-dev libpython2.7 libxml2

    curl -o Swift.tar.gz $1
    mkdir -p Swift && tar xzf Swift.tar.gz -C $_ --strip 1
    export PATH="${PWD}/Swift/usr/bin:${PATH}"
    rm -f Swift.tar.gz
fi
