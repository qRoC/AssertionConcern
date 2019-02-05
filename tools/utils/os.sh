#!/usr/bin/env bash

# This file is part of the Loobee package.
#
# (c) Andrey Savitsky <contact@qroc.pro>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

if (uname | grep 'Darwin' >/dev/null); then
    export OS_NAME="Darwin"
else
    export OS_NAME="Linux"
    export OS_ID=$(cat /etc/os-release | grep -w ID | cut -d '=' -f 2)
    export OS_VERSION=$(cat /etc/os-release | grep -w VERSION_ID | cut -d '"' -f 2)
    export OS_VERSION_SHORT=${OS_VERSION//./}
fi

is_linux()
{
    [[ "$OS_NAME" == "Linux" ]]
}

is_macOS()
{
    [[ "$OS_NAME" == "Darwin" ]]
}

is_root()
{
	[[ "$(id -u)" == "0" ]]
}

packages_install() {
    if is_root; then
        apt-get -qq update
        apt-get install -y curl
    else
        sudo apt-get -qq update
        sudo apt-get install -y curl
    fi
}
