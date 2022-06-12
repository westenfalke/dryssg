ifndef __config_included
include gmsl
__config_included := $(true)

GMSL_TRACE  := $(true)
MAKE_DEBUG  := $(true)
MAKE_TRACE  := $(true)
MAKE_DOC    := $(true)
MAKE_REPORT := $(true)
MAKE_LOG    := $(true)

include trace.mk
include debug.mk
include functions.mk
include logging.mk

endif #__config_included
