ifndef __core_def_included
__core_def_included := $(true)

# set to $(true) to exclude project.mk
#__gmswe_project_included := $(false)

#GMSWE_DEBUG  ?= $(true)
#GMSWE_DOC    ?= $(true)
#GMSWE_LOG    ?= $(true)
#GMSWE_REPORT ?= $(true)
#GMSWE_TEST   ?= $(true)


CORE_DEF_STATIC_FILES_DIR_NAME ?= static
CORE_DEF_STATICOUTDIR          ?= $(CORE_BASE_INSTALL_DIR)/$(CORE_DEF_STATIC_FILES_DIR_NAME)

CORE_DEF_DOCUMENTROOT_NAME ?= public_html
CORE_DEF_DOCUMENTROOT ?= $(CORE_BASE_INSTALL_DIR)/$(CORE_DEF_DOCUMENTROOT_NAME)
CORE_DEF_SWEEP_DOCUMENTROOT ?= $(CORE_DEF_SWEEP)_$(CORE_DEF_DOCUMENTROOT_NAME)

CORE_DEF_ROBOTS.TXT   ?= robots.txt
CORE_DEF_DOCUMENTROOT_ROBOTS.TXT ?= $(CORE_DEF_DOCUMENTROOT)/$(CORE_DEF_ROBOTS.TXT)

CORE_DEF_SITEMAP.XML  ?= sitemap.xml
CORE_DEF_DOCUMENTROOT_SITEMAP.XML ?= $(CORE_DEF_DOCUMENTROOT)/$(CORE_DEF_SITEMAP.XML)
CORE_DEF_SITEMAP_WILDCARD ?= *.html
CORE_DEF_BASEURL_PORT ?= :8842
CORE_DEF_BASEURL ?= http://localhost$(CORE_DEF_BASEURL_PORT)

CORE_DEF_INDEX.MD     ?= index.md

CORE_DEF_METADATA.YAML ?= metadata.yaml
CORE_DEF_AFTER_BODY.HTML ?= after-body.html


#MAIN TARGETS
CCORE_DEF_USAGE        ?= usage
CORE_DEF_WEBSITE      ?= website_build
CORE_DEF_DEPLOY       ?= website_build_and_deployed
CORE_DEF_SWEEP        ?= sweeped



endif #__core_def_included
