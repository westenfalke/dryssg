ifndef __gmswe_logging_included
include config.mk
__gmswe_logging_included := $(true)

ifdef GMSWE_LOG
__gmswe_log0 = $(info $1())
__gmswe_log1 = $(info $0('$1'))
__gmswe_log2 = $(info $0('$1','$2'))
__gmswe_log3 = $(info $0('$1','$2','$3'))
__gmswe_log_fp1 = $(info $1('$2'))
__gmswe_log_fp2 = $(info $1('$2','$3'))
__gmswe_log_p_delete = --verbose
__gmswe_log_p_create = --verbose
else
__gmswe_log0 :=
__gmswe_log1 :=
__gmswe_log_fg1 :=
__gmswe_log2 :=
__gmswe_log3 :=
__gmswe_log_p_delete :=
__gmswe_log_p_create :=
endif

endif #__gmswe_logging_included
