ifndef gmswe_RESOURCES_included
gmswe_RESOURCES_included = $(true)

RESOURCES_DIR             ?= $(INSTALLDIR)/RESOURCES_DIR
RESOURCES_AFTER_BODY.HTML ?= $(RESOURCES_DIR)/after-body.html
RRESOURCES_METADATA.YAML  ?= $(RESOURCES_DIR)/metadate.yaml

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
	[ -e $(RRESOURCES_METADATA.YAML) ]   || touch $(RRESOURCES_METADATA.YAML)
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

endif # gmswe_RESOURCES_included
