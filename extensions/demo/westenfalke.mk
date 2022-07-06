ifndef __gmswe_westenfalke_included
__gmswe_westenfalke_included = $(true)

EXTENSION_WESTENFALKE.LOC := extensions/demo
EXTENSION_WESTENFALKE.MAKEFILE := westenfalke.mk
#echo extensions/demo/westenfalke.mk|sha256sum
EXTENSION_WESTENFALKE.ID  := 4d31b8d757e8a9ebd5aaa03069eb345a18df80609e6204e5a3dc306e3970ed53
EXTENSION_WESTENFALKE.NAME = WESTENFALKE
EXTENSIONWESTENFALKE.SHORT_NAME = DEX

EXTENSION_WESTENFALKE.TEMPLATE_HTML_NAME ?= westenfalke.html 
EXTENSION_WESTENFALKE.TEMPLATE_HTML_FROM ?= $(EXTENSION_WESTENFALKE.LOC)/$(EXTENSION_WESTENFALKE.TEMPLATE_HTML_NAME)
EXTENSION_WESTENFALKE.TEMPLATE_HTML_TO   ?= $(MOUDULE_MD2HTML.TEMPLATEDIR)/$(EXTENSION_WESTENFALKE.TEMPLATE_HTML_NAME)
EXTENSION_WESTENFALKE.TEMPLATE_HTML      ?= custom_template_westenfalke

$(EXTENSION_WESTENFALKE.TEMPLATE_HTML_TO) :
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_create_folder_w_parent,$(dir $@)))
	$(info $(shell cp --no-clobber $(__module_log.log_p_copy_verbose) $(EXTENSION_WESTENFALKE.TEMPLATE_HTML_FROM) $(EXTENSION_WESTENFALKE.TEMPLATE_HTML_TO)))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(EXTENSION_WESTENFALKE.TEMPLATE_HTML) $(EXTENSION_WESTENFALKE.TEMPLATE_HTML) [westenfalke_target_action_name]
# Arguments: None
# Does:      Nothing
# REM:       Default template @see modules/debug/debug.mk 
# ----------------------------------------------------------------------------
$(EXTENSION_WESTENFALKE.TEMPLATE_HTML) : $(MOUDULE_MD2HTML.DEFAULT.HTML) $(EXTENSION_WESTENFALKE.TEMPLATE_HTML_TO)
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Function:  cmd_create_somthing_amazing_4_westenfalke
# Arguments: None
# Returns:   A CLI CMD for $(SHELL)
# Does:      Nothing
# REM:       Function template @see modules/trace/trace.mk 
# ----------------------------------------------------------------------------
cmd_create_somthing_amazing_4_westenfalke = $(module_trace.tr0) $(WESTENFALKE_A_VALUE)

endif # __gmswe_westenfalke_included