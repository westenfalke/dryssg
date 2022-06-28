ifndef __gmswe_project_included
include config.mk
__gmswe_project_included = $(true)

GMSWE_DEBUG  ?= $(true)
GMSWE_TRACE  ?= $(true)
GMSWE_DOC    ?= $(true)
GMSWE_REPORT ?= $(true)
GMSWE_LOG    ?= $(true)
GMSWE_TEST   ?= $(true)

#INSTALLDIR := .# default @see ./core/base.mk

SITEMAP_BASEURL_PORT ?= :8042
BASEURL      ?= http://localhost$(PORT)
#SITEMAP_WILDCARD ?= $(DOCUMENTROOT)/Gallery*.jpg *.html# extend sitmap to .jpg inside the Gallery folder

endif #__gmswe_project_included
