ifndef __gmswe_config_included
__gmswe_config_included := T
#GMSL_TRACE := T
include gmsl
include project.mk
include core/_core.mk
include modules/_modules.mk
endif #__gmswe_config_included
