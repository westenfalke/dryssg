ifndef gmswe_RESOURCES_included
gmswe_RESOURCES_included = $(true)

RESOURCES_DIR_NAME        ?= resources
RESOURCES_DIR             ?= $(INSTALLDIR)/$(RESOURCES_DIR_NAME)
RESOURCES_AFTER_BODY.HTML ?= $(RESOURCES_DIR)/$(AFTER_BODY.HTML)
RESOURCES_METADATA.YAML  ?= $(RESOURCES_DIR)/$(METADATA.YAML)

# ----------------------------------------------------------------------------
# Target:    $$(RESOURCES_DIR) $(RESOURCES_DIR) [RESOURCES_DIR]
# Arguments: None
# Does:      Creates the folder for RESOURCES_DIR 
#            and (probably empty) default RESOURCES_DIR
# ----------------------------------------------------------------------------
$(RESOURCES_DIR):
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$@))
	[ -e $(RESOURCES_AFTER_BODY.HTML) ] || touch $(RESOURCES_AFTER_BODY.HTML)
	[ -e $(RESOURCES_METADATA.YAML) ]   || touch $(RESOURCES_METADATA.YAML)
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

endif # gmswe_RESOURCES_included
