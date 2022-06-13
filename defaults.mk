ifndef __gmswe_defaults_included
include config.mk
__gmswe_defaults_included := $(true)

# set to $(true) to exclude project.mk
__gmswe_project_included := $(false)

GMSWE_DEBUG  ?= $(false)
GMSWE_DOC    ?= $(false)
GMSWE_LOG    ?= $(false)
GMSWE_REPORT ?= $(false)

WEBSITE      ?= website
CLEAN        ?= clean
DOCUMENTS    ?= documents
DOCUMENTROOT ?= public_html
$(eval CLEAN_DOCUMENTROOT = $(CLEAN)_$(DOCUMENTROOT))
INDEX.HTML   ?= index.html
$(eval DOCUMENTS_INDEX.HTML = $(DOCUMENTS)/$(INDEX.HTML))
INDEX.MD     ?= index.md
$(eval DOCUMENTROOT_INDEX.MD = $(DOCUMENTROOT)/$(INDEX.MD))
ROBOTS.TXT   ?= robots.txt
$(eval DOCUMENTROOT_ROBOTS.TXT = $(DOCUMENTROOT)/$(ROBOTS.TXT))
SITEMAP.XML  ?= sitmap.xml
$(eval DOCUMENTROOT_SITEMAP.XML = $(DOCUMENTROOT)/$(SITEMAP.XML))


endif #__gmswe_defaults_included
