ifndef __functions_included
include gmsl
include trace.mk

# ----------------------------------------------------------------------------
# Function:  echo_argument
# Arguments: 1: A string
# Returns:   The string;
#            just to establisch a test case for trace and assert
#            and a function with just one argument
# ----------------------------------------------------------------------------
echo_argunent = $(__make_tr1)$(if $1,$1,$$1 missing)

# ----------------------------------------------------------------------------
# Function:  foo
# Arguments: None
# Returns:   Nothing;
#            just to establisch a test case for trace and assert
#            and a function with just no argument
# ----------------------------------------------------------------------------
foo :=

# ----------------------------------------------------------------------------
# Function:  fetch_comment4pattern
# Arguments: 1: A Pattern
#            2: A filename
# Returns:   A command to filter for a block comment
#            in the file filename that contains the pattern
#            and nothing on empty or missing parameter
# ----------------------------------------------------------------------------
#comma := ,
fetch_comment4pattern = $(__make_tr2)$(if $1,$(if $2,grep -B 1 -A 10 -E '^\#\s*Target\s*:.*$1.*|^\#\s*Function\s*:\s*.*$1' $2|grep ^\#))

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
