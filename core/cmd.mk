ifndef __core_cmd_included 
__core_cmd_included  = $(true)
__gmswe_comma := ,
__gmswe_nullstring :=

# ----------------------------------------------------------------------------
# Function:  core_cmd_create_folder_w_parent
# Arguments: 1: A folder
# Returns:   A CLI CMD for $(SHELL)
# Does:      Create the folder(s), if they do not already exist
#            no error if existing, makes parent directories as needed
# ----------------------------------------------------------------------------
core_cmd_create_folder_w_parent = $(module_trace.tr1)$(if $1 ,[ -d $1 ] || mkdir --parent $(__module_log.log_p_create) $1)

# ----------------------------------------------------------------------------
# Function:  core_exec_cliPTR01
# Arguments: 1: Name of function to $(call) withe the argument in 2
#            2: Variable name to use when calling the function in 1
# Returns:   Nothing?
# Does:      Invoke $(call) the function with the parameter and execute
#            the result as CLI CMD in a $(shell)
# ----------------------------------------------------------------------------
core_exec_cliPTR01 = $(module_trace.tr2)$(if $1,$(call core_exec_cmd,$(call $1,$(value $2))))

# ----------------------------------------------------------------------------
# Function:  core_exec_cliVAL01
# Arguments: 1: Name of the cmd_function to $(call) with the value in 2
#            2: Name of the value to use when calling the function in 1
# Returns:   Nothing?
# Does:      Invoke $(call) with function 1 with the value name 2 and execute
#            the result as CLI CMD in a $(shell)
# ----------------------------------------------------------------------------
core_exec_cliVAL01 = $(module_trace.tr2)$(if $1,$(call core_exec_cmd,$(call $1,$2)))

# ----------------------------------------------------------------------------
# Function:  core_exec_cliVAL
# Arguments: 1: Name of function to $(call) with the list of parameters 2
#            2: List of parameter to use when calling the function in 1
# Returns:   Nothing?
# Does:      Invoke $(call) the function with the parameters and execute
#            the result as CLI CMD in a $(shell)
# ----------------------------------------------------------------------------
define core_exec_cliVAL
$(module_trace.tr2)
$(eval cmd =\
  $$(call $1,$(call merge,$(__gmswe_comma),$(foreach param,$2,$(param)))))\
$(call core_exec_cmd,$(cmd))
endef

# ----------------------------------------------------------------------------
# Function:  core_exec_cliPTR
# Arguments: 1: Name of function to $(call) withe the list of value name 2
#            2: List of parameter to use when calling the function in 1
# Returns:   Nothing?
# Does:      Invoke $(call) the function with the value names and execute
#            the result as CLI CMD in a $(shell)
# ----------------------------------------------------------------------------
define core_exec_cliPTR
$(module_trace.tr2) \
$(eval cmd =\
  $$(call $1,$(call merge,$(__gmswe_comma),$(foreach param,$2,$(value $(param))))))\
$(call core_exec_cmd,$(cmd))
endef

# ----------------------------------------------------------------------------
# Function:  core_exec_cmd
# Arguments: 1: A CLI CMD to be run via $(shell)
# Returns:   Nothing?
# Does:      Execute the CLI CMD 1 in a $(shell)
# ----------------------------------------------------------------------------
core_exec_cmd = $(module_trace.tr1)$(if $1,$(shell $1))

# ----------------------------------------------------------------------------
# Function:  core_cmd_invalidate_target
# Arguments: 1: A file or folder
# Returns:   A CLI CMD for $(SHELL)
# Does:      Sets the date of file (folder and its content)
#            way back into the past --date=@0 to invalidate a target
#            Nothing if the file or folder does not exist
# ----------------------------------------------------------------------------
define core_cmd_invalidate_target
$(module_trace.tr1)
  $(if $1,                                                    \
    [ -d $1 ]                                                  \
      && find  $1 -type f| xargs touch --date=@0 --no-create    \
      ||                         touch --date=@0 --no-create $1)
endef

## ----------------------------------------------------------------------------
## Function:  core_func_sweep_files
## Arguments: 1: The folder to sweep out
## Returns:   A CLI CMD for $(SHELL)
## Does:      Remove files *not* newer than '19700101000'
##            toched with '-date=@0' and found with '! -newermt 0'
##            @see core_cmd_invalidate_target
## REM:       !!!UNUSED!!! and in the wrong file
## ----------------------------------------------------------------------------
##core_func_sweep_files = $(module_trace.tr1)$(if $1,$(call exec_cmdVAL01,core_cmd_sweep_files,$1))

# ----------------------------------------------------------------------------
# Function:  core_cmd_select_files_to_sweep_in
# Arguments: 1: A folder 
# Returns:   A CLI CMD for $(SHELL)  
# Does:      Finds all files in folder 1 that *not* newer than '19700101000'
# ----------------------------------------------------------------------------
core_cmd_select_files_to_sweep_in = $(module_trace.tr1)$(if $1,find $1 -type f ! -newermt 0)

# ----------------------------------------------------------------------------
# Function:  core_cmd_sweep_files
# Arguments: 1: 
# Returns:   A CLI CMD for $(SHELL)
# Does:      ?
# ----------------------------------------------------------------------------
core_cmd_sweep_files = $(module_trace.tr1)$(if $1,rm -f $(__module_log.log_p_delete) $1)
# ----------------------------------------------------------------------------
# Function:  core_cmd_sweep_folder
# Arguments: 1: The folder to sweep out
# Returns:   A CLI CMD for $(SHELL)
# Does:      Remove files not newer than '19700101000'
#            toched with '-date=@0' and found with '! -newermt 0'
#            @see core_cmd_invalidate_target
# ----------------------------------------------------------------------------
core_cmd_sweep_folder = $(module_trace.tr2)find $1 -type d ! -newermt 0 | xargs --max-args=100 rmdir --ignore-fail-on-non-empty $(__module_log.log_p_delete)

# ----------------------------------------------------------------------------
# Function:  core_cmd_recursively_remove_folder
# Arguments: 1: A folder
# Returns:   A CLI CMD for $(SHELL)
# Does:      Removes the folder and its content
#            Fails silently if folder does not exist
#            Skips any directory that is on a file system
#            different from that of the corresponding command line argument
# ----------------------------------------------------------------------------
core_cmd_recursively_remove_folder = $(module_trace.tr1)$(if $1,rm --one-file-system --recursive --force $(__module_log.log_p_delete) $1)
WILDCARD := *#.html

# ----------------------------------------------------------------------------
# Function:  core_cmd_mark_target_done
# Arguments: 1: A file or folder (target)
# Returns:   A CLI CMD for $(SHELL)
# Does:      Update the access and modification times of each 
#            target 1 to the current time
# ----------------------------------------------------------------------------
core_cmd_mark_target_done = $(module_trace.tr1)$(if $1,touch $1)

endif # __core_cmd_included 
