SPK_NAME = rustfs
SPK_VERS = 1.0.1
SPK_REV = 1
SPK_ICON = src/rustfs.png

DEPENDS = cross/rustfs

REQUIRE_64BIT = 1
MIN_RUSTC_VERSION = 1.98.1

# This is a huge package and due to limitted resources on older systems, 
# we don't support DSM 6.
REQUIRED_MIN_DSM = 7.1

MAINTAINER = hgy59
DISPLAY_NAME = RustFS
DESCRIPTION = RustFS is an open-source, S3-compatible high-performance object storage system supporting migration and coexistence with other S3-compatible platforms such as MinIO and Ceph.
HOMEPAGE = https://rustfs.com/
LICENSE = Apache 2.0
CHANGELOG = "Initial package release."

WIZARDS_DIR = src/wizard/

STARTABLE = yes
SERVICE_USER = auto
SERVICE_SETUP = src/service-setup.sh
SERVICE_WIZARD_SHARENAME = wizard_data_directory
FWPORTS = src/rustfs.sc
# Console Port (API Port is 9004)
SERVICE_PORT = 9005
ADMIN_PORT = 9005

POST_STRIP_TARGET = rustfs_extra_install

SPK_COMMANDS = bin/rustfs

include ../../mk/spksrc.spk.mk

.PHONY: rustfs_extra_install
rustfs_extra_install:
	@install -d -m 755 $(STAGING_DIR)/var
	@install -m 644 src/environment-variables $(STAGING_DIR)/var/
