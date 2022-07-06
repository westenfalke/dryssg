ifndef __config_included
__config_included := T
#GMSL_TRACE := T
include gmsl
include project.mk
include core/_core.mk
include modules/_modules.mk
include extensions/_extensions.mk
endif #__config_included
