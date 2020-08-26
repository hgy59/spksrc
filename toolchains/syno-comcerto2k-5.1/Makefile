TC_NAME = syno-$(TC_ARCH)

TC_ARCH = comcerto2k
TC_VERS = 5.1
TC_FIRMWARE = 5.0-4458

TC_DIST = gcc464_glibc217_neon_comcerto-GPL
TC_EXT = tgz
TC_DIST_NAME = $(TC_DIST).$(TC_EXT)
TC_DIST_SITE = https://sourceforge.net/projects/dsgpl/files/Tool%20Chain/DSM%205.1%20Tool%20Chains/Mindspeed%20Comcerto%202000%20Linux%203.2.40

TC_BASE_DIR = arm-cortexa9-linux-gnueabi
TC_ADDITIONAL_CFLAGS = -mcpu=cortex-a9 -march=armv7-a -mfpu=neon -mfloat-abi=hard -mthumb
TC_INCDIR = $(TC_BASE_DIR)/sysroot/usr/include
TC_LIBDIR = $(TC_BASE_DIR)/sysroot/lib

include ../../mk/spksrc.tc.mk
