ifndef __gmswe_documents_included
__gmswe_documents_included = $(true)

DOCUMENTS    ?= documents
DOCUMENTS_ALL_MD   = $(sort $(call func_rwildcard,$(DOCUMENTS),*.md))
DOCUMENTROOT_ALL_HTML = $(patsubst $(DOCUMENTS)/%.md,$(DOCUMENTROOT)/%.html,$(DOCUMENTS_ALL_MD))
DOCUMENTROOT_ALL_DIR = $(dir $(DOCUMENTROOT_ALL_HTML))
# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTS) $(DOCUMENTS) [documents]
# Arguments: None
# Does:      Creates the folder provided by DOCUMENTS
# ----------------------------------------------------------------------------
$(DOCUMENTS):
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$@))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

endif # __gmswe_documents_included
