ifndef __gmswe_markdown2html_included
__gmswe_markdown2html_included = $(true)

CONV_NAME := PANDOC
PANDOC ?= /usr/bin/pandoc
CONV_DATADIRNAME ?= --data-dir=$(INSTALLDIR)/.pandoc
CONV_FORMAT_FROM ?= --from=markdown
CONV_FORMAT_TO ?= --to=html5
CONV_STANDALONE ?= --standalone
CONV_INPUTFILE ?= $1
CONV_OUTPUTFILE ?= --output=$2
CONV_TEMPLATE_FILE ?= --template swelpe.html
RELPATHTODOCUMENTROOT = $(shell realpath --relative-to=$(dir $2) $(DOCUMENTROOT))
CONV_DOCUMENTROOT = --variable=documentroot:$(RELPATHTODOCUMENTROOT)
CONV_METADATA_FILE_FOO = $(if $1,$(wildcard $(dir $1)metadata.yaml))
CONV_METADATA_FILE = $(if $(CONV_METADATA_FILE_FOO),--metadata-file=$(wildcard $(dir $1)metadata.yaml))
RESOURCESDIR ?= $(INSTALLDIR)/resources
CONV_METADATA_FILE_DEFAULT ?= --metadata-file=$(RESOURCESDIR)/metadata.yaml
CONV_AFTER_BODY ?= --include-after-body=$(RESOURCESDIR)/after-body.html
CONV_CSS += --css=$(RELPATHTODOCUMENTROOT)/css/bulma-carousel.min.css
CONV_CSS += --css=$(RELPATHTODOCUMENTROOT)/css/bulma.css

# ----------------------------------------------------------------------------
# Function:  cmd_transform_md2html
# Arguments: 1: Infput filename (*.md in markdown format)
#            2. Output filename (*.html in HTML5)
# Returns:   Nothing
# Does:      ?
# ----------------------------------------------------------------------------
define cmd_transform_md2html
$(__gmswe_tr2)$(value $(CONV_NAME)) $(CONV_FORMAT_FROM) $(CONV_FORMAT_TO) $(CONV_STANDALONE) $(CONV_CSS) $(CONV_DATADIRNAME) $(CONV_TEMPLATE_FILE) $(CONV_DOCUMENTROOT) $(CONV_INPUTFILE) $(CONV_METADATA_FILE) $(CONV_METADATA_FILE_DEFAULT) $(CONV_AFTER_BODY) $(CONV_OUTPUTFILE)
endef

endif # __gmswe_markdown2html_included
