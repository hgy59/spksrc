PKG_NAME = rustfs
# RUSTFS_VERS in cross/rustfs-console/Makefile must match PKG_VERS
PKG_VERS = 1.0.1
PKG_EXT = tar.gz
PKG_DIST_NAME = $(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/rustfs/rustfs/archive
PKG_DIST_FILE = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

BUILD_DEPENDS = cross/rustfs-console native/protoc 

REQUIRE_64BIT = 1
MIN_RUSTC_VERSION = 1.98.1
# required by some crates
MIN_GCC_VERSION = 7

HOMEPAGE = https://rustfs.com/
COMMENT = RustFS is an open-source, S3-compatible high-performance object storage system supporting migration and coexistence with other S3-compatible platforms such as MinIO and Ceph.
LICENSE = Apache 2.0

COMPILE_TARGET = rustfs_compile_target
INSTALL_TARGET = rustfs_install_target

# avoid version from git tag
ENV += RUSTFS_BUILD_VERSION="$(PKG_VERS)"

include ../../mk/spksrc.cross-rust.mk

# for pulsar-crate:
ENV += PROTOC=$(WORK_DIR)/../../../native/protoc/work-native/bin/protoc

.PHONY: rustfs_compile_target
rustfs_compile_target:
	@$(MSG) "- build with 'cargo build'"
	@$(RUN) cargo build --release --locked --package rustfs --bin rustfs

.PHONY: rustfs_install_target
rustfs_install_target:
	@$(MSG) "- install rustfs for rust target $(RUST_TARGET)"
	@install -d -m 755 $(STAGING_INSTALL_PREFIX)/bin
	@install -m 755 $(WORK_DIR)/$(PKG_DIR)/target/$(RUST_TARGET)/release/rustfs $(STAGING_INSTALL_PREFIX)/bin/
