ifndef __gmswe_defaults_included
__gmswe_defaults_included := $(true)

# set to $(true) to exclude project.mk
#__gmswe_project_included := $(false)

#GMSWE_DEBUG  ?= $(true)
#GMSWE_DOC    ?= $(true)
#GMSWE_LOG    ?= $(true)
#GMSWE_REPORT ?= $(true)
#GMSWE_TEST   ?= $(true)

SITEMAP.XML  ?= sitemap.xml
DOCUMENTROOT_SITEMAP.XML ?= $(DOCUMENTROOT)/$(SITEMAP.XML)
SITEMAP_WILDCARD ?= *.html
SITEMAP_BASEURL_PORT ?= :8842
BASEURL ?= http://localhost$(SITEMAP_BASEURL_PORT)

METADATA.YAML ?= metadata.yaml
AFTER_BODY.HTML ?= after-body.html
USAGE        ?= usage
WEBSITE      ?= website_build
DEPLOY       ?= website_build_and_deployed
SWEEP        ?= sweeped
#BASEURL @see ./modules/sitemap_xml
DOCUMENTROOT_NAME ?= public_html
DOCUMENTROOT ?= $(INSTALLDIR)/$(DOCUMENTROOT_NAME)
SWEEP_DOCUMENTROOT ?= $(SWEEP)_$(DOCUMENTROOT_NAME)

endif #__gmswe_defaults_included
