TC_NAME = syno-$(TC_ARCH)

TC_ARCH = armada38x
TC_VERS = 6.0.2
TC_FIRMWARE = 6.0.2-8451

TC_DIST = armada38x-gcc493_glibc220_hard-GPL
TC_EXT = txz
TC_DIST_NAME = $(TC_DIST).$(TC_EXT)
TC_DIST_SITE = https://sourceforge.net/projects/dsgpl/files/Tool%20Chain/DSM%206.0.2%20Tool%20Chains/Marvell%20Armada%2038x%20Linux%203.10.77

TC_BASE_DIR = arm-unknown-linux-gnueabi
TC_INCDIR = $(TC_BASE_DIR)/sysroot/usr/include
TC_LIBDIR = $(TC_BASE_DIR)/sysroot/lib

include ../../mk/spksrc.tc.mk
	@find $(WORK_DIR)/$(TC_BASE_DIR) -type f -name '*.la' -exec sed -i -e "s|^libdir=.*$$|libdir='$(WORK_DIR)/$(TC_BASE_DIR)/$(TC_BASE_DIR)/sysroot/lib'|" {} \;
