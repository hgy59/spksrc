PKG_NAME = filebrowser
PKG_VERS = 2.32.0
PKG_EXT = tar.gz
PKG_DIST_NAME = v$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = https://github.com/filebrowser/filebrowser/archive
PKG_DIST_FILE = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

BUILD_DEPENDS = native/go native/nodejs native/pnpm

HOMEPAGE = https://github.com/filebrowser/filebrowser
COMMENT  = Web File Browser.
LICENSE  = Apache 2.0

GO_SRC_DIR = $(WORK_DIR)/$(PKG_NAME)-$(PKG_VERS)
GO_BIN_DIR = $(GO_SRC_DIR)/$(PKG_NAME)
GO_LDFLAGS = -s -w

PRE_COMPILE_TARGET = filebrowser_pre_compile

include ../../mk/spksrc.cross-go.mk

ENV += PATH=$(realpath $(WORK_DIR)/../../../native/nodejs/work-native/node/bin):$(realpath $(WORK_DIR)/../../../native/pnpm/work-native/bin):$(realpath $(WORK_DIR)/../../../native/go/work-native/go/bin):$(PATH)

# avoid webpack error ERR_OSSL_EVP_UNSUPPORTED with nodejs 18
ENV += NODE_OPTIONS=--openssl-legacy-provider

.PHONY: filebrowser_pre_compile
filebrowser_pre_compile:
	@sed -i 's/Version = "(untracked)"/Version = "$(PKG_VERS)"/g' -i $(WORK_DIR)/$(PKG_DIR)/version/version.go
	@$(RUN) $(MAKE) build-frontend
