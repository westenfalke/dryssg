ifndef __gmswe_getting_started_included
__gmswe_getting_started_included = $(true)

GETTING_STARTED.EXTENSION-LOC = extensions/demo/getting_started.mk
#echo extensions/demo/getting_started.mk|sha256sum
GETTING_STARTED.MODULE-ID := XXXX
GETTING_STARTED.NAME = GETTING_STARTED
GETTING_STARTED.SHORT_NAME = DEX

GETTING_STARTED_A_VALUE ?= a value of the default extension
GETTING_STARTED_TARGET ?= getting_started_target_action

# ----------------------------------------------------------------------------
# Target:    $$(GETTING_STARTED_TARGET) $(GETTING_STARTED_TARGET) [getting_started_target_action_name]
# Arguments: None
# Does:      Nothing
# REM:       Default template @see modules/debug/debug.mk 
# ----------------------------------------------------------------------------
$(GETTING_STARTED_TARGET) :
	$(__gmswe_dbg_tnp)

# ----------------------------------------------------------------------------
# Function:  cmd_create_somthing_amazing_4_getting_started
# Arguments: None
# Returns:   A CLI CMD for $(SHELL)
# Does:      Nothing
# REM:       Function template @see modules/trace/trace.mk 
# ----------------------------------------------------------------------------
cmd_create_somthing_amazing_4_getting_started = $(__gmswe_tr0) $(GETTING_STARTED_A_VALUE)

endif # __gmswe_getting_started_included