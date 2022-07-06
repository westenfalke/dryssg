include config.mk
.PHONY : EMPTYTARGET FORCE reset
.SILENT :
.SUFFIXES : # Delete the default suffixes
.NO_PARALLEL : $(NO_PARALLEL_CORE_TARGETS) $(PARALLEL_MODULE_TARGETS)

CORE_DEF_BASEURL      ?= .
CORE_DEF_DOCUMENTROOT ?= public_html

# ----------------------------------------------------------------------------
# Target:    FORCE FORCE (.PHONY) [FORCE]
# Arguments: None
# Does:      Nothing, but to deal as an target without a recipe and
#            therefore to trigger another (not PHONY) target
# ----------------------------------------------------------------------------
FORCE :
	$(__module_dbg.tnp)

# ----------------------------------------------------------------------------
# Target:    $$(CCORE_DEF_USAGE) $(CCORE_DEF_USAGE) [usage]
# Arguments: None
# Does:      Diplays usage
# ----------------------------------------------------------------------------
$(CCORE_DEF_USAGE) : FORCE
	$(__module_dbg.tnp)
	@echo "# make $(CCORE_DEF_USAGE)"
	@echo "# make $(CORE_DEF_SWEEP)"
	@echo "# make $(CORE_DEF_WEBSITE)"
	@echo "# make $(CORE_DEF_DEPLOY)"


# ----------------------------------------------------------------------------
# Target:    $$(CORE_DEF_SWEEP_DOCUMENTROOT) $CORE_DEF_SWEEP_DOCUMENTROOT [sweep_public_html]
# Arguments: None
# Does:      Removes the folder provided by CORE_DEF_DOCUMENTROOT and its content
#            It does not remove other generated content
# ----------------------------------------------------------------------------
$(CORE_DEF_SWEEP_DOCUMENTROOT) : FORCE
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$(CORE_DEF_DOCUMENTROOT)))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(CORE_DEF_SWEEP) $(CORE_DEF_SWEEP) [sweep]
# Arguments: None
# Does:      Triggers all $(CORE_DEF_SWEEP)_.* targets as prerequisite
$(CORE_DEF_SWEEP) : $(CORE_DEF_SWEEP_DOCUMENTROOT)
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(CORE_DEF_DOCUMENTROOT) $(CORE_DEF_DOCUMENTROOT) [public_html]
# Arguments: CORE_DEF_DOCUMENTROOT
# Does:      Creates the folder provides by CORE_DEF_DOCUMENTROOT
#            This target used for documentation purpose
# ----------------------------------------------------------------------------
$(CORE_DEF_DOCUMENTROOT) : $(MODULE_DOC.DOCUMENTS)
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_create_folder_w_parent,$@))
	$(info $(call modules_ststic_files.cmd_sync_files))#(sh/c)ould this be a target?!
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTROOT_INDEX.HTML) $(DOCUMENTROOT_INDEX.HTML) [public_html/index.html]
# Arguments: None
# Does:      Provide the parent folder for the CORE_DEF_WEBSITE.
#            The content of this folder is wat's going to be published
# ----------------------------------------------------------------------------
$(CORE_DEF_DOCUMENTROOT)/%.html : $(MODULE_DOC.DOCUMENTS)/%.md $(MODULE_RES.DIR) $(CORE_DEF_DOCUMENTROOT) $(MOUDULE_MD2HTML.DATADIR) $(MODULE_MENU_CARD.DIR) $(MODULE_STATIC_FILES.DIR) $(EXTENSION_WESTENFALKE.TEMPLATE_HTML)
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_create_folder_w_parent,$(dir $@)))
	$(info $(call core_exec_cliVAL,module_md2html.cmd_transform_md2html,$< $@))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(CORE_DEF_WEBSITE) $(CORE_DEF_WEBSITE) [website_build]
# Arguments: None
# Does:      A dirty build of all parts of a website
# ----------------------------------------------------------------------------
$(CORE_DEF_WEBSITE) : $(CORE_DEF_DOCUMENTROOT_ROBOTS.TXT)
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$(CORE_DEF_SWEEP_DOCUMENTROOT)))
	$(info $(call core_exec_cliVAL,modules_ststic_files.cmd_sync_files))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(CORE_DEF_DEPLOY) $(CORE_DEF_DEPLOY) [website_build_and_deployed]
# Arguments: None
# Does:      A sweeped build of all parts of a website
# ----------------------------------------------------------------------------
$(CORE_DEF_DEPLOY) : $(CORE_DEF_SWEEP) $(CORE_DEF_WEBSITE)
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    %.mk %.mk [%.mk]
# Arguments: None
# Does:      just to speed things up
# ----------------------------------------------------------------------------
%.mk :

# ----------------------------------------------------------------------------
# Target:    clean clean [clean]
# Arguments: None
# Does:      Remove the CORE_DEF_DOCUMENTROOT and all of its content
# ----------------------------------------------------------------------------
clean : $(CORE_DEF_DOCUMENTROOT) $(FORCE)
	$(__module_dbg.tnp)
	rm -rf $<


# ----------------------------------------------------------------------------
# Target:    reset reset [reset]
# Arguments: None
# Does:      remmove all default folder
# REM:       HERE LIVE DRAGONS
# ----------------------------------------------------------------------
reset : $(CORE_DEF_DOCUMENTROOT) $(MODULE_DOC.DOCUMENTS) $(MODULE_RES.DIR) $(MOUDULE_MD2HTML.DATADIR)
	$(__module_dbg.tnap)
	rm -rfi --verbose $^

.DEFAULT_GOAL := $(CORE_DEF_WEBSITE)
