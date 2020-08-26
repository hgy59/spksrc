TC_NAME = syno-$(TC_ARCH)

TC_ARCH = ipq806x
TC_VERS = 1.1
TC_FIRMWARE = 1.1-6931

TC_DIST = gcc493_glibc220_hard-GPL
TC_EXT = tgz
TC_DIST_NAME = $(TC_DIST).$(TC_EXT)
TC_DIST_SITE = https://sourceforge.net/projects/dsgpl/files/SRM%201.1%20Tool%20Chains/QUALCOMM%20IPQ806X%20Linux%203.4.103
TC_DIST_FILE = $(TC_ARCH)-$(TC_DIST_NAME)

TC_BASE_DIR = arm-unknown-linux-gnueabi
TC_INCDIR = $(TC_BASE_DIR)/sysroot/usr/include
TC_LIBDIR = $(TC_BASE_DIR)/sysroot/lib

include ../../mk/spksrc.tc.mk
