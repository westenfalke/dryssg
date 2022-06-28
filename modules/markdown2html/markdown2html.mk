ifndef __gmswe_markdown2html_included
__gmswe_markdown2html_included = $(true)

CONV_NAME := PANDOC
PANDOC ?= /usr/bin/pandoc
CONV_DATADIRNAME ?= .pandoc
CONV_DATADIR ?= $(INSTALLDIR)/$(CONV_DATADIRNAME)
CONV_PARAM_DATADIR ?= --data-dir=$(CONV_DATADIR)
CONV_FORMAT_FROM ?= --from=markdown
CONV_FORMAT_TO ?= --to=html5
CONV_STANDALONE ?= --standalone
CONV_INPUTFILE ?= $1
CONV_OUTPUTFILE ?= --output=$2
CONV_DEFAULT.HTML ?= $(CONV_DATADIR)/tempaltes/default.html
CONV_TEMPLATE_FILE ?= --template $(CONV_DEFAULT.HTML)
CONV_RELPATHTODOCUMENTROOT = $(shell realpath --relative-to=$(dir $2) $(DOCUMENTROOT))
CONV_PARAM_DOCUMENTROOT = --variable=documentroot:$(CONV_RELPATHTODOCUMENTROOT)
CONV_METADATA_FILE_EXIST = $(if $1$,$(wildcard $(dir $1)metadata.yaml))
CONV_PARAM_METADATA_FILE = $(if $(CONV_METADATA_FILE_EXIST),--metadata-file=$(wildcard $(dir $1)metadata.yaml))
CONV_PARAM_METADATA_FILE_DEFAULT ?= --metadata-file=$(RESOURCES_DIR)/metadata.yaml
CONV_AFTER_BODY ?= --include-after-body=$(RESOURCES_DIR)/after-body.html
CONV_CSS += --css=$(CONV_RELPATHTODOCUMENTROOT)/css/bulma-carousel.min.css
CONV_CSS += --css=$(CONV_RELPATHTODOCUMENTROOT)/css/bulma.css

# ----------------------------------------------------------------------------
# Target:    $$(DEFAULT.HTML) $(DEFAULT.HTML) .pandoc
# Arguments: None
# Does:      Cretes (probably empty) default tempaltes
# ----------------------------------------------------------------------------
$(CONV_DEFAULT.HTML) : $(CONV_DATADIR)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$(dir $@)))
	[ -e $@ ] || pandoc --print-default-template=html5 | sed -e 's/<\!--.*>//'  -e 's/<script src=.*//'  -e 's/.*]-->//' > $@ 

# ----------------------------------------------------------------------------
# Target:    $$(CONV_DATADIR) $(CONV_DATADIR) .pandoc
# Arguments: None
# Does:      Creates the folder for CONC templates 
#            and (probably empty) default tempaltes
# ----------------------------------------------------------------------------
$(CONV_DATADIR) : 
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$@))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))	
	
# ----------------------------------------------------------------------------
# Function:  cmd_transform_md2html
# Arguments: 1: Infput filename (*.md in markdown format)
#            2. Output filename (*.html in HTML5)
# Returns:   Nothing
# Does:      ?
# ----------------------------------------------------------------------------
define cmd_transform_md2html
$(__gmswe_tr2)$(value $(CONV_NAME)) $(CONV_FORMAT_FROM) $(CONV_FORMAT_TO) $(CONV_STANDALONE) $(CONV_CSS) $(CONV_PARAM_DATADIR) $(CONV_TEMPLATE_FILE) $(CONV_PARAM_DOCUMENTROOT) $(CONV_INPUTFILE) $(CONV_PARAM_METADATA_FILE) $(CONV_PARAM_METADATA_FILE_DEFAULT) $(CONV_AFTER_BODY) $(CONV_OUTPUTFILE)
endef

endif # __gmswe_markdown2html_included
