ifndef __gmswe_defaults_included
include config.mk
__gmswe_defaults_included = $(true)

GMSWE_DEBUG  ?= $(false)
GMSWE_TRACE  ?= $(false)
GMSWE_DOC    ?= $(false)
GMSWE_REPORT ?= $(false)
GMSWE_LOG    ?= $(false)

DOCUMENTROOT ?= public_html


endif #__gmswe_defaults_included
