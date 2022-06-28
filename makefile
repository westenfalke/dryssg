include config.mk
.PHONY : EMPTYTARGET FORCE
.SILENT :
.SUFFIXES : # Delete the default suffixes
.NO_PARALLEL : $(NO_PARALLEL_CORE_TARGETS) $(PARALLEL_MODULE_TARGETS)

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
	@echo "# make $(SWEEP)"
	@echo "# make $(WEBSITE)"
	@echo "# make $(DEPLOY)"


# ----------------------------------------------------------------------------
# Target:    $$(SWEEP_DOCUMENTROOT) $SWEEP_DOCUMENTROOT [sweep_public_html]
# Arguments: None
# Does:      Removes the folder provided by DOCUMENTROOT and its content
#            It does not remove other generated content
# ----------------------------------------------------------------------------
$(SWEEP_DOCUMENTROOT) : FORCE
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$(DOCUMENTROOT)))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(SWEEP) $(SWEEP) [sweep]
# Arguments: None
# Does:      Triggers all $(SWEEP)_.* targets as prerequisite
$(SWEEP) : $(SWEEP_DOCUMENTROOT)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTROOT) $(DOCUMENTROOT) [public_html]
# Arguments: DOCUMENTROOT
# Does:      Creates the folder provides by DOCUMENTROOT
#            This target used for documentation purpose
# ----------------------------------------------------------------------------
$(DOCUMENTROOT) : $(DOCUMENTS)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$@))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTROOT_INDEX.HTML) $(DOCUMENTROOT_INDEX.HTML) [public_html/index.html]
# Arguments: None
# Does:      Provide the parent folder for the WEBSITE.
#            The content of this folder is wat's going to be published
# ----------------------------------------------------------------------------
$(DOCUMENTROOT)/%.html : $(DOCUMENTS)/%.md $(DOCUMENTROOT)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$(dir $@)))
	$(info $(call exec_cliVAL,cmd_transform_md2html,$< $@))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(WEBSITE) $(WEBSITE) [website_build]
# Arguments: None
# Does:      A dirty build of all parts of a website
# ----------------------------------------------------------------------------
$(WEBSITE) : $(DOCUMENTROOT_ROBOTS.TXT)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$(SWEEP_DOCUMENTROOT)))
	$(info $(call exec_cliVAL,cmd_sync_static_files))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(DEPLOY) $(DEPLOY) [website_build_and_deployed]
# Arguments: None
# Does:      A sweeped build of all parts of a website
# ----------------------------------------------------------------------------
$(DEPLOY) : $(SWEEP) $(WEBSITE)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    %.mk %.mk [%.mk]
# Arguments: None
# Does:      just to speed things up
# ----------------------------------------------------------------------------
%.mk :

# ----------------------------------------------------------------------------
# Target:    clean clean [clean]
# Arguments: None
# Does:      Remove the DOCUMENTROOT and all of its content
# ----------------------------------------------------------------------------
clean : $(DOCUMENTROOT) $(FORCE)
	rm -rf $<

.DEFAULT_GOAL := $(WEBSITE)
