ifndef __module_trace_included
__module_trace_included := $(true)

ifdef GMSWE_TRACE
module_trace.tr0 = $(warning $0())
module_trace.tr1 = $(warning $0('$1'))
module_trace.tr2 = $(warning $0('$1','$2'))
module_trace.tr3 = $(warning $0('$1','$2','$3'))
module_trace.tr4 = $(warning $0('$1','$2','$3','$4'))
else
module_trace.tr0 :=
module_trace.tr1 :=
module_trace.tr2 :=
module_trace.tr3 :=
module_trace.tr4 :=
endif

endif #__module_trace_included
