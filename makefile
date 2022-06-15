include config.mk
.PHONY : find foo printallvars EMPTYTARGET FORCE QUERY
	$(__gmswe_dbg_tnp)
.SILENT :
	$(__gmswe_dbg_tnp)

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
	@echo "# make $(WEBSITE)"
	@echo "# make find [QUERY=pattern]"
	@echo $(DOKU)

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
$(CLEAN_DOCUMENTROOT) :
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,invalidate_target,$@))
	$(info $(call exec_cliPTR01,recursively_remove_folder,DOCUMENTROOT))
	$(info $(call exec_cliVAL01,touch_target,$@))

# ----------------------------------------------------------------------------
# Target:    $$(CLEAN) $(CLEAN) [clean]
# Arguments: None
# Does:      Triggers all $(CLEAN)_.* targets as prerequisite
$(CLEAN) : $(CLEAN_DOCUMENTROOT)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,invalidate_target,$@))
	$(info $(call exec_cliVAL01,touch_target,$@))

# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTS) $(DOCUMENTS) [documents]
# Arguments: None
# Does:      Creates the folder provided by DOCUMENTS
# ----------------------------------------------------------------------------
$(DOCUMENTS):
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,create_folder_w_parent,$@))
	$(info $(call exec_cliVAL01,touch_target,$@))

# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTROOT) $(DOCUMENTROOT) [public_html]
# Arguments: None
# Does:      Removes the folder provided by DOCUMENTROOT and its content
#            It does not remove other generated content
# ----------------------------------------------------------------------------
$(DOCUMENTROOT) :
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,invalidate_target,$@))
	$(info $(call exec_cliVAL01,create_folder_w_parent,$@))
	$(info $(call exec_cliPTR01,invalidate_target,CLEAN_DOCUMENTROOT))
	$(info $(call exec_cliPTR01,invalidate_target,CLEAN))
	$(info $(call exec_cliVAL01,touch_target,$@))


# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTS_INDEX.HTML) $(DOCUMENTS_INDEX.HTML) [documents/index.md]
# Arguments: None
# Does:      Provide the parent folder for the WEBSITE.
#            The content of this folder is wat's going to be published
# ----------------------------------------------------------------------------
$(DOCUMENTS_INDEX.MD) :
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,invalidate_target,$@))
	$(info $(call exec_cliVAL01,touch_target,$@))

# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTROOT_INDEX.HTML) $(DOCUMENTROOT_INDEX.HTML) [public_html/index.html]
# Arguments: None
# Does:      Provide the parent folder for the WEBSITE.
#            The content of this folder is wat's going to be published
# ----------------------------------------------------------------------------
$(DOCUMENTROOT_INDEX.HTML) : $(DOCUMENTS_INDEX.MD)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,invalidate_target,$@))
	$(info $(call exec_cliVAL01,touch_target,$@))

# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTROOT_SITEMAP.XML) $(DOCUMENTROOT_SITEMAP.XML) [public_html/sitmap.xml]
# Arguments: None
# Does:      Creates a file referencing the HTML-files of the website
#            A search engine can use this file to navigate
#            and index the website
# ----------------------------------------------------------------------------
$(DOCUMENTROOT_SITEMAP.XML) : $(DOCUMENTROOT_INDEX.HTML)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,invalidate_target,$@))
	$(eval $(call sitemap,$(DOCUMENTROOT),$(SITEMAP_WILDCARD),$@))
	$(info $(call exec_cliVAL01,touch_target,$@))

# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTROOT_ROBOTS.TXT) $(DOCUMENTROOT_ROBOTS.TXT) [robots.txt}
# Arguments: None
# Does:      Provides a is static file in order to point
#            search engins to the sitmap.xml
# ----------------------------------------------------------------------------
$(DOCUMENTROOT_ROBOTS.TXT) : $(DOCUMENTROOT_SITEMAP.XML)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,invalidate_target,$@))
	$(info $(call exec_cliVAL01,touch_target,$@))

# ----------------------------------------------------------------------------
# Target:    $$(WEBSITE) $(WEBSITE) [website]
# Arguments: None
# Does:      Build all parts of a website
# ----------------------------------------------------------------------------
$(WEBSITE) : $(DOCUMENTS) $(DOCUMENTROOT) $(DOCUMENTROOT_ROBOTS.TXT)
	$(__gmswe_dbg_tnp)
#	$(info $(call exec_cliVAL01,invalidate_target,$@))
	$(info $(call exec_cliVAL01,touch_target,$@))

# ----------------------------------------------------------------------------
# Target:    EMPTYTARGET EMPTYTARGET (.PHONY) [EMPTYTARGET]
# Arguments: None
# Does:      Nothing, but
#            It's usesed to create a baseline for tests and in profiling
# ----------------------------------------------------------------------------
EMPTYTARGET : FORCE
	$(__gmswe_dbg_tnp)

# ----------------------------------------------------------------------------
# Target:    printallvars printallvars (.PHONY) [printallvars]
# Arguments: None
# Does:      Prints the name, value and (expanded value) of all variables
#            in $(.VARIABLES)
#            except if they start with '__' hence this are likely to be gmsl
#            or if their origin is in (environment% default automatic)
# ----------------------------------------------------------------------------
printallvars : FORCE
	$(__gmswe_dbg_tnp)
	echo $(call printallvars)

# ----------------------------------------------------------------------------
# Target:    $$(FIND) $(FIND) [find]
# Arguments: $(QUERY) text/plain [a-zA-Z0-9_-]
# Does:      Searches the comments blocks of the make files
# ----------------------------------------------------------------------------
$(FIND) : FORCE
	$(__gmswe_dbg_tnp)
	$(eval SANQUERY = $(shell echo $(QUERY) | sed 's/[^a-zA-Z0-9_-]//g'))
	$(if $(SANQUERY),-$(call fetch_comment4pattern,$(SANQUERY),functions.mk))
	$(if $(SANQUERY),-$(call fetch_comment4pattern,$(SANQUERY),makefile))
	$(if $(SANQUERY),-$(call fetch_comment4pattern,$(SANQUERY),/usr/include/__gmsl))

.DEFAULT_GOAL := QUERY
