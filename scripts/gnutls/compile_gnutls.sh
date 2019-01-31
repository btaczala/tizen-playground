#!/bin/bash

source ../common.sh 

if [ ! -d gnutls-3.6.6 ]; then
    wget https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.6.tar.xz
    tar xf gnutls-3.6.6.tar.xz
fi
cd gnutls-3.6.6

echo "PKG_CONFIG_DIR: $PKG_CONFIG_LIBDIR"
echo "SYSROOT: $tizen_sysroot"
GMP_LIBS="-L$tizen_sysroot/usr/lib/engines/" \
CC="$tizen_root/tools/arm-linux-gnueabi-gcc-6.2/bin/arm-linux-gnueabi-gcc --sysroot=$tizen_sysroot" \
CXX="$tizen_root/tools/arm-linux-gnueabi-gcc-6.2/bin/arm-linux-gnueabi-g++ --sysroot=$tizen_sysroot" \
HOGWEED_LIBS="-L$tizen_install_path/lib -lhogweed -L$tizen_install_path/lib -lnettle" \
./configure --host=arm-linux-gnueabi --disable-openssl-compatibility \
    --disable-doc --disable-tests --disable-valgrind-tests --disable-optional-args \
    --disable-tools \
    --with-included-libtasn1 --disable-libdane \
    --disable-guile --without-p11-kit --without-tpm --disable-silent-rules \
    --with-included-unistring \
    --enable-static --disable-shared \
    --with-sysroot=$tizen_sysroot \
    --prefix=$tizen_install_path
#make 
#HOGWEED_CFLAGS="-I$tizen_install_path/include" \
cd -
