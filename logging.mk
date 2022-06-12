ifndef __logging_included
include gmsl

__logging_included := $(true)

ifdef MAKE_LOG
__make_log0 = $(info $1())
__make_log1 = $(info $0('$1'))
__make_log2 = $(info $0('$1','$2'))
__make_log3 = $(info $0('$1','$2','$3'))
__make_log_fp1 = $(info $1('$2'))
__make_log_fp2 = $(info $1('$2','$3'))
__make_log_p_delete = --verbose
else
__make_log0 :=
__make_log1 :=
__make_log_fg1 :=
__make_log2 :=
__make_log3 :=
__make_log_delete :=
endif


endif #__logging_included
