include config.mk
.PHONY : find func_foo EMPTYTARGET FORCE QUERY
	$(__gmswe_dbg_tnp)
.SILENT :
	$(__gmswe_dbg_tnp)

.SUFFIXES: # Delete the default suffixes

BASEURL      ?= .
DOCUMENTROOT ?= public_html

# ----------------------------------------------------------------------------
# Target:    FORCE FORCE (.PHONY) [FORCE]
# Arguments: None
# Does:      Nothing, but to deal as an target without a recipe and
#            therefore to trigger another (not PHONY) target
# ----------------------------------------------------------------------------
FORCE :
	$(__gmswe_dbg_tnp)

# ----------------------------------------------------------------------------
# Target:    $$(USAGE) $(USAGE) [usage]
# Arguments: None
# Does:      Diplays usage
# ----------------------------------------------------------------------------
$(USAGE) : FORCE
	$(__gmswe_dbg_tnp)
	@echo "# make $(USAGE)"
	@echo "# make $(CLEAN)"
	@echo "# make $(WEBSITE)"
	@echo "# make find [QUERY=pattern]"

# ----------------------------------------------------------------------------
# Target:      QUERY QUERY (.DEFAULT_GOAL) [QUERY]
# Prerequisit: 'usage :' if $(QUERY) is empty, else 'find :'
# Arguments:   $$(QUERY)
# Does:        Supplies CLI with auto compleation for the find target
#              find [QUERY=pattern]
#              Diplays usage, QUERY is empty
# ----------------------------------------------------------------------------
QUERY : $(if $(QUERY),$(FIND),$(USAGE))
	$(__gmswe_dbg_tnp)

# ----------------------------------------------------------------------------
# Target:    $$(CLEAN_DOCUMENTROOT) $CLEAN_DOCUMENTROOT [clean_public_html]
# Arguments: None
# Does:      Removes the folder provided by DOCUMENTROOT and its content
#            It does not remove other generated content
# ----------------------------------------------------------------------------
$(CLEAN_DOCUMENTROOT) : FORCE
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(info $(call exec_cliPTR01,cmd_recursively_remove_folder,DOCUMENTROOT))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(CLEAN) $(CLEAN) [clean]
# Arguments: None
# Does:      Triggers all $(CLEAN)_.* targets as prerequisite
$(CLEAN) : $(CLEAN_DOCUMENTROOT)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTROOT) $(DOCUMENTROOT) [public_html]
# Arguments: None
# Does:      ?
# ----------------------------------------------------------------------------
$(DOCUMENTROOT_ALL_DIR) :
	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$@))
#$(DOCUMENTROOT) : $(DOCUMENTROOT_ALL_DIR)
#	$(__gmswe_dbg_tnp)
#	$(error FOO)
#	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
#	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$?))
#	touch -t 200001010000 $? $@
#	$(info $(call exec_cliVAL01,cmd_mark_target_done,$(DOCUMENTROOT_ALL_DIR)))
#	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTROOT)/%/ $(DOCUMENTROOT)/%/ [public_html/%/]
# Arguments: None
# Does:      ?
# ----------------------------------------------------------------------------
#$(DOCUMENTROOT)/%/ :
#	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$@))

# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTROOT_INDEX.HTML) $(DOCUMENTROOT_INDEX.HTML) [public_html/index.html]
# Arguments: None
# Does:      Provide the parent folder for the WEBSITE.
#            The content of this folder is wat's going to be published
# ----------------------------------------------------------------------------
$(DOCUMENTROOT)/%.html : $(DOCUMENTS)/%.md $(DOCUMENTROOT_ALL_DIR)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(info $(call exec_cliVAL,cmd_transform_md2html,$< $@))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(FIND) $(FIND) [find]
# Arguments: $(QUERY) text/plain [a-zA-Z0-9_-]
# Does:      Searches the comments blocks of the make files
# ----------------------------------------------------------------------------
$(FIND) : FORCE
	$(__gmswe_dbg_tnp)
	$(eval SANQUERY = $(shell echo $(QUERY) | sed 's/[^a-zA-Z0-9_-]//g'))
	$(if $(SANQUERY),-$(call cmd_fetch_comment4pattern,$(SANQUERY),/usr/include/__gmsl))
	$(if $(SANQUERY),-$(call cmd_fetch_comment4pattern,$(SANQUERY),*.mk))
	$(if $(SANQUERY),-$(call cmd_fetch_comment4pattern,$(SANQUERY),makefile))

# ----------------------------------------------------------------------------
# Target:    $$(WEBSITE) $(WEBSITE) [website]
# Arguments: None
# Does:      Build all parts of a website
# ----------------------------------------------------------------------------
$(WEBSITE) : $(DOCUMENTROOT_ROBOTS.TXT)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	find  $(DOCUMENTROOT) |xargs  touch --date=$$(date +"%T")
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

%.mk :

.DEFAULT_GOAL := QUERY
