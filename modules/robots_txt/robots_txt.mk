ifndef _module_robots_txt.included
_module_robots_txt.included = $(true)

# ----------------------------------------------------------------------------
# Target:    $$(CORE_DEF_DOCUMENTROOT_ROBOTS.TXT) $(CORE_DEF_DOCUMENTROOT_ROBOTS.TXT) [robots.txt}
# Arguments: None
# Does:      Provides a is static file in order to point
#            search engins to the sitmap.xml
# ----------------------------------------------------------------------------
$(CORE_DEF_DOCUMENTROOT_ROBOTS.TXT) : $(CORE_DEF_DOCUMENTROOT_SITEMAP.XML)
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(call module_robots_txt.func_create_robots_txt,$<,$@)
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))


# ----------------------------------------------------------------------------
# Function:  module_robots_txt.func_create_robots_txt
# Arguments: 1: File name of sitemap ink. CORE_DEF_DOCUMENTROOT
#            like $(CORE_DEF_DOCUMENTROOT)/%<sitemap.xml>
#            e.g. '''public_htm/sitemap.xml'''
#            2: File name of robots.txt ink. CORE_DEF_DOCUMENTROOT
#            like $(CORE_DEF_DOCUMENTROOT)/robots.txt
#            e.g. '''public_htm/robots.txt'''
# Returns:   Nothing
# Does:      
# ----------------------------------------------------------------------------
define module_robots_txt.func_create_robots_txt
$(module_trace.tr2)
$(if $1,
$(if $2,
$(file > $2,# Thank you for reading this far.
User-agent: *
Allow: *
Sitemap: $(CORE_DEF_BASEURL)/$(patsubst $(CORE_DEF_DOCUMENTROOT)/%,%,$1)
)))
endef

endif # _module_robots_txt.included
