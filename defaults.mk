ifndef __gmswe_defaults_included
include config.mk
__gmswe_defaults_included := $(true)

# set to $(true) to exclude project.mk
__gmswe_project_included := $(false)

#GMSWE_DEBUG  ?= $(true)
#GMSWE_DOC    ?= $(true)
#GMSWE_LOG    ?= $(true)
#GMSWE_REPORT ?= $(true)
#GMSWE_TEST   ?= $(true)

FIND         ?= find
USAGE        ?= usage
WEBSITE      ?= website
CLEAN        ?= clean
DOCUMENTS    ?= documents
BASEURL      ?= http://localhost
### is activated if GMSWE_TEST = $(true)
DOCUMENTROOT ?= public_html
$(eval CLEAN_DOCUMENTROOT = $(CLEAN)_$(DOCUMENTROOT))
INDEX.HTML   ?= index.html
$(eval DOCUMENTROOT_INDEX.HTML = $(DOCUMENTROOT)/$(INDEX.HTML))
INDEX.MD     ?= index.md
$(eval DOCUMENTS_INDEX.MD = $(DOCUMENTS)/$(INDEX.MD))
ROBOTS.TXT   ?= robots.txt
$(eval DOCUMENTROOT_ROBOTS.TXT = $(DOCUMENTROOT)/$(ROBOTS.TXT))
SITEMAP.XML  ?= sitmap.xml
$(eval DOCUMENTROOT_SITEMAP.XML = $(DOCUMENTROOT)/$(SITEMAP.XML))
SITEMAP_WILDCARD := *#.html
SITEMAP_XML_HEAD     ?= <?xml version="1.0" encoding="UTF-8"?>
SITEMAP_URLSET_OPEN  ?= <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
SITEMAP_URL_OPEN     ?= <url>
SITEMAP_LOC_OPEN     ?= <loc>
SITEMAP_LOC_CONTENT  ?= $(BASEURL)/$1
SITEMAP_LOC_CLOSE    ?= </loc>
SITEMAP_URL_CLOSE    ?= </url>
SITEMAP_URLSET_CLOSE ?= </urlset>

endif #__gmswe_defaults_included
