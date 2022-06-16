ifndef __gmswe_robots_txt_included
__gmswe_robots_txt_included = $(true)

BASEURL      ?= http:\\localhost
DOCUMENTROOT ?= public_html

# ----------------------------------------------------------------------------
# Function:  func_robots_txt
# Arguments: 1: File name of sitemap ink. DOCUMENTROOT
#            like $(DOCUMENTROOT)/%<sitemap.xml>
#            e.g. '''public_htm/sitemap.xml'''
#            2: File name of robots.txt ink. DOCUMENTROOT
#            like $(DOCUMENTROOT)/robots.txt
#            e.g. '''public_htm/robots.txt'''
# Returns:   Nothing
# Does:      
# ----------------------------------------------------------------------------
define func_create_robots_txt
$(__gmswe_tr1)
$(if $(call seq,$(call first,$(call split,/,$1)),$(DOCUMENTROOT)),
$(if $(call seq,$(DOCUMENTROOT_ROBOTS.TXT),$2),
$(file > $2,# Thank you for reading this far.
User-agent: *
Allow: *
Sitemap: $(BASEURL)/$(patsubst $(DOCUMENTROOT)/%,%,$1)
)))
endef

endif # __gmswe_robots_txt_included
