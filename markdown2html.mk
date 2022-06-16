ifndef __gmswe_markdown2html_included
__gmswe_markdown2html_included = $(true)

DOCUMENTROOT ?= public_html
PANDOC ?= /usr/bin/pandoc
CONV_NAME := PANDOC
CONV_FORMAT_FROM ?= --from=markdown
CONV_FORMAT_TO ?= --to=html5
CONV_STANDALONE ?= --standalone
CONV_INPUTFILE ?= $1
CONV_OUTPUTFILE ?= --output=$2
CONV_TEMPLATE_FILE ?=
CONV_DOCUMENTROOT ?= --variable=docroot:$(DOCROOT)
CONV_DOCROOT ?= ./

# ----------------------------------------------------------------------------
# Function:  cmd_transform_md2html
# Arguments: 1: File name of sitemap ink. DOCUMENTROOT
#            like $(DOCUMENTROOT)/%<sitemap.xml>
#            e.g. '''public_htm/sitemap.xml'''
#            2: File name of robots.txt ink. DOCUMENTROOT
#            like $(DOCUMENTROOT)/robots.txt
#            e.g. '''public_htm/robots.txt'''
# Returns:   Nothing
# Does:      ?
# ----------------------------------------------------------------------------
define cmd_transform_md2html
$(__gmswe_tr2)$(value $(CONV_NAME)) $(CONV_FORMAT_FROM) $(CONV_FORMAT_TO) $(CONV_STANDALONE) $(CONV_TEMPLATE_FILE) $(CONV_DOCUMENTROOT) $(CONV_INPUTFILE) $(CONV_OUTPUTFILE)
endef

endif # __gmswe_markdown2html_included
