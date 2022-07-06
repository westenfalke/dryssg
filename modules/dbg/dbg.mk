ifndef __module_dbg.included
__module_dbg.included := $(true)

ifdef GMSWE_DEBUG
__module_dbg.trg  = $(warning $$@ $@)
__module_dbg.pre  = $(warning $$< $<)
__module_dbg.tnp  = $(warning $$@ $@ $$< $<)
__module_dbg.tnap = $(warning $$@ $@ $$^ $^)
else
__module_dbg.trg  :=
__module_dbg.pre  :=
__module_dbg.tnp  :=
__module_dbg.tnap :=
endif

# ----------------------------------------------------------------------------
# Function:  modules_dbg.func_printallvars
# Arguments: None
# Returns:   A list of the name, value and (expanded value) of all variables
#            in $(.VARIABLES)
#            except if they start with '__' hence this are likely to be gmsl
#            or if their origin is in (environment% default automatic)
# ----------------------------------------------------------------------------
modules_dbg.func_printallvars = $(call __module_dbg.func_printvars,.VARIABLES)

# ----------------------------------------------------------------------------
# Function:  __module_dbg.func_printvars
# Arguments: 1: A list
# Returns:   A list of the name, value and (expanded value)
#            of all variables in the list
#            except if they start with '__' hence this are likely to be gmsl
#            or if their origin is in (environment% default automatic)
# ----------------------------------------------------------------------------
__module_dbg.func_printvars = $(foreach V,                              \
              $(filter-out __% and assert%,                 \
                $(sort $(value $1))),                        \
                $(if                                          \
                  $(filter-out environment% default automatic, \
                    $(origin $V)),                              \
                      $(info $V=$($V) ($(value $V)))             \
                )                                                 \
            )


endif #__module_dbg.included
