ifndef __module_log.included
__module_log.included := $(true)

ifdef GMSWE_LOG
__module_log.log0 = $(info $1())
__module_log.log1 = $(info $0('$1'))
__module_log.log2 = $(info $0('$1','$2'))
__module_log.log3 = $(info $0('$1','$2','$3'))
__module_log.log_fp1 = $(info $1('$2'))
__module_log.log_fp2 = $(info $1('$2','$3'))
__module_log.log_p_copy = --verbose
__module_log.log_p_delete = --verbose
__module_log.log_p_create = --verbose
else
__module_log.log0 :=
__module_log.log1 :=
__module_log.log_fg1 :=
__module_log.log2 :=
__module_log.log3 :=
__module_log.log_p_copy :=
__module_log.log_p_delete :=
__module_log.log_p_create :=
endif

endif #__module_log.included
