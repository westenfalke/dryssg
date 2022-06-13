ifndef __gmswe_project_included
include config.mk
__gmswe_project_included = $(true)

GMSWE_DEBUG  ?= $(true)
GMSWE_TRACE  ?= $(true)
GMSWE_DOC    ?= $(true)
GMSWE_REPORT ?= $(true)
GMSWE_LOG    ?= $(true)

DOCUMETROOT := public_html


endif #__gmswe_project_included
