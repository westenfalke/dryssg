ifndef __gmswe_sitemap_xml_included
__gmswe_sitemap_xml_included = $(true)

SITEMAP_WILDCARD ?= *.html
BASEURL      ?= http://localhost
XML_HEAD     ?= <?xml version="1.0" encoding="UTF-8"?>
URLSET_OPEN  ?= <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
URL_OPEN     ?= <url>
LOC_OPEN     ?= <loc>
LOC_CLOSE    ?= </loc>
URL_CLOSE    ?= </url>
URLSET_CLOSE ?= </urlset>

# ----------------------------------------------------------------------------
# Function:  func_crate_sitemap_xml
# Arguments: 1: A list of folder
#            2: A list off pattern
#            3: A filename
# Returns:   Nothing
# Does:      ?
# ----------------------------------------------------------------------------
define func_create_sitemap_xml
$(__gmswe_tr3)
$(if $3,
  $(file >> $3,$(XML_HEAD))
  $(file >> $3,$(URLSET_OPEN))
  $(if $2$1,
    $(call func_create_rsitemap,$1,$2,$3)
  )
  $(file >> $3,$(URLSET_CLOSE))
)
endef

# ----------------------------------------------------------------------------
# Function:  func_create_rsitemap
# Arguments: 1: A list of folder
#            2: A list off pattern
#            3: A filename
# Returns:   Nothing
# Does:      ?
# ----------------------------------------------------------------------------
define func_create_rsitemap
$(__gmswe_tr3)
$(if $1$2,
  $(if $3,
    $(foreach d,$(wildcard $1*),
      $(call func_create_rsitemap,$d/,$2,$3)
      $(call sitemap_entry,$(filter $(subst *,%,$2),$d),$3)
    )
  )
)
endef

# ----------------------------------------------------------------------------
# Function:  sitemap_entry
# Arguments: 1: A folder or file name
#            2: A filename
# Returns:   Nothing
# Does:      ?
# ----------------------------------------------------------------------------
sitemap_entry = $(__gmswe_tr2)$(if $1 ,$(if $2, $(file >> $2,$(URL_OPEN)$(LOC_OPEN)$(BASEURL)$(patsubst $(DOCUMENTROOT)%,%,$1)$(LOC_CLOSE)$(URL_CLOSE))))

endif # __gmswe_sitemap_xml_included
