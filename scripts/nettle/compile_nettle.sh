#!/bin/zsh
#
source ../common.sh

if [ ! -d "nettle-3.4" ]; then 
    wget https://ftp.gnu.org/gnu/nettle/nettle-3.4.tar.gz
    tar xf nettle-3.4.tar.gz
fi

cd nettle-3.4
GMP_LIBS="-L$tizen_root/platforms/tizen-4.0/wearable/rootstraps/wearable-4.0-device.core/usr/lib/engines/" \
CC="$tizen_root/tools/arm-linux-gnueabi-gcc-6.2/bin/arm-linux-gnueabi-gcc --sysroot=$tizen_sysroot" \
CXX="$tizen_root/tools/arm-linux-gnueabi-gcc-6.2/bin/arm-linux-gnueabi-g++ --sysroot=$tizen_sysroot" \
./configure --host=arm-linux-gnueabi --prefix=$tizen_install_path
make 
make install
cd -
