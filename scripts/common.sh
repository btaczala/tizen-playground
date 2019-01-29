#!/bin/bash
tizen_root='/Users/bartosztaczala/tizen-studio'
tizen_sysroot="$tizen_root/platforms/tizen-4.0/wearable/rootstraps/wearable-4.0-device.core"
tizen_install_path="$(git rev-parse --show-toplevel)/install"

export PKG_CONFIG_DIR=""
export PKG_CONFIG_LIBDIR="$tizen_install_path/lib/pkgconfig"
export PKG_CONFIG_SYSROOT_DIR="$tizen_sysroot"
