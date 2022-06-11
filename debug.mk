ifndef __debug_included
include gmsl

__debug_included := $(true)

ifdef MAKE_DEBUG
__debug_trg = $(warning $$@ $@)
__debug_pre = $(warning $$< $<)
__debug_t2p = $(warning $$@ $@ $$< $<)
else
__debug_trg :=
__debug_pre :=
__debug_t2p :=
endif

endif #__debug_included
