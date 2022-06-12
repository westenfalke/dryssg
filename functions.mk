ifndef __gmswe_functions_included
include config.mk
__gmswe_functions_included = $(true)

# ----------------------------------------------------------------------------
# Function:  echo_argument
# Arguments: 1: A string
# Returns:   The string;
#            just to establisch a test case for trace and assert
#            and a function with just one argument
# ----------------------------------------------------------------------------
echo_argunent = $(__gmswe_tr1)$(if $1,$1,$$1 missing)

# ----------------------------------------------------------------------------
# Function:  exec_cli01
# Arguments: 1: A namen of a function
#            2: A parameter to apply the function
# Returns:   Nothing?
# Does:      Applies the non empty function to the parameter
# ----------------------------------------------------------------------------
exec_cli01 = $(__gmswe_tr2)$(if $($1),$(shell $(call $1,$(value $2))))

# ----------------------------------------------------------------------------
# Function:  fetch_comment4pattern
# Arguments: 1: A Pattern
#            2: A filename
# Returns:   A command to filter for a block comment
#            in the file filename that contains the pattern
#            and nothing on empty or missing parameter
# ----------------------------------------------------------------------------
fetch_comment4pattern = $(__gmswe_tr2)$(if $1,$(if $2,grep -B 10 -A 10 -E '^\#\s*.*$1.*' $2 | grep ^\#))

# ----------------------------------------------------------------------------
# Function:  foo
# Arguments: None
# Returns:   Nothing;
#            just to establisch a test case for trace and assert
#            and a function with just no argument
# ----------------------------------------------------------------------------
foo :=

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

# ----------------------------------------------------------------------------
# Function:  recursively_remove_folder
# Arguments: 1: A folder
# Returns:   A CLI CMD for $(SHELL)
# Does:      Removes the folder and its content
#            Fails silently if folder does not exist
#            Skips any directory that is on a file system
#            different from that of the corresponding command line argument
# ----------------------------------------------------------------------------
recursively_remove_folder = $(__gmswe_tr1)$(if $1,rm --one-file-system --recursive --force $(__gmswe_log_p_delete) $1)

endif # __gmswe_functions_included
