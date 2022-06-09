include gmsl
include trace.mk

ifndef __functions_included

# ----------------------------------------------------------------------------
# Function:  echo_argument
# Arguments: 1: A string
# Returns:   The string;
#            just to establisch a test case for trace and assert
#            and a function with just one argument
# ----------------------------------------------------------------------------
echo_argunent = $(__make_tr1)$1

# ----------------------------------------------------------------------------
# Function:  foo
# Arguments: None
# Returns:   Nothing;
#            just to establisch a test case for trace and assert
#            and a function with just no argument
# ----------------------------------------------------------------------------
foo :=

# ----------------------------------------------------------------------------
# Function:  prepgrep4help
# Arguments: 1: A Pattern
#            2: A filename
# Returns:   A shell command to grep for pattern in filename
# ----------------------------------------------------------------------------
prepgrep4help = $(__make_tr2)grep -B 1 -A 6 -E '^\# Target:.*$1$$|^\# Function:.*$1$$' $2|grep ^\#

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
