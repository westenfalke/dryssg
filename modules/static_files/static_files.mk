ifndef __module_statc_files.included
__module_statc_files.included = $(true)

MODULE_STATIC_FILES.DIR_NAME ?= static
MODULE_STATIC_FILES.DIR ?= $(CORE_BASE_INSTALL_DIR)/$(MODULE_STATIC_FILES.DIR_NAME)
MODULE_STATIC_FILES.PARAM-VERBOSE         := --verbose
MODULE_STATIC_FILES.PARAM-RSYNC-INFO      := --info=NONE
MODULE_STATIC_FILES.PARAM-RSYNC-DEBUG     := --debug=NONE

#MODULE_STATIC_FILES.PARAM-RSYNC   := --update --delete --recursive $(MODULE_STATIC_FILES.PARAM-VERBOSE) $(MODULE_STATIC_FILES.PARAM-RSYNC-INFO) $(MODULE_STATIC_FILES.STATIC-PARAM-RSYNC-DEBUG)
MODULE_STATIC_FILES.PARAM-RSYNC   := --times --delete --recursive $(MODULE_STATIC_FILES.PARAM-VERBOSE) $(MODULE_STATIC_FILES.PARAM-RSYNC-INFO) $(MODULE_STATIC_FILES.STATIC-PARAM-RSYNC-DEBUG)
MODULE_STATIC_FILES.RSYNC                  := rsync $(MODULE_STATIC_FILES.PARAM-RSYNC)


 $(MODULE_STATIC_FILES.DIR) :
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_create_folder_w_parent,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))
	
# ----------------------------------------------------------------------------
# Function:  modules_ststic_files.cmd_sync_files
# Arguments: None
# Returns:   Nothing
# Does:      ?
# ----------------------------------------------------------------------------
modules_ststic_files.cmd_sync_files = $(module_trace.tr0)$(MODULE_STATIC_FILES.RSYNC) $(MODULE_STATIC_FILES.DIR)/* $(CORE_DEF_DOCUMENTROOT)/

endif # __module_statc_files.included
