ifndef __gmswe_project_included
include config.mk
__gmswe_project_included = $(true)

# Disable *.mk files core / modules / extesnions 
# Hence all *.mk files are incude only once,
# declaring them already inluded, will prevent
# them from beeing loaded in the first place.
#__module_gallery.included = $(true)
#__gmswe_default_extension_included = $(true)
#__gmswe_getting_started_included = $(true)
#__gmswe_westenfalke_included = $(true)

GMSWE_DEBUG  ?= $(true)
GMSWE_TRACE  ?= $(true)
GMSWE_DOC    ?= $(true)
GMSWE_REPORT ?= $(true)
GMSWE_LOG    ?= $(true)
GMSWE_TEST   ?= $(true)

#CORE_BASE_INSTALL_DIR := .# default @see ./core/base.mk

CORE_DEF_BASEURL_PORT ?= :8823
CORE_DEF_BASEURL      ?= http://127.0.0.1$(CORE_DEF_BASEURL_PORT)
#CORE_DEF_SITEMAP_WILDCARD ?= $(CORE_DEF_DOCUMENTROOT)/Gallery*.jpg *.html# extend sitmap to .jpg inside the Gallery folder
MOUDULE_MD2HTML.TEMPLATE_HTML_NAME ?= westenfalke.html
endif #__gmswe_project_included
