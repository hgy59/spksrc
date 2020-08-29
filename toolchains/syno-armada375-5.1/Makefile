TC_NAME = syno-$(TC_ARCH)

TC_ARCH = armada375
TC_VERS = 5.1
TC_FIRMWARE = 5.1-5004

TC_DIST = gcc464_glibc215_hard_armada375-GPL
TC_EXT = tgz
TC_DIST_NAME = $(TC_DIST).$(TC_EXT)
TC_DIST_SITE = https://sourceforge.net/projects/dsgpl/files/Tool%20Chain/DSM%205.1%20Tool%20Chains/Marvell%20Armada%20375%20Linux%203.2.40

TC_BASE_DIR = armv7-marvell-linux-gnueabi-hard
TC_PREFIX = arm-marvell-linux-gnueabi
TC_ADDITIONAL_CFLAGS = -mhard-float
TC_ADDITIONAL_CPPFLAGS = -mhard-float -mfpu=vfpv3
TC_INCDIR = $(TC_PREFIX)/libc/usr/include
TC_LIBDIR = $(TC_PREFIX)/libc/usr/lib

include ../../mk/spksrc.tc.mk
