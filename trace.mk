include gmsl
ifndef __trace_included

__trace_included := $(true)

ifdef MAKE_TRACE
__make_tr1 = $(warning $0('$1'))
__make_tr2 = $(warning $0('$1','$2'))
__make_tr3 = $(warning $0('$1','$2','$3'))
else
__make_tr1 :=
__make_tr2 :=
__make_tr3 :=
endif

endif #__trace_included
