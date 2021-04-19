################################################################################
#
# libimobiledevice
# https://github.com/libimobiledevice/libimobiledevice/releases/download/1.3.0/libimobiledevice-1.3.0.tar.bz2
#
################################################################################

LIBIMOBILEDEVICE_VERSION = 1.3.0
LIBIMOBILEDEVICE_SOURCE = libimobiledevice-$(LIBIMOBILEDEVICE_VERSION).tar.bz2
LIBIMOBILEDEVICE_SITE = https://github.com/libimobiledevice/libimobiledevice/releases/download/$(LIBIMOBILEDEVICE_VERSION)

# For the target variant, we only want to build/install libltdl
#LIBIMOBILEDEVICE_SUBDIR = libltdl
HOST_LIBIMOBILEDEVICE_SUBDIR = .

LIBIMOBILEDEVICE_INSTALL_STAGING = YES

LIBIMOBILEDEVICE_CONF_OPTS = 

LIBIMOBILEDEVICE_DEPENDENCIES = libplist libusbmuxd libopenssl
HOST_LIBIMOBILEDEVICE_DEPENDENCIES =

LIBIMOBILEDEVICE_LICENSE = LGPL-2.1+
LIBIMOBILEDEVICE_LICENSE_FILES = $(LIBIMOBILEDEVICE_SUBDIR)/COPYING.LIB
HOST_LIBIMOBILEDEVICE_LICENSE = GPL-2.0+ (libimobiledevice)
HOST_LIBIMOBILEDEVICE_LICENSE_FILES = COPYING $(LIBIMOBILEDEVICE_SUBDIR)/COPYING.LIB

HOST_LIBIMOBILEDEVICE_CONF_ENV = MAKEINFO=true
HOST_LIBIMOBILEDEVICE_LIBIMOBILEDEVICE_PATCH = NO

define LIBIMOBILEDEVICE_AVOID_AUTORECONF_HOOK
	find $(@D) -name aclocal.m4 -exec touch '{}' \;
	find $(@D) -name config-h.in -exec touch '{}' \;
	find $(@D) -name configure -exec touch '{}' \;
	find $(@D) -name Makefile.in -exec touch '{}' \;
endef
LIBIMOBILEDEVICE_PRE_CONFIGURE_HOOKS += LIBIMOBILEDEVICE_AVOID_AUTORECONF_HOOK
HOST_LIBIMOBILEDEVICE_PRE_CONFIGURE_HOOKS += LIBIMOBILEDEVICE_AVOID_AUTORECONF_HOOK

$(eval $(autotools-package))
$(eval $(host-autotools-package))

# variables used by other packages
LIBIMOBILEDEVICE = $(HOST_DIR)/bin/libimobiledevice