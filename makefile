include config.mk
.PHONY : find foo printallvars EMPTYTARGET FORCE QUERY
	$(__gmswe_dbg_tnp)
.SILENT :
	$(__gmswe_dbg_tnp)

# ----------------------------------------------------------------------------
# Target:    FORCE
# Arguments: None
# Does:      Nothing, but to deal as an target without a recipe and
#            therefore to trigger another (not PHONY) target
# ----------------------------------------------------------------------------
FORCE :
	$(__gmswe_dbg_tnp)

# ----------------------------------------------------------------------------
# Target:    usage
# Arguments: None
# Does:      Diplays usage
# ----------------------------------------------------------------------------
usage : FORCE
	$(__gmswe_dbg_tnp)
	@echo "usage"
	@echo "# make usage"
	@echo "# make website"
	@echo "# make find [QUERY=pattern]"

# ----------------------------------------------------------------------------
# Target:      .DEFAULT_GOAL : QUERY
# Prerequisit: 'usage :' if $(QUERY) is empty, else 'find :'
# Arguments:   $(QUERY)
# Does:        Supplies CLI with auto compleation for the find target
#              find [QUERY=pattern]
#              Diplays usage, QUERY is empty
# ----------------------------------------------------------------------------
QUERY : $(if $(QUERY),find,usage)
	$(__gmswe_dbg_tnp)

# ----------------------------------------------------------------------------
# Target:    CLEAN (clean)
# Arguments: None
# Does:      Triggers all $(CLEAN.*) targets
$(CLEAN) : $(CLEAN_DOCUMENTROOT)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cli01,invalidate_target,CLEAN))
	$(info $(call exec_cli01,touch_target,CLEAN))

# ----------------------------------------------------------------------------
# Target:    CLEAN_DOCUMENTROOT (clean_public_html)
# Arguments: None
# Does:      Removes the folder provided by DOCUMENTROOT and its content
#            It does not remove other generated content
# ----------------------------------------------------------------------------
$(CLEAN_DOCUMENTROOT) :
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cli01,invalidate_target,$(CLEAN_DOCUMENTROOT)))
	$(info $(call exec_cli,$(DOCUMENTROOT)recursively_remove_folder,DOCUMENTROOT))
	$(info $(call exec_cli01,recursively_remove_folder,DOCUMENTROOT))
	$(info $(call exec_cli01,touch_target,CLEAN_DOCUMENTROOT))

# ----------------------------------------------------------------------------
# Target:    DOCUMENTROOT (public_html)
# Arguments: None
# Does:      Removes the folder provided by DOCUMENTROOT and its content
#            It does not remove other generated content
# ----------------------------------------------------------------------------
$(DOCUMENTROOT):
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cli01,invalidate_target,DOCUMENTROOT))
	$(info $(call exec_cli01,create_folder_w_parent,DOCUMENTROOT))
	$(info $(call exec_cli01,invalidate_target,CLEAN))
	$(info $(call exec_cli01,invalidate_target,CLEAN_DOCUMENTROOT))
	$(info $(call exec_cli01,touch_target,DOCUMENTROOT))

# ----------------------------------------------------------------------------
# Target:    DOCUMENTROOT_INDEX.HTML (public_html/index.html)
# Arguments: None
# Does:      Provide the parent folder for the WEBSITE.
#            The content of this folder is wat's going to be published
# ----------------------------------------------------------------------------
$(DOCUMENTROOT_INDEX.HTML) : index.md
	$(__gmswe_dbg_tnp)

# ----------------------------------------------------------------------------
# Target:    DOCUMENTROOT_SITEMAP.XML (public_html/sitmap.xml)
# Arguments: None
# Does:      Creates a file referencing the HTML-files of the website
#            A search engine can use this file to navigate
#            and index the website
# ----------------------------------------------------------------------------
$(DOCUMENTROOT_SITEMAP.XML) : $(DOCUMENTROOT)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cli01,invalidate_target,DOCUMENTROOT_SITEMAP.XML))
	$(info $(call exec_cli01,touch_target,DOCUMENTROOT_SITEMAP.XML))

# ----------------------------------------------------------------------------
# Target:    robots.txt
# Arguments: None
# Does:      Provides a is static file in order to point
#            search engins to the sitmap.xml
# ----------------------------------------------------------------------------
$(DOCUMENTROOT_ROBOTS.TXT) : $(DOCUMENTROOT_SITEMAP.XML)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cli01,invalidate_target,DOCUMENTROOT_ROBOTS.TXT))
	$(info $(call exec_cli01,touch_target,DOCUMENTROOT_ROBOTS.TXT))

# ----------------------------------------------------------------------------
# Target:    WEBSITE (website)
# Arguments: None
# Does:      Build all parts of a website
# ----------------------------------------------------------------------------
$(WEBSITE) : $(DOCUMENTROOT_ROBOTS.TXT)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cli01,invalidate_target,WEBSITE))
	$(info $(call exec_cli01,touch_target,WEBSITE))

# ----------------------------------------------------------------------------
# Taeget:    foo (.PHONY)
# Arguments: None
# Does:      Test the function.mk:foo
# Returns:   Nothing
# ----------------------------------------------------------------------------
foo : FORCE
	$(__gmswe_dbg_tnp)
	$(call foo,A,B,C)

# ----------------------------------------------------------------------------
# Target:    EMPTYTARGET (.PHONY)
# Arguments: None
# Does:      Nothing, but
#            It's usesed to create a baseline for tests and in profiling
# ----------------------------------------------------------------------------
EMPTYTARGET : FORCE
	$(__gmswe_dbg_tnp)

# ----------------------------------------------------------------------------
# Target:    printallvars (.PHONY)
# Arguments: None
# Does:      Prints the name, value and (expanded value) of all variables
#            in $(.VARIABLES)
#            except if they start with '__' hence this are likely to be gmsl
#            or if their origin is in (environment% default automatic)
# ----------------------------------------------------------------------------
printallvars : FORCE (.PHONY)
	$(__gmswe_dbg_tnp)
	echo $(call printallvars)

# ----------------------------------------------------------------------------
# Target:    find (.PHONY)
# Arguments: $(QUERY) text/plain [a-zA-Z0-9_-]
# Does:      Searches the comments blocks of the make files
# ----------------------------------------------------------------------------
find : FORCE
	$(__gmswe_dbg_tnp)
	$(eval SANQUERY = $(shell echo $(QUERY) | sed 's/[^a-zA-Z0-9_-]//g'))
	$(if $(SANQUERY),-$(call fetch_comment4pattern,$(SANQUERY),functions.mk))
	$(if $(SANQUERY),-$(call fetch_comment4pattern,$(SANQUERY),makefile))
	$(if $(SANQUERY),-$(call fetch_comment4pattern,$(SANQUERY),/usr/include/__gmsl))

.DEFAULT_GOAL := QUERY
