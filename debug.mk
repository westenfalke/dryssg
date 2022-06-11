ifndef __debug_included
include gmsl

__debug_included := $(true)

ifdef MAKE_DEBUG
__debug_trg = $(warning $$@ $@)
__debug_pre = $(warning $$< $<)
__debug_tnp = $(warning $$@ $@ $$< $<)
else
__debug_trg :=
__debug_pre :=
__debug_tnp :=
endif

endif #__debug_included
