ifndef __gmswe_markdown2html_included
__gmswe_markdown2html_included = $(true)

#DOCUMENTROOT ?= public_html
PANDOC ?= /usr/bin/pandoc
CONV_NAME := PANDOC
CONV_FORMAT_FROM ?= --from=markdown
CONV_FORMAT_TO ?= --to=html5
CONV_STANDALONE ?= --standalone
CONV_INPUTFILE ?= $1
CONV_OUTPUTFILE ?= --output=$2
CONV_TEMPLATE_FILE ?=
RELPATHTODOCUMENTROOT = $(shell realpath --relative-to=$(dir $2) $(DOCUMENTROOT))
CONV_DOCUMENTROOT = --variable=documentroot:$(RELPATHTODOCUMENTROOT)
CONV_METADATA_FILE_FOO = $(if $1,$(wildcard $(dir $1)metadata.yaml))
CONV_METADATA_FILE = $(if $(CONV_METADATA_FILE_FOO),--metadata-file=$(wildcard $(dir $1)metadata.yaml))
# ----------------------------------------------------------------------------
# Function:  cmd_transform_md2html
# Arguments: 1: Infput filename (*.md in markdown format)
#            2. Output filename (*.html in HTML5)
# Returns:   Nothing
# Does:      ?
# ----------------------------------------------------------------------------
define cmd_transform_md2html
$(__gmswe_tr2)$(value $(CONV_NAME)) $(CONV_FORMAT_FROM) $(CONV_FORMAT_TO) $(CONV_STANDALONE) $(CONV_TEMPLATE_FILE) $(CONV_DOCUMENTROOT) $(CONV_INPUTFILE) $(CONV_METADATA_FILE) $(CONV_OUTPUTFILE)
endef

endif # __gmswe_markdown2html_included
