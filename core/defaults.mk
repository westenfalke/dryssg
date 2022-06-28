ifndef __gmswe_defaults_included
__gmswe_defaults_included := $(true)

# set to $(true) to exclude project.mk
#__gmswe_project_included := $(false)

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
DOCUMENTROOT := $(INSTALLDIR)/public_html
$(eval CLEAN_DOCUMENTROOT = $(CLEAN)_$(DOCUMENTROOT))

endif #__gmswe_defaults_included
