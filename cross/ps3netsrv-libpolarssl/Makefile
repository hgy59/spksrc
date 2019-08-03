PKG_NAME = polarssl
PKG_VERS = 1.3.2
PKG_EXT = tgz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS)-gpl.$(PKG_EXT)
PKG_DIST_SITE = https://tls.mbed.org/download
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS =

HOMEPAGE = https://tls.mbed.org
COMMENT  = mbed TLS (formerly known as PolarSSL) makes it trivially easy for developers to include cryptographic and SSL/TLS capabilities in their (embedded) products, facilitating this functionality with a minimal coding footprint. This is the former polarssl library version that is required for ps3netsrv (static library only).
LICENSE = GPL

CONFIGURE_ARGS =
# build static library only
COMPILE_MAKE_OPTIONS = lib

GNU_CONFIGURE = 1
CONFIGURE_TARGET = nop

include ../../mk/spksrc.cross-cc.mk
