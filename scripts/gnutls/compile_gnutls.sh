#!/bin/bash

wget https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.6.tar.xz
tar xf gnutls-3.6.6
tizen_root='/$tizen_root'

cd gnutls-3.6.6
GMP_LIBS='-L$tizen_root/platforms/tizen-4.0/wearable/rootstraps/wearable-4.0-device.core/usr/lib/engines/' \
CC='$tizen_root/tools/arm-linux-gnueabi-gcc-6.2/bin/arm-linux-gnueabi-gcc --sysroot=$tizen_root/platforms/tizen-4.0/wearable/rootstraps/wearable-4.0-device.core/' \
CXX='$tizen_root/tools/arm-linux-gnueabi-gcc-6.2/bin/arm-linux-gnueabi-g++ --sysroot=$tizen_root/platforms/tizen-4.0/wearable/rootstraps/wearable-4.0-device.core/' \
./configure --host=arm-linux-gnueabi --disable-openssl-compatibility --disable-doc --disable-tests --disable-valgrind-tests --enable-local-libopts --enable-libopts-install --with-included-libtasn1 --disable-libdane --disable-guile --without-p11-kit --without-tpm --disable-silent-rules --with-sysroot=$tizen_root/platforms/tizen-4.0/wearable/rootstraps/wearable-4.0-device.core/ --with-included-unistring
#make 
cd -
