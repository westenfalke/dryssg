ifndef __module_res.included
__module_res.included = $(true)

MODULE_RES.MODUL-LOC = modules/res
MODULE_RES.FILE_NAME := res.mk
#echo modules/res/res.mk|sha256sum
MODULE_RES.MODULE-ID := ac0eec4732ec3832bac6f6b635e4a23277b799e514a1dbf333b24559642dcea1
MODULE_RES.DIR_NAME        ?= resources
MODULE_RES.DIR             ?= $(CORE_BASE_INSTALL_DIR)/$(MODULE_RES.DIR_NAME)
MODULE_RES.AFTER_BODY.HTML ?= $(MODULE_RES.DIR)/$(CORE_DEF_AFTER_BODY.HTML)
MODULE_RES.METADATA.YAML   ?= $(MODULE_RES.DIR)/$(CORE_DEF_METADATA.YAML)

# ----------------------------------------------------------------------------
# Target:    $$(MODULE_RES.DIR) $(MODULE_RES.DIR) [MODULE_RES.DIR]
# Arguments: None
# Does:      Creates the folder for MODULE_RES.DIR 
#            and (probably empty) default MODULE_RES.DIR
# ----------------------------------------------------------------------------
$(MODULE_RES.DIR):
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_create_folder_w_parent,$@))
	[ -e $(MODULE_RES.AFTER_BODY.HTML) ] || touch $(MODULE_RES.AFTER_BODY.HTML)
	[ -e $(MODULE_RES.METADATA.YAML) ]   || touch $(MODULE_RES.METADATA.YAML)
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))

endif # __module_res.included
