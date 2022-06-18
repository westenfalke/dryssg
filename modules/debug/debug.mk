ifndef __gmswe_debug_included
include config.mk
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

# ----------------------------------------------------------------------------
# Function:  func_printallvars
# Arguments: None
# Returns:   A list of the name, value and (expanded value) of all variables
#            in $(.VARIABLES)
#            except if they start with '__' hence this are likely to be gmsl
#            or if their origin is in (environment% default automatic)
# ----------------------------------------------------------------------------
func_printallvars = $(call func_printvars,.VARIABLES)

# ----------------------------------------------------------------------------
# Function:  func_printvars
# Arguments: 1: A list
# Returns:   A list of the name, value and (expanded value)
#            of all variables in the list
#            except if they start with '__' hence this are likely to be gmsl
#            or if their origin is in (environment% default automatic)
# ----------------------------------------------------------------------------
func_printvars = $(foreach V,                              \
              $(filter-out __% and assert%,                 \
                $(sort $(value $1))),                        \
                $(if                                          \
                  $(filter-out environment% default automatic, \
                    $(origin $V)),                              \
                      $(info $V=$($V) ($(value $V)))             \
                )                                                 \
            )


endif #__gmswe_debug_included
