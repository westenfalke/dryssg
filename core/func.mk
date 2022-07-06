ifndef __core_func_included
__core_func_included = $(true)
__gmswe_comma := ,
__gmswe_nullstring :=

# ----------------------------------------------------------------------------
# Function:  core_func_echo_argument
# Arguments: 1: A string
# Returns:   The string;
#            just to establisch a test case for trace and assert
#            and a function with just one argument
# ----------------------------------------------------------------------------
core_func_echo_argument = $(module_trace.tr1)$(if $1,$1)

# ----------------------------------------------------------------------------
# Function:  core_func_foo
# Arguments: None
# Returns:   Nothing;
#            just to establisch a test case for trace and assert
#            and a function with just no argument
# ----------------------------------------------------------------------------
core_func_foo :=

# ----------------------------------------------------------------------------
# Function:  core_func_rwildcard
# Arguments: 1: A folder name
#            2: A list off pattern
# Returns:   A list of files/folder matching the list of pattern 2
#            within folder 1
# Does:      ?
# ----------------------------------------------------------------------------
core_func_rwildcard = $(module_trace.tr2)$(if $1$2,$(foreach d,$(wildcard $1*),$(call core_func_rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d)))

endif # __core_func_included
