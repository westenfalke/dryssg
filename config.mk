ifndef __gmswe_config_included
__gmswe_config_included := T
GMSL_TRACE   := T
include gmsl
GMSWE_DEBUG  := $(true)
GMSWE_TRACE  := $(true)
GMSWE_DOC    := $(true)
GMSWE_REPORT := $(true)
GMSWE_LOG    := $(true)
include trace.mk
include debug.mk
include functions.mk
include logging.mk

endif #__gmswe_config_included
