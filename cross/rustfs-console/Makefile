PKG_NAME = rustfs-console
PKG_VERS = 0.1.34
# install rustfs-console into rustfs source tree
# RUSTFS_VERS must match PKG_VERS in cross/rustfs/Makefile
RUSTFS_VERS = 1.0.1
PKG_EXT = zip
PKG_DIST_NAME = $(PKG_NAME)-v$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/rustfs/console/releases/download/v$(PKG_VERS)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)
EXTRACT_PATH = $(WORK_DIR)/$(PKG_DIR)

DEPENDS =

HOMEPAGE = https://rustfs.com/
COMMENT = A modern, responsive web management console for RustFS distributed file system, built with Next.js 16 (App Router) + React 19 + TypeScript + Tailwind CSS v4 + shadcn/ui.
LICENSE = Apache 2.0

INSTALL_TARGET = rustfs-console_install_target

include ../../mk/spksrc.cross-install.mk

.PHONY: rustfs-console_install_target
rustfs-console_install_target:
	@$(MSG) "- install rustfs-console into rustfs-$(RUSTFS_VERS) source tree"
	@install -d -m 755 $(WORK_DIR)/rustfs-$(RUSTFS_VERS)/rustfs/static
	@cp -a $(WORK_DIR)/$(PKG_DIR)/* $(WORK_DIR)/rustfs-$(RUSTFS_VERS)/rustfs/static/
