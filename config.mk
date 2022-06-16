ifndef __gmswe_config_included
__gmswe_config_included := T
GMSL_TRACE := T
include gmsl
include project.mk
include defaults.mk
include functions.mk
include commands.mk
include modules.mk
endif #__gmswe_config_included
