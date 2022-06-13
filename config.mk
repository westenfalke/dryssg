ifndef __gmswe_config_included
__gmswe_config_included := T
GMSL_TRACE := T
include gmsl
include project.mk
include defaults.mk
include trace.mk
include debug.mk
include logging.mk
include functions.mk
include test.mk
endif #__gmswe_config_included
