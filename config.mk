ifndef __config_included
include gmsl
__config_included := $(true)
include trace.mk
include debug.mk
include functions.mk

#GMSL_TRACE  := $(true)
MAKE_DEBUG  := $(true)
MAKE_TRACE  := $(true)
MAKE_DOC    := $(true)
MAKE_REPORT := $(true)
MAKE_LOG    := $(true)

endif #__config_included
