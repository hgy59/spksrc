### Toolchain rules
# Variables:
#  TC_ARCH          cpu architecture (use archs defined in spksrc.common.mk, use multiple for generic archs)
#  TC_NAME          use syno-$(TC_ARCH) (for generic archs use: syno-x64, syno-aarch64, syno-armv7)
#  TC_VERS          use respective DSM version
#  TC_OS_MIN_VER    use major.minor of DSM version and branch version (like 6.2-25023)
#  TC_FIRMWARE      oboslete, please use TC_OS_MIN_VER
#  TC_DIST_NAME     toolchain file to download
#  TC_DIST_SITE     url to download $(TC_DIST_NAME) from
#  TC_DIST_FILE     define to rename downloaded toolchain file to avoid naming conflicts, default: $(TC_DIST_NAME)
#  TC_BASE_DIR      toolchain folder inside the downloaded archive
#  TC_PREFIX        toolchain prefix, default: $(TC_BASE_DIR)
#  TC_TARGET        toolchain prefix, default: $(TC_BASE_DIR)
#  
#  TC_INCDIR        Include folder of header files (for c/c++ compiler), default: $(TC_BASE_DIR)/sys-root/usr/include
#  TC_LIBDIR        Library folder relativ to $(WORK_DIR)/$(TC_BASE_DIR)/, default: (TC_BASE_DIR)/sys-root/lib
#  TC_ADDITIONAL_CFLAGS     Additional CFLAGS
#  TC_ADDITIONAL_CPPFLAGS   Additional CPPFLAGS, default: $(TC_ADDITIONAL_CFLAGS)
#  TC_ADDITIONAL_CXXFLAGS   Additional CXXFLAGS, default: $(TC_ADDITIONAL_CPPFLAGS)

# Validate variables and set default values
ifeq ($(strip $(TC_BASE_DIR)),)
$(error TC_BASE_DIR must be defined)
endif

ifeq ($(strip $(TC_PREFIX)),)
TC_PREFIX = $(TC_BASE_DIR)
endif

ifeq ($(strip $(TC_TARGET)),)
TC_TARGET = $(TC_BASE_DIR)
endif

ifeq ($(strip $(TC_INCDIR)),)
TC_INCDIR = $(TC_BASE_DIR)/sys-root/usr/include
endif

ifeq ($(strip $(TC_ADDITIONAL_CPPFLAGS)),)
TC_ADDITIONAL_CPPFLAGS = $(TC_ADDITIONAL_CFLAGS)
endif

ifeq ($(strip $(TC_ADDITIONAL_CXXFLAGS)),)
TC_ADDITIONAL_CXXFLAGS = $(TC_ADDITIONAL_CPPFLAGS)
endif

ifeq ($(strip $(TC_LIBDIR)),)
TC_LIBDIR = $(TC_BASE_DIR)/sys-root/lib
endif

TC_CFLAGS = -I$(WORK_DIR)/$(TC_BASE_DIR)/$(TC_INCDIR) $(TC_ADDITIONAL_CFLAGS)
TC_CPPFLAGS = -I$(WORK_DIR)/$(TC_BASE_DIR)/$(TC_INCDIR) $(TC_ADDITIONAL_CPPFLAGS)
TC_CXXFLAGS = -I$(WORK_DIR)/$(TC_BASE_DIR)/$(TC_INCDIR) $(TC_ADDITIONAL_CXXFLAGS)
TC_LDFLAGS = -L$(WORK_DIR)/$(TC_BASE_DIR)/$(TC_LIBDIR)


# Constants
SHELL := $(SHELL) -e
default: all

WORK_DIR := $(shell pwd)/work
include ../../mk/spksrc.directories.mk


# Configure the included makefiles
URLS          = $(TC_DIST_SITE)/$(TC_DIST_NAME)
NAME          = $(TC_NAME)
COOKIE_PREFIX = $(TC_NAME)-
ifneq ($(TC_DIST_FILE),)
LOCAL_FILE    = $(TC_DIST_FILE)
# download.mk uses PKG_DIST_FILE
PKG_DIST_FILE = $(TC_DIST_FILE)
else
LOCAL_FILE    = $(TC_DIST_NAME)
endif
DISTRIB_DIR   = $(TOOLCHAINS_DIR)/$(TC_VERS)
DIST_FILE     = $(DISTRIB_DIR)/$(LOCAL_FILE)
DIST_EXT      = $(TC_EXT)

