ifndef __gmswe_command_included
include config.mk
__gmswe_command_included = $(true)
__gmswe_comma := ,
__gmswe_nullstring :=

# ----------------------------------------------------------------------------
# Function:  cmd_create_folder_w_parent
# Arguments: 1: A folder
# Returns:   A CLI CMD for $(SHELL)
# Does:      Create the folder(s), if they do not already exist
#            no error if existing, makes parent directories as needed
# ----------------------------------------------------------------------------
cmd_create_folder_w_parent = $(__gmswe_tr1)$(if $1,mkdir --parent $(__gmswe_log_p_create) $1)

# ----------------------------------------------------------------------------
# Function:  exec_cliPTR01
# Arguments: 1: Name of function to $(call) withe the argument in 2
#            2: Variable name to use when calling the function in 1
# Returns:   Nothing?
# Does:      Invoke $(call) the function with the parameter and execute
#            the result as CLI CMD in a $(shell)
# ----------------------------------------------------------------------------
exec_cliPTR01 = $(__gmswe_tr2)$(if $1,$(shell $(call $1,$(value $2))))

# ----------------------------------------------------------------------------
# Function:  exec_cliVAL01
# Arguments: 1: Name of the cmd_function to $(call) with the value in 2
#            2: Name of the value to use when calling the function in 1
# Returns:   Nothing?
# Does:      Invoke $(call) with function 1 with the value name 2 and execute
#            the result as CLI CMD in a $(shell)
# ----------------------------------------------------------------------------
exec_cliVAL01 = $(__gmswe_tr2)$(if $1,$(shell $(call $1,$2)))

# ----------------------------------------------------------------------------
# Function:  exec_cliVAL
# Arguments: 1: Name of function to $(call) withe the list of parameters 2
#            2: List of parameter to use when calling the function in 1
# Returns:   Nothing?
# Does:      Invoke $(call) the function with the parameters and execute
#            the result as CLI CMD in a $(shell)
# ----------------------------------------------------------------------------
exec_cliVAL = $(__gmswe_tr2) \
               $(eval cmd =\
                 $$(call $1,$(call merge,$(__gmswe_comma),$(foreach param,$2,$(param))\
                 ))\
               )\
             $(info $$(cmd) $(cmd))\
             $(shell $(cmd))

# ----------------------------------------------------------------------------
# Function:  exec_cliPTR
# Arguments: 1: Name of function to $(call) withe the list of value name 2
#            2: List of parameter to use when calling the function in 1
# Returns:   Nothing?
# Does:      Invoke $(call) the function with the value names and execute
#            the result as CLI CMD in a $(shell)
# ----------------------------------------------------------------------------
exec_cliPTR = $(__gmswe_tr2) \
               $(eval cmd =\
                 $$(call $1,$(call merge,$(__gmswe_comma),$(foreach param,$2,$(value $(param)))\
                 ))\
               )\
             $(info $$(cmd) $(cmd))\
             $(shell $(cmd))

# ----------------------------------------------------------------------------
# Function:  cmd_fetch_comment4pattern
# Arguments: 1: A Pattern
#            2: A filename
# Returns:   A command to filter for a block comment
#            in the file filename that contains the pattern
#            and nothing on empty or missing parameter
# ----------------------------------------------------------------------------
cmd_fetch_comment4pattern = $(__gmswe_tr2)$(if $1,$(if $2,grep -B 10 -A 10 -E '^\#\s*.*$1.*' $2 | grep ^\#))

# ----------------------------------------------------------------------------
# Function:  cmd_invalidate_target
# Arguments: 1: A file or folder
# Returns:   A CLI CMD for $(SHELL)
# Does:      Removes the folder and its content to invalidate a target
#            Fails silently if file or folder does not exist
#            Skips any directory that is on a file system
#            different from that of the corresponding command line argument
# ----------------------------------------------------------------------------
cmd_invalidate_target = $(__gmswe_tr1)$(if $1,rm --one-file-system --recursive --force $(__gmswe_log_p_delete) $1)

# ----------------------------------------------------------------------------
# Function:  cmd_recursively_remove_folder
# Arguments: 1: A folder
# Returns:   A CLI CMD for $(SHELL)
# Does:      Removes the folder and its content
#            Fails silently if folder does not exist
#            Skips any directory that is on a file system
#            different from that of the corresponding command line argument
# ----------------------------------------------------------------------------
cmd_recursively_remove_folder = $(__gmswe_tr1)$(if $1,rm --one-file-system --recursive --force $(__gmswe_log_p_delete) $1)
WILDCARD := *#.html

# ----------------------------------------------------------------------------
# Function:  cmd_touch_target
# Arguments: 1: A file or folder (target)
# Returns:   A CLI CMD for $(SHELL)
# Does:      Update the access and modification times of each 
#            target 1 to the current time
# ----------------------------------------------------------------------------
cmd_touch_target = $(__gmswe_tr1)$(if $1,touch $1)

endif # __gmswe_command_included
