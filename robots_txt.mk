ifndef __gmswe_robots_txt_included
__gmswe_robots_txt_included = $(true)

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
# Function:  func_robots_txt
# Arguments: 1: A list of folder
#            2: A list off pattern
#            3: A filename
# Returns:   Nothing
# Does:      ?
# ----------------------------------------------------------------------------
define func_create_robots_txt
$(__gmswe_tr1)
$(if $1,
  $(file > $1,
User-agent: *
Allow: *
Sitemap: $(BASEURL)/$(patsubst $(DOCUMENTROOT)/%,%,$1)
  )
)
endef

endif # __gmswe_robots_txt_included
