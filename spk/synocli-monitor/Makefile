SPK_NAME = synocli-monitor
SPK_VERS = 1.7
SPK_REV = 10
SPK_ICON = src/synocli-monitor.png

DEPENDS  = cross/nmon cross/njmon
DEPENDS += cross/iperf2 cross/iperf3
DEPENDS += cross/busybox
DEPENDS += cross/ionice
DEPENDS += cross/lsof
DEPENDS += cross/htop
DEPENDS += cross/cpulimit
DEPENDS += cross/net-snmp
DEPENDS += cross/lm-sensors

OPTIONAL_DEPENDS = cross/bandwhich cross/bottom cross/procs

include ../../mk/spksrc.common.mk
ifeq ($(call version_lt,${TCVERSION},6.0)$(call version_gt,${TCVERSION},2.0),11)
# include process utilities including pstree for DSM<6 and DSM>2
BUSYBOX_CONFIG = procutils.dsm5
OPTIONAL_DESC = ", and process utilities \(lsof, iostat, pgrep, pmap, pstree, watch\)"
else
BUSYBOX_CONFIG = procutils
OPTIONAL_DESC = ", and process utilities \(lsof, iostat, pgrep, pmap, watch\)"
endif

ifneq ($(findstring $(ARCH),$(OLD_PPC_ARCHS)),$(ARCH))
DEPENDS += cross/bandwhich cross/bottom cross/procs
OPTIONAL_DESC := $(OPTIONAL_DESC)", bandwhich, bottom, procs"
endif

MAINTAINER = hgy59
DESCRIPTION = SynoCli Monitor Tools provides a set of command-line utilities for system monitoring: nmon, njmon, iperf2, iperf3, htop, ionice, cpulimit, net-snmp tools$(OPTIONAL_DESC).
DISPLAY_NAME = SynoCli Monitor Tools
STARTABLE = no
CHANGELOG  = "1. Update bandwhich from v0.22.2 to v0.23.1 <br/>"
CHANGELOG += "2. Update bottom from v0.9.6 to v0.10.2 <br/>"
CHANGELOG += "3. Update htop from v3.3.0 to v3.4.1 <br/>"
CHANGELOG += "4. Update ionice from v2.40.1 to v2.41.1 <br/>"
CHANGELOG += "5. Update iperf2 from v2.2.0 to v2.2.1 <br/>"
CHANGELOG += "6. Update iperf3 from v3.17.1 to v3.19.1 (some archs support v3.15 only) <br/>"
CHANGELOG += "7. Update lsof from v4.99.3 to v4.99.5 <br/>"
CHANGELOG += "8. Update njmon from v81 to v84 <br/>"
CHANGELOG += "9. Update procs from v0.14.5 to v0.14.10"

HOMEPAGE = https://github.com/SynoCommunity/spksrc/wiki/FAQ-SynoCliMonitor
LICENSE  = Each tool is licensed under it\'s respective license.

SERVICE_SETUP = src/service-setup.sh

ENV += BUSYBOX_CONFIG="$(BUSYBOX_CONFIG)"

SPK_COMMANDS  = bin/htop
SPK_COMMANDS += bin/nmon bin/njmon
SPK_COMMANDS += bin/iperf2 bin/iperf3
SPK_COMMANDS += bin/ionice
SPK_COMMANDS += bin/iostat bin/pgrep bin/pmap bin/watch bin/pstree
SPK_COMMANDS += bin/lsof
SPK_COMMANDS += bin/cpulimit
SPK_COMMANDS += bin/bandwhich
SPK_COMMANDS += bin/btm
SPK_COMMANDS += bin/procs
SPK_COMMANDS += bin/snmpget bin/snmpgetnext bin/snmpbulkget bin/snmpwalk bin/snmpbulkwalk bin/snmpdelta bin/snmpdf
SPK_COMMANDS += bin/snmpinform bin/snmpnetstat bin/snmpps bin/snmpstatus bin/snmptable bin/snmptest bin/snmptranslate
SPK_COMMANDS += bin/sensors bin/sensors-conf-convert sbin/fancontrol sbin/sensors-detect

include ../../mk/spksrc.spk.mk
