ifndef __gmswe_trace_included
include gmsl

__gmswe_trace_included := $(true)

ifdef GMSWE_TRACE
__gmswe_tr0 = $(warning $0())
__gmswe_tr1 = $(warning $0('$1'))
__gmswe_tr2 = $(warning $0('$1','$2'))
__gmswe_tr3 = $(warning $0('$1','$2','$3'))
__gmswe_tr4 = $(warning $0('$1','$2','$3','$4'))
else
__gmswe_tr0 :=
__gmswe_tr1 :=
__gmswe_tr2 :=
__gmswe_tr3 :=
__gmswe_tr4 :=
endif

endif #__gmswe_trace_included
