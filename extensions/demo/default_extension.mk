ifndef __gmswe_default_extension_included
__gmswe_default_extension_included = $(true)

DEFAULT_EXTENSION.EXTENSION-LOC = extensions/demo/default_extension.mk
#echo extensions/demo/default_extension.mk|sha256sum
DEFAULT_EXTENSION.MODULE-ID := XXXX
DEFAULT_EXTENSION.NAME = DEFAULT_EXTENSION
DEFAULT_EXTENSION.SHORT_NAME = DEX

DEFAULT_EXTENSION_A_VALUE ?= a value of the default extension
DEFAULT_EXTENSION_TARGET ?= default_extension_target_action

# ----------------------------------------------------------------------------
# Target:    $$(DEFAULT_EXTENSION_TARGET) $(DEFAULT_EXTENSION_TARGET) [default_extension_target_action_name]
# Arguments: None
# Does:      Nothing
# REM:       Default template @see modules/debug/debug.mk 
# ----------------------------------------------------------------------------
$(DEFAULT_EXTENSION_TARGET) :
	$(__module_dbg.tnp)

# ----------------------------------------------------------------------------
# Function:  cmd_create_somthing_amazing_4_default_extension
# Arguments: None
# Returns:   A CLI CMD for $(SHELL)
# Does:      Nothing
# REM:       Function template @see modules/trace/trace.mk 
# ----------------------------------------------------------------------------
cmd_create_somthing_amazing_4_default_extension = $(module_trace.tr0) $(DEFAULT_EXTENSION_A_VALUE)

endif # __gmswe_default_extension_included