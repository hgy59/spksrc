SPK_NAME = monit
SPK_VERS = 5.27.1
SPK_REV = 9
SPK_ICON = src/monit.png

DEPENDS =  cross/$(SPK_NAME)

DSM_UI_DIR = app
CHANGELOG = Update monit to 5.27.1
ADMIN_PORT = 2812
BETA = 1

MAINTAINER = SynoCommunity
DESCRIPTION = Monit is a small Open Source utility for managing and monitoring Unix systems. Monit conducts automatic maintenance and repair and can execute meaningful causal actions in error situations.
RELOAD_UI = yes
DISPLAY_NAME = Monit

HOMEPAGE = https://mmonit.com/monit
LICENSE  = AGPLv3

INSTALLER_SCRIPT = src/installer.sh
SSS_SCRIPT       = src/dsm-control.sh
FWPORTS          = src/${SPK_NAME}.sc

WIZARDS_DIR = src/wizard/

INSTALL_PREFIX = /usr/local/$(SPK_NAME)

POST_STRIP_TARGET = monit_extra_install

include ../../mk/spksrc.spk.mk

.PHONY: monit_extra_install
monit_extra_install:
	install -m 755 -d $(STAGING_DIR)/app
	install -m 644 src/app/config $(STAGING_DIR)/app/config
	install -m 755 -d $(STAGING_DIR)/var
	install -m 755 -d $(STAGING_DIR)/var/monit.d
	install -m 755 -d $(STAGING_DIR)/var/events
	install -m 700 src/monitrc $(STAGING_DIR)/var/monitrc
	install -m 700 src/monit.d/monit $(STAGING_DIR)/var/monit.d/monit
	install -m 755 -d $(STAGING_DIR)/share
	install -m 755 -d $(STAGING_DIR)/share/examples
	install -m 644 src/examples/* $(STAGING_DIR)/share/examples/
