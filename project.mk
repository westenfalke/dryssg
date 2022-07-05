ifndef __gmswe_project_included
include config.mk
__gmswe_project_included = $(true)

# Disable *.mk files core / modules / extesnions 
# Hence all *.mk files are incude only once,
# declaring them already inluded, will prevent
# them from beeing loaded in the first place.
#__gmswe_gallery_included = $(true)
#__gmswe_default_extension_included = $(true)
#__gmswe_getting_started_included = $(true)
#__gmswe_westenfalke_included = $(true)

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
CONV_DEFAULT_TEMPLATE_HTML_NAME = candyscafe.html
endif #__gmswe_project_included