#####

RUN = cd $(WORK_DIR)/$(TC_BASE_DIR) && env $(ENV)
MSG = echo "===>   "

include ../../mk/spksrc.download.mk

checksum: download
include ../../mk/spksrc.checksum.mk

extract: checksum
include ../../mk/spksrc.extract.mk

patch: extract
include ../../mk/spksrc.patch.mk

fix: patch
include ../../mk/spksrc.tc-fix.mk


all: fix
	@if [ ! -d "$(WORK_DIR)/$(TC_BASE_DIR)/$(TC_INCDIR)" ]; then \
	  echo "include folder does not exist: $(WORK_DIR)/$(TC_BASE_DIR)/$(TC_INCDIR)" ; \
	  exit 1; \
	fi


TOOLS = ld ldshared:"gcc -shared" cpp nm cc:gcc as ranlib cxx:g++ ar strip objdump readelf

CFLAGS += $(TC_CFLAGS)
CFLAGS += -I$(INSTALL_DIR)/$(INSTALL_PREFIX)/include

CPPFLAGS += $(TC_CPPFLAGS)
CPPFLAGS += -I$(INSTALL_DIR)/$(INSTALL_PREFIX)/include

CXXFLAGS += $(TC_CXXFLAGS)
CXXFLAGS += -I$(INSTALL_DIR)/$(INSTALL_PREFIX)/include

LDFLAGS += $(TC_LDFLAGS)
LDFLAGS += -L$(INSTALL_DIR)/$(INSTALL_PREFIX)/lib
LDFLAGS += -Wl,--rpath-link,$(INSTALL_DIR)/$(INSTALL_PREFIX)/lib
LDFLAGS += -Wl,--rpath,$(INSTALL_PREFIX)/lib


.PHONY: tc_vars
tc_vars: patch
	@echo TC_ENV :=
	@for tool in $(TOOLS) ; \
	do \
	  target=`echo $${tool} | sed 's/\(.*\):\(.*\)/\1/'` ; \
	  source=`echo $${tool} | sed 's/\(.*\):\(.*\)/\2/'` ; \
	  echo TC_ENV += `echo $${target} | tr [:lower:] [:upper:] `=\"$(WORK_DIR)/$(TC_BASE_DIR)/bin/$(TC_PREFIX)-$${source}\" ; \
	done
	@echo TC_ENV += CFLAGS=\"$(CFLAGS) $$\(ADDITIONAL_CFLAGS\)\"
	@echo TC_ENV += CPPFLAGS=\"$(CPPFLAGS) $$\(ADDITIONAL_CPPFLAGS\)\"
	@echo TC_ENV += CXXFLAGS=\"$(CXXFLAGS) $$\(ADDITIONAL_CXXFLAGS\)\"
	@echo TC_ENV += LDFLAGS=\"$(LDFLAGS) $$\(ADDITIONAL_LDFLAGS\)\"
	@echo TC_CONFIGURE_ARGS := --host=$(TC_TARGET) --build=i686-pc-linux
	@echo TC_TARGET := $(TC_TARGET)
	@echo TC_PREFIX := $(TC_PREFIX)-
	@echo TC_PATH := $(WORK_DIR)/$(TC_BASE_DIR)/bin/
	@echo CFLAGS := $(CFLAGS) $$\(ADDITIONAL_CFLAGS\)
	@echo CPPFLAGS := $(CPPFLAGS) $$\(ADDITIONAL_CPPFLAGS\)
	@echo CXXFLAGS := $(CXXFLAGS) $$\(ADDITIONAL_CXXFLAGS\)
	@echo LDFLAGS := $(LDFLAGS) $$\(ADDITIONAL_LDFLAGS\)
	@echo TC_FIRMWARE := $(TC_FIRMWARE)
	@echo TC_OS_MIN_VER := $(TC_OS_MIN_VER)
	@echo TC_ARCH := $(TC_ARCH)
	ifeq ($(wildcard $(WORK_DIR)/$(TC_BASE_DIR)/$(TC_INCDIR)/.),)
	$(error missing folder $(WORK_DIR)/$(TC_BASE_DIR)/$(TC_INCDIR))
	endif

### Clean rules
clean:
	rm -fr $(WORK_DIR)

### For make digests
include ../../mk/spksrc.generate-digests.mk
