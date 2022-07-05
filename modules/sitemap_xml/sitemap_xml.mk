ifndef __module_sitemap_xml.included
__module_sitemap_xml.included = $(true)

MODULE_SITEMAP_XML.XML_HEAD     ?= <?xml version="1.0" encoding="UTF-8"?>
MODULE_SITEMAP_XML.URLSET_OPEN  ?= <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
MODULE_SITEMAP_XML.URL_OPEN     ?= <url>
MODULE_SITEMAP_XML.LOC_OPEN     ?= <loc>
MODULE_SITEMAP_XML.LOC_CLOSE    ?= </loc>
MODULE_SITEMAP_XML.URL_CLOSE    ?= </url>
MODULE_SITEMAP_XML.URLSET_CLOSE ?= </urlset>

MODULE_SITEMAP_XML.DOCUMENTROOT_SWEEP_FILES ?= files_sweeped_in_$(CORE_DEF_DOCUMENTROOT_NAME)

$(MODULE_SITEMAP_XML.DOCUMENTROOT_SWEEP_FILES) : $(MODULE_DOC.DOCUMENTROOT_ALL_HTML)
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(eval documentroot_files_to_sweep = $(call core_exec_cliPTR,core_cmd_select_files_to_sweep_in,CORE_DEF_DOCUMENTROOT))
	$(eval documentroot_sweep_files = $(call core_exec_cliPTR01,core_cmd_sweep_files,documentroot_files_to_sweep))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(CORE_DEF_DOCUMENTROOT_SITEMAP.XML) $(CORE_DEF_DOCUMENTROOT_SITEMAP.XML) [public_html/sitmap.xml]
# Arguments: None
# Does:      Creates a file referencing the HTML-files of the website
#            A search engine can use this file to navigate
#            and index the website
# ----------------------------------------------------------------------------
$(CORE_DEF_DOCUMENTROOT_SITEMAP.XML) : $(CORE_DEF_DOCUMENTROOT) $(MODULE_DOC.DOCUMENTROOT_ALL_HTML) $(MODULE_SITEMAP_XML.DOCUMENTROOT_SWEEP_FILES)
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(eval $(call module_sitemap_xml.func_write_sitemap_xml,$(CORE_DEF_DOCUMENTROOT),$(CORE_DEF_SITEMAP_WILDCARD),$@))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Function:  module_sitemap_xml.func_write_sitemap_xml
# Arguments: 1: A list of folder
#            2: A list off pattern
#            3: The filename of the SITEMAP_XML staring with CORE_DEF_DOCUMENTROOT
#               e.g. $(CORE_DEF_DOCUMENTROOT)/%<sitemap.xml>
#               e.g. public_html/sitemap.xml
# Returns:   Nothing
# Does:      Writes the SITEMAP_XML to the CORE_DEF_DOCUMENTROOT
#            The SITEMAP_XML is referenced in the ROBOTS_TXT
#            Fails silently if filename 3 ist not below CORE_DEF_DOCUMENTROOT
# ----------------------------------------------------------------------------
define module_sitemap_xml.func_write_sitemap_xml
$(module_trace.tr3)
$(if $3,
  $(file  > $3,$(MODULE_SITEMAP_XML.XML_HEAD))
  $(file >> $3,$(MODULE_SITEMAP_XML.URLSET_OPEN))
  $(if $2$1,
    $(call module_sitemap_xml.func_write_rsitemap,$1,$2,$3)
  )
  $(file >> $3,$(MODULE_SITEMAP_XML.URLSET_CLOSE))
)
endef

# ----------------------------------------------------------------------------
# Function:  module_sitemap_xml.func_write_rsitemap
# Arguments: 1: A list of folder
#            2: A list off pattern
#            3: The filename of the SITEMAP_XML staring with CORE_DEF_DOCUMENTROOT
#               e.g. $(CORE_DEF_DOCUMENTROOT)/%<sitemap.xml>
#               e.g. public_html/sitemap.xml
# Returns:   Nothing
# Does:      Writes the sitemap entrys of SITEMAP_XML to the CORE_DEF_DOCUMENTROOT
#            The SITEMAP_XML is referenced in the ROBOTS_TXT
# REM:       Removed !!! ~Fails silently if filename 3 ist not below CORE_DEF_DOCUMENTROOT~
#            replace $1,$2,$3 with $(MODULE_*_VAR) from above to reduce checks an complexity
# ----------------------------------------------------------------------------
define module_sitemap_xml.func_write_rsitemap
$(module_trace.tr3)
$(if $1$2,
  $(if $3,
    $(foreach d,$(wildcard $1*),
      $(call module_sitemap_xml.func_write_rsitemap,$d/,$2,$3)
      $(call module_sitemap_xml.func_write_sitemap_entry,$(filter $(subst *,%,$2),$d),$3)
    )
  )
)
endef

# ----------------------------------------------------------------------------
# Function:  module_sitemap_xml.func_write_sitemap_entry
# Arguments: 1: A folder or file name
#            2: A filename
# Returns:   Nothing
# Does:      ?
# ----------------------------------------------------------------------------
module_sitemap_xml.func_write_sitemap_entry = $(module_trace.tr2)$(if $1 ,$(if $2, $(file >> $2,$(MODULE_SITEMAP_XML.URL_OPEN)$(MODULE_SITEMAP_XML.LOC_OPEN)$(CORE_DEF_BASEURL)$(patsubst $(CORE_DEF_DOCUMENTROOT)%,%,$1)$(MODULE_SITEMAP_XML.LOC_CLOSE)$(MODULE_SITEMAP_XML.URL_CLOSE))))

endif # __module_sitemap_xml.included
