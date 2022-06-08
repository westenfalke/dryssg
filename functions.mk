include gmsl
include trace.mk

ifndef __functions_included

# ----------------------------------------------------------------------------
# Function:  echo
# Arguments: 1: An argument
# Returns:   The argument
# ----------------------------------------------------------------------------
echo = $(__make_tr1)$1

# ----------------------------------------------------------------------------
# Function:  foo
# Arguments: None
# Returns:   Nothing
# ----------------------------------------------------------------------------
foo = $(shell echo "foo")

# ----------------------------------------------------------------------------
# Function:  printallvars
# Arguments: None
# Returns:   A list of the name, value and (expanded value) of all variables
#            in $(.VARIABLES)
#            except if they start with '__' hence this are likely to be gmsl
#            or if their origin is in (environment% default automatic)
# ----------------------------------------------------------------------------
printallvars = $(call printvars,$(filter-out printvars ,$(.VARIABLES)))

# ----------------------------------------------------------------------------
# Function:  printvars
# Arguments: 1: A list
# Returns:   A list of the name, value and (expanded value)
#            of all variables in the list
#            except if they start with '__' hence this are likely to be gmsl
#            or if their origin is in (environment% default automatic)
# ----------------------------------------------------------------------------
printvars = $(foreach V,                                    \
              $(filter-out __%,$(sort $1)),                  \
              $(if                                            \
                $(filter-out  environment% default automatic,  \
                  $(origin $V)),                                \
                $(warning $V=$($V) ($(value $V)))                \
              )                                                   \
            )

endif # __functions_included
