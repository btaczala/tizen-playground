# this one is important
SET(CMAKE_SYSTEM_NAME Linux)
#this one not so much
SET(CMAKE_SYSTEM_VERSION 1)

if(NOT DEFINED ENV{TIZEN_ROOT})
    message(FATAL_ERROR "Set TIZEN_ROOT to where tizen studio is installed")
endif()
set(TIZEN_ARCH "arm")
set(TIZEN_PLATFORM "wearable")
set(TIZEN_VERSION "4.0")

# specify the cross compiler
SET(CMAKE_C_COMPILER   ${TIZEN_ROOT}/tools/${TIZEN_ARCH}-linux-gnueabi-gcc-6.2/bin/${TIZEN_ARCH}-linux-gnueabi-gcc)
SET(CMAKE_CXX_COMPILER ${TIZEN_ROOT}/tools/${TIZEN_ARCH}-linux-gnueabi-gcc-6.2/bin/${TIZEN_ARCH}-linux-gnueabi-g++)
SET(CMAKE_SYSROOT ${TIZEN_ROOT}/platforms/tizen-${TIZEN_VERSION}/${TIZEN_PLATFORM}/rootstraps/${TIZEN_PLATFORM}-${TIZEN_VERSION}-device.core)

# where is the target environment
SET(CMAKE_FIND_ROOT_PATH ${CMAKE_SYSROOT})

#pkg-config
set(ENV{PKG_CONFIG_DIR} "")
set(ENV{PKG_CONFIG_LIBDIR} "${CMAKE_SYSROOT}/usr/lib/pkgconfig:${CMAKE_SYSROOT}/usr/share/pkgconfig")
set(ENV{PKG_CONFIG_SYSROOT_DIR} ${CMAKE_SYSROOT})


# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

SET(TIZEN ON)
add_definitions(-DTIZEN)
