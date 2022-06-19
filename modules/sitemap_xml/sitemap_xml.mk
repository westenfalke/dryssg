ifndef __gmswe_sitemap_xml_included
__gmswe_sitemap_xml_included = $(true)


SITEMAP.XML  ?= sitemap.xml
DOCUMENTROOT_SITEMAP.XML ?= $(DOCUMENTROOT)/$(SITEMAP.XML)
SITEMAP_WILDCARD ?= *.html
SITEMAP_BASEURL_PORT ?=
BASEURL      ?= http://localhost$(SITEMAP_BASEURL_PORT)

XML_HEAD     ?= <?xml version="1.0" encoding="UTF-8"?>
URLSET_OPEN  ?= <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
URL_OPEN     ?= <url>
LOC_OPEN     ?= <loc>
LOC_CLOSE    ?= </loc>
URL_CLOSE    ?= </url>
URLSET_CLOSE ?= </urlset>

$(eval DOCUMENTROOT_SWEEP_FILES ?= files_sweeped_in_$(DOCUMENTROOT))

$(DOCUMENTROOT_SWEEP_FILES) : $(DOCUMENTROOT_ALL_HTML)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(eval documentroot_files_to_sweep = $(call exec_cliPTR,cmd_select_files_to_sweep_in,DOCUMENTROOT))
	$(eval documentroot_sweep_files = $(call exec_cliPTR01,cmd_sweep_files,documentroot_files_to_sweep))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Target:    $$(DOCUMENTROOT_SITEMAP.XML) $(DOCUMENTROOT_SITEMAP.XML) [public_html/sitmap.xml]
# Arguments: None
# Does:      Creates a file referencing the HTML-files of the website
#            A search engine can use this file to navigate
#            and index the website
# ----------------------------------------------------------------------------
$(DOCUMENTROOT_SITEMAP.XML) : $(DOCUMENTROOT_ALL_HTML) $(DOCUMENTROOT_SWEEP_FILES)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(eval $(call func_write_sitemap_xml,$(DOCUMENTROOT),$(SITEMAP_WILDCARD),$@))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

# ----------------------------------------------------------------------------
# Function:  func_write_sitemap_xml
# Arguments: 1: A list of folder
#            2: A list off pattern
#            3: The filename of the SITEMAP_XML staring with DOCUMENTROOT
#               e.g. $(DOCUMENTROOT)/%<sitemap.xml>
#               e.g. public_html/sitemap.xml
# Returns:   Nothing
# Does:      Writes the SITEMAP_XML to the DOCUMENTROOT
#            The SITEMAP_XML is referenced in the ROBOTS_TXT
#            Fails silently if filename 3 ist not below DOCUMENTROOT
# ----------------------------------------------------------------------------
define func_write_sitemap_xml
$(__gmswe_tr3)
$(if $(call seq,$(call first,$(call split,/,$3)),$(DOCUMENTROOT)),
  $(file  > $3,$(XML_HEAD))
  $(file >> $3,$(URLSET_OPEN))
  $(if $2$1,
    $(call func_write_rsitemap,$1,$2,$3)
  )
  $(file >> $3,$(URLSET_CLOSE))
)
endef

# ----------------------------------------------------------------------------
# Function:  func_write_rsitemap
# Arguments: 1: A list of folder
#            2: A list off pattern
#            3: The filename of the SITEMAP_XML staring with DOCUMENTROOT
#               e.g. $(DOCUMENTROOT)/%<sitemap.xml>
#               e.g. public_html/sitemap.xml
# Returns:   Nothing
# Does:      Writes the sitemap entrys of SITEMAP_XML to the DOCUMENTROOT
#            The SITEMAP_XML is referenced in the ROBOTS_TXT
#            Fails silently if filename 3 ist not below DOCUMENTROOT
# ----------------------------------------------------------------------------
define func_write_rsitemap
$(__gmswe_tr3)
$(if $1$2,
  $(if $(call seq,$(call first,$(call split,/,$3)),$(DOCUMENTROOT)),
    $(foreach d,$(wildcard $1*),
      $(call func_write_rsitemap,$d/,$2,$3)
      $(call func_write_sitemap_entry,$(filter $(subst *,%,$2),$d),$3)
    )
  )
)
endef

# ----------------------------------------------------------------------------
# Function:  func_write_sitemap_entry
# Arguments: 1: A folder or file name
#            2: A filename
# Returns:   Nothing
# Does:      ?
# ----------------------------------------------------------------------------
func_write_sitemap_entry = $(__gmswe_tr2)$(if $1 ,$(if $2, $(file >> $2,$(URL_OPEN)$(LOC_OPEN)$(BASEURL)$(patsubst $(DOCUMENTROOT)%,%,$1)$(LOC_CLOSE)$(URL_CLOSE))))

endif # __gmswe_sitemap_xml_included
