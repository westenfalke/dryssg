ifndef __gmswe_project_included
include config.mk
__gmswe_project_included = $(true)

GMSWE_DEBUG  ?= $(true)
GMSWE_TRACE  ?= $(true)
GMSWE_DOC    ?= $(true)
GMSWE_REPORT ?= $(true)
GMSWE_LOG    ?= $(true)
GMSWE_TEST   ?= $(true)

#SITEMAP_BASEURL_PORT ?= :8080
#BASEURL      ?= http://localhost$(PORT)
#SITEMAP_WILDCARD ?= $(DOCUMENTROOT)/Gallery*.jpg *.html

endif #__gmswe_project_included
