ifndef __gmswe_command_included
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
cmd_create_folder_w_parent = $(__gmswe_tr1)$(if $1 ,[ -d $1 ] || mkdir --parent $(__gmswe_log_p_create) $1)

# ----------------------------------------------------------------------------
# Function:  exec_cliPTR01
# Arguments: 1: Name of function to $(call) withe the argument in 2
#            2: Variable name to use when calling the function in 1
# Returns:   Nothing?
# Does:      Invoke $(call) the function with the parameter and execute
#            the result as CLI CMD in a $(shell)
# ----------------------------------------------------------------------------
exec_cliPTR01 = $(__gmswe_tr2)$(if $1,$(call exec_cmd,$(call $1,$(value $2))))

# ----------------------------------------------------------------------------
# Function:  exec_cliVAL01
# Arguments: 1: Name of the cmd_function to $(call) with the value in 2
#            2: Name of the value to use when calling the function in 1
# Returns:   Nothing?
# Does:      Invoke $(call) with function 1 with the value name 2 and execute
#            the result as CLI CMD in a $(shell)
# ----------------------------------------------------------------------------
exec_cliVAL01 = $(__gmswe_tr2)$(if $1,$(call exec_cmd,$(call $1,$2)))

# ----------------------------------------------------------------------------
# Function:  exec_cliVAL
# Arguments: 1: Name of function to $(call) with the list of parameters 2
#            2: List of parameter to use when calling the function in 1
# Returns:   Nothing?
# Does:      Invoke $(call) the function with the parameters and execute
#            the result as CLI CMD in a $(shell)
# ----------------------------------------------------------------------------
define exec_cliVAL
$(__gmswe_tr2)
$(eval cmd =\
  $$(call $1,$(call merge,$(__gmswe_comma),$(foreach param,$2,$(param)))))\
$(call exec_cmd,$(cmd))
endef

# ----------------------------------------------------------------------------
# Function:  exec_cliPTR
# Arguments: 1: Name of function to $(call) withe the list of value name 2
#            2: List of parameter to use when calling the function in 1
# Returns:   Nothing?
# Does:      Invoke $(call) the function with the value names and execute
#            the result as CLI CMD in a $(shell)
# ----------------------------------------------------------------------------
define exec_cliPTR
$(__gmswe_tr2) \
$(eval cmd =\
  $$(call $1,$(call merge,$(__gmswe_comma),$(foreach param,$2,$(value $(param))))))\
$(call exec_cmd,$(cmd))
endef

# ----------------------------------------------------------------------------
# Function:  exec_cmd
# Arguments: 1: A CLI CMD to be run via $(shell)
# Returns:   Nothing?
# Does:      Execute the CLI CMD 1 in a $(shell)
# ----------------------------------------------------------------------------
exec_cmd = $(__gmswe_tr1)$(if $1,$(shell $1))

# ----------------------------------------------------------------------------
# Function:  cmd_invalidate_target
# Arguments: 1: A file or folder
# Returns:   A CLI CMD for $(SHELL)
# Does:      Sets the date of file (folder and its content)
#            way back into the past --date=@0 to invalidate a target
#            Nothing if the file or folder does not exist
# ----------------------------------------------------------------------------
define cmd_invalidate_target
$(__gmswe_tr1)
  $(if $1,                                                    \
    [ -d $1 ]                                                  \
      && find  $1 -type f| xargs touch --date=@0 --no-create    \
      ||                         touch --date=@0 --no-create $1)
endef

# ----------------------------------------------------------------------------
# Function:  cmd_sweep_files
# Arguments: 1: The folder to sweep out
# Returns:   A CLI CMD for $(SHELL)
# Does:      Remove files *not* newer than '19700101000'
#            toched with '-date=@0' and found with '! -newermt 0'
#            @see cmd_invalidate_target
# ----------------------------------------------------------------------------
func_sweep_files = $(__gmswe_tr1)$(if $1,$(call exec_cmdVAL01,cmd_sweep_files,$1))

# ----------------------------------------------------------------------------
# Function:  cmd_select_files_to_sweep_in
# Arguments: 1: A folder 
# Returns:   A CLI CMD for $(SHELL)  
# Does:      Finds all files in folder 1 that *not* newer than '19700101000'
# ----------------------------------------------------------------------------
cmd_select_files_to_sweep_in = $(__gmswe_tr1)$(if $1,find $1 -type f ! -newermt 0)

# ----------------------------------------------------------------------------
# Function:  cmd_sweep_files
# Arguments: 1: 
# Returns:   A CLI CMD for $(SHELL)
# Does:      ?
# ----------------------------------------------------------------------------
cmd_sweep_files = $(__gmswe_tr1)$(if $1,rm -f $(__gmswe_log_p_delete) $1)
# ----------------------------------------------------------------------------
# Function:  cmd_sweep_folder
# Arguments: 1: The folder to sweep out
# Returns:   A CLI CMD for $(SHELL)
# Does:      Remove files not newer than '19700101000'
#            toched with '-date=@0' and found with '! -newermt 0'
#            @see cmd_invalidate_target
# ----------------------------------------------------------------------------
cmd_sweep_folder = $(__gmswe_tr2)find $1 -type d ! -newermt 0 | xargs --max-args=100 rmdir --ignore-fail-on-non-empty $(__gmswe_log_p_delete)

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
# Function:  cmd_mark_target_done
# Arguments: 1: A file or folder (target)
# Returns:   A CLI CMD for $(SHELL)
# Does:      Update the access and modification times of each 
#            target 1 to the current time
# ----------------------------------------------------------------------------
cmd_mark_target_done = $(__gmswe_tr1)$(if $1,touch $1)

endif # __gmswe_command_included
