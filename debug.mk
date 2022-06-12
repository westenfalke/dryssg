ifndef __gmswe_debug_included
include gmsl

__gmswe_debug_included := $(true)

ifdef GMSWE_DEBUG
__gmswe_dbg_trg = $(warning $$@ $@)
__gmswe_dbg_pre = $(warning $$< $<)
__gmswe_dbg_tnp = $(warning $$@ $@ $$< $<)
else
__gmswe_dbg_trg :=
__gmswe_dbg_pre :=
__gmswe_dbg_tnp :=
endif

endif #__gmswe_debug_included
