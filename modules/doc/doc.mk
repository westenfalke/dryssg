ifndef __module_docincluded
__module_docincluded = $(true)

MODULE_DOC.DOCUMENTS_NAME        ?= documents
MODULE_DOC.DOCUMENTS             ?= $(CORE_BASE_INSTALL_DIR)/$(MODULE_DOC.DOCUMENTS_NAME)
MODULE_DOC.DOCUMENTS_ALL_MD      ?= $(sort $(call core_func_rwildcard,$(MODULE_DOC.DOCUMENTS),*.md))
MODULE_DOC.DOCUMENTROOT_ALL_HTML ?= $(patsubst $(MODULE_DOC.DOCUMENTS)/%.md,$(CORE_DEF_DOCUMENTROOT)/%.html,$(MODULE_DOC.DOCUMENTS_ALL_MD))
MODULE_DOC.DOCUMENTROOT_ALL_DIR  ?= $(dir $(MODULE_DOC.DOCUMENTROOT_ALL_HTML))

DOCUMENTS_INDEX.MD ?= $(MODULE_DOC.DOCUMENTS)/$(CORE_DEF_INDEX.MD)
# ----------------------------------------------------------------------------
# Target:    $$(MODULE_DOC.DOCUMENTS) $(MODULE_DOC.DOCUMENTS) [documents]
# Arguments: None
# Does:      Creates the folder provided by MODULE_DOC.DOCUMENTS
# ----------------------------------------------------------------------------
$(MODULE_DOC.DOCUMENTS):
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_create_folder_w_parent,$@))
	[ -e $(DOCUMENTS_INDEX.MD) ] || cp $(CORE_BASE_INSTALL_DIR)/README.md $(DOCUMENTS_INDEX.MD)
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))

endif # __module_docincluded
