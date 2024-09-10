################################################################################
#
# libcgif
#
################################################################################

LIBCGIF_VERSION = v0.4.1
LIBCGIF_SITE = $(call github,dloebl,cgif,$(LIBCGIF_VERSION))
LIBCGIF_LICENSE = MIT
LIBCGIF_LICENSE_FILES = LICENSE
LIBCGIF_DEPENDENCIES =

$(eval $(meson-package))
