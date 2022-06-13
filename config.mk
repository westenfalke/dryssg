ifndef __gmswe_config_included
__gmswe_config_included := T
include gmsl
GMSL_TRACE   := T
include project.mk
include defaults.mk
include trace.mk
include debug.mk
include functions.mk
include logging.mk
endif #__gmswe_config_included
