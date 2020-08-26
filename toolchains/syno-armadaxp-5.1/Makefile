TC_NAME = syno-$(TC_ARCH)

TC_ARCH = armadaxp
TC_VERS = 5.1
TC_FIRMWARE = 5.0-4458

TC_DIST = gcc464_glibc215_hard_armada-GPL
TC_EXT = tgz
TC_DIST_NAME = $(TC_DIST).$(TC_EXT)
TC_DIST_SITE = https://sourceforge.net/projects/dsgpl/files/Tool%20Chain/DSM%205.1%20Tool%20Chains/Marvell%20Armada%20XP%20Linux%203.2.40

TC_BASE_DIR = arm-marvell-linux-gnueabi
TC_ADDITIONAL_CFLAGS = -mhard-float -mfpu=vfpv3-d16
TC_INCDIR = $(TC_BASE_DIR)/libc/usr/include
TC_LIBDIR = $(TC_BASE_DIR)/libc/usr/lib

include ../../mk/spksrc.tc.mk
