ifndef __gmswe_defaults_included
__gmswe_defaults_included := $(true)

# set to $(true) to exclude project.mk
__gmswe_project_included := $(false)

#GMSWE_DEBUG  ?= $(true)
#GMSWE_DOC    ?= $(true)
#GMSWE_LOG    ?= $(true)
#GMSWE_REPORT ?= $(true)
#GMSWE_TEST   ?= $(true)

FIND         ?= find
USAGE        ?= usage
WEBSITE      ?= website_build
DEPLOY      ?= $(WEBSITE)_and_deployed
CLEAN        ?= clean
#BASEURL      ?= http://localhost
DOCUMENTROOT := public_html
$(eval CLEAN_DOCUMENTROOT = $(CLEAN)_$(DOCUMENTROOT))
INDEX.HTML   ?= index.html
$(eval DOCUMENTROOT_INDEX.HTML = $(DOCUMENTROOT)/$(INDEX.HTML))
INDEX.MD     ?= index.md
$(eval DOCUMENTS_INDEX.MD ?= $(DOCUMENTS)/$(INDEX.MD))
SITEMAP.XML  ?= sitemap.xml
$(eval DOCUMENTROOT_SITEMAP.XML = $(DOCUMENTROOT)/$(SITEMAP.XML))

endif #__gmswe_defaults_included
