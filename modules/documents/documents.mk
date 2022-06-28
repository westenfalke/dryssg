ifndef __gmswe_documents_included
__gmswe_documents_included = $(true)

DOCUMENTS             ?= $(INSTALLDIR)/documents
DOCUMENTS_ALL_MD      ?= $(sort $(call func_rwildcard,$(DOCUMENTS),*.md))
DOCUMENTROOT_ALL_HTML ?= $(patsubst $(DOCUMENTS)/%.md,$(DOCUMENTROOT)/%.html,$(DOCUMENTS_ALL_MD))
DOCUMENTROOT_ALL_DIR  ?= $(dir $(DOCUMENTROOT_ALL_HTML))
INDEX.MD     ?= index.md
DOCUMENTS_INDEX.MD ?= $(DOCUMENTS)/$(INDEX.MD)
# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTS) $(DOCUMENTS) [documents]
# Arguments: None
# Does:      Creates the folder provided by DOCUMENTS
# ----------------------------------------------------------------------------
$(DOCUMENTS):
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$@))
	[ -e $(DOCUMENTS_INDEX.MD) ] || cp $(INSTALLDIR)/README.md $(DOCUMENTS_INDEX.MD)
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

endif # __gmswe_documents_included
