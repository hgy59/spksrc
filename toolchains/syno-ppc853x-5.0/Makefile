TC_NAME = syno-$(TC_ARCH)

TC_ARCH = ppc853x
TC_VERS = 5.0
TC_FIRMWARE = 5.0-4458

TC_DIST = gcc4374_eglibc2874_qoriq-GPL
TC_EXT = tgz
TC_DIST_NAME = $(TC_DIST).$(TC_EXT)
TC_DIST_SITE = https://sourceforge.net/projects/dsgpl/files/Tool%20Chain/DSM%205.0%20Tool%20Chains/PowerPC%20853x%20Linux%202.6.32
TC_DIST_FILE = $(TC_ARCH)-$(TC_DIST).$(TC_EXT)

TC_BASE_DIR = powerpc-none-linux-gnuspe
TC_TARGET = powerpc-none-linux
TC_ADDITIONAL_CFLAGS = -mcpu=8548 -mhard-float -mfloat-gprs=double
TC_INCDIR = $(TC_BASE_DIR)/include
TC_LIBDIR = $(TC_BASE_DIR)/lib

include ../../mk/spksrc.tc.mk
