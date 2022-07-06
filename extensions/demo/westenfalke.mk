ifndef __gmswe_westenfalke_included
__gmswe_westenfalke_included = $(true)

WESTENFALKE.EXTENSION-LOC = extensions/demo/westenfalke.mk
#echo extensions/demo/westenfalke.mk|sha256sum
WESTENFALKE.MODULE-ID := XXXX
WESTENFALKE.NAME = WESTENFALKE
WESTENFALKE.SHORT_NAME = DEX

WESTENFALKE_A_VALUE ?= a value of the default extension
WESTENFALKE_TARGET ?= westenfalke_target_action

# ----------------------------------------------------------------------------
# Target:    $$(WESTENFALKE_TARGET) $(WESTENFALKE_TARGET) [westenfalke_target_action_name]
# Arguments: None
# Does:      Nothing
# REM:       Default template @see modules/debug/debug.mk 
# ----------------------------------------------------------------------------
$(WESTENFALKE_TARGET) :
	$(__module_dbg.tnp)

# ----------------------------------------------------------------------------
# Function:  cmd_create_somthing_amazing_4_westenfalke
# Arguments: None
# Returns:   A CLI CMD for $(SHELL)
# Does:      Nothing
# REM:       Function template @see modules/trace/trace.mk 
# ----------------------------------------------------------------------------
cmd_create_somthing_amazing_4_westenfalke = $(module_trace.tr0) $(WESTENFALKE_A_VALUE)

endif # __gmswe_westenfalke_included