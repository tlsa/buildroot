################################################################################
#
# libcyaml
#
################################################################################

LIBCYAML_VERSION = v1.4.2
LIBCYAML_SITE = $(call github,tlsa,libcyaml,$(LIBCYAML_VERSION))
LIBCYAML_LICENSE = ISC
LIBCYAML_LICENSE_FILES = LICENSE
LIBCYAML_INSTALL_STAGING = YES
LIBCYAML_DEPENDENCIES = libyaml

LIBCYAML_MAKE_OPTS = \
	CC="$(TARGET_CC)" \
	AR="$(TARGET_AR)" \
	PREFIX=/usr

LIBCYAML_INSTALL_TARGETS =

ifeq ($(BR2_STATIC_LIBS),y)
LIBCYAML_INSTALL_TARGETS += install-static
endif

ifeq ($(BR2_SHARED_LIBS),y)
LIBCYAML_INSTALL_TARGETS += install-shared
endif

define LIBCYAML_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBCYAML_MAKE_OPTS)
endef

define LIBCYAML_INSTALL_STAGING_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBCYAML_MAKE_OPTS) \
		DESTDIR=$(STAGING_DIR) $(LIBCYAML_INSTALL_TARGETS)
endef

define LIBCYAML_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(LIBCYAML_MAKE_OPTS) \
		DESTDIR=$(TARGET_DIR) $(LIBCYAML_INSTALL_TARGETS)
endef

$(eval $(generic-package))
