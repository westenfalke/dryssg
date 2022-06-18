ifndef __gmswe_functions_included
include config.mk
__gmswe_functions_included = $(true)
__gmswe_comma := ,
__gmswe_nullstring :=

# ----------------------------------------------------------------------------
# Function:  func_echo_argument
# Arguments: 1: A string
# Returns:   The string;
#            just to establisch a test case for trace and assert
#            and a function with just one argument
# ----------------------------------------------------------------------------
func_echo_argument = $(__gmswe_tr1)$(if $1,$1)

# ----------------------------------------------------------------------------
# Function:  func_foo
# Arguments: None
# Returns:   Nothing;
#            just to establisch a test case for trace and assert
#            and a function with just no argument
# ----------------------------------------------------------------------------
func_foo :=

# ----------------------------------------------------------------------------
# Function:  func_rwildcard
# Arguments: 1: A folder name
#            2: A list off pattern
# Returns:   A list of files/folder matching the list of pattern 2
#            within folder 1
# Does:      ?
# ----------------------------------------------------------------------------
func_rwildcard = $(__gmswe_tr2)$(if $1$2,$(foreach d,$(wildcard $1*),$(call func_rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d)))

endif # __gmswe_functions_included
