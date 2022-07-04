ifndef __gmswe_markdown2html_included
__gmswe_markdown2html_included = $(true)

CONV_NAME := PANDOC# set to the name of the variable which containst the path to the binary
PANDOC ?= /usr/bin/pandoc
CONV_DATADIRNAME ?= .pandoc
CONC_TEMPLATE_DIR_NAME ?= templates
CONV_DATADIR ?= $(INSTALLDIR)/$(CONV_DATADIRNAME)
CONV_TEMPLATEDIR ?= (CONV_DATADIR)/$(CONC_TEMPLATE_DIR_NAME)
CONV_PARAM_DATADIR ?= --data-dir=$(CONV_DATADIR)
CONV_PARAM_FORMAT_FROM ?= --from=markdown
CONV_PARAM_FORMAT_TO ?= --to=html
CONV_PARAM_STANDALONE ?= --standalone
CONV_PARAM_INPUTFILE ?= $1
CONV_PARAM_OUTPUTFILE ?= --output=$2
CONV_DEFAULT_TEMPLATE_HTML_NAME ?= default.html
CONV_DEFAULT.HTML ?= $(CONV_DATADIR)/$(CONC_TEMPLATE_DIR_NAME)/$(CONV_DEFAULT_TEMPLATE_HTML_NAME)
CONV_TEMPLATE_HTML_NAME ?= $(CONV_DEFAULT_TEMPLATE_HTML_NAME)
CONV_PARAM_TEMPLATE_FILE ?= --template $(CONV_TEMPLATE_HTML_NAME)
CONV_RELPATHTODOCUMENTROOT = $(shell realpath --relative-to=$(dir $2) $(DOCUMENTROOT))
CONV_PARAM_DOCUMENTROOT = --variable=documentroot:$(CONV_RELPATHTODOCUMENTROOT)
CONV_METADATA_FILE_EXIST = $(if $1$,$(wildcard $(dir $1)$(METADATA.YAML)))
CONV_PARAM_METADATA_FILE = $(if $(CONV_METADATA_FILE_EXIST),--metadata-file=$(wildcard $(dir $1)$(METADATA.YAML)))
CONV_PARAM_METADATA_FILE_DEFAULT ?= --metadata-file=$(RESOURCES_METADATA.YAML)
CONV_PARAM_AFTER_BODY ?= --include-after-body=$(RESOURCES_DIR)/$(AFTER_BODY.HTML)
CONV_PARAM_CSS += --css=$(CONV_RELPATHTODOCUMENTROOT)/css/bulma-carousel.min.css
CONV_PARAM_CSS += --css=$(CONV_RELPATHTODOCUMENTROOT)/css/bulma.css

# ----------------------------------------------------------------------------
# Target:    $$(DEFAULT.HTML) $(DEFAULT.HTML) .pandoc
# Arguments: None
# Does:      Creates default tempaltes
# ----------------------------------------------------------------------------
$(CONV_DEFAULT.HTML) :
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$(dir $@)))
	[ -e $@ ] || pandoc --print-default-template=html5 | $(conv_cmd_remove_script) > $@ 


# ----------------------------------------------------------------------------
# Target:    $$(CONV_DATADIR) $(CONV_DATADIR) .pandoc
# Arguments: None
# Does:      Creates the folder for CONC templates 
#            and (probably empty) default tempaltes
# ----------------------------------------------------------------------------
$(CONV_DATADIR) : $(CONV_DEFAULT.HTML)
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$@))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))	

# ----------------------------------------------------------------------------
# Function:  conv_cmd_remove_script
# Arguments: None
# Returns:   A sed CLI CMD to remove a script tag from the 
#            original pandoc default.html template  
# Does:      replaces the <script> tag witout removing the <EOL> 
# REM:       As seen in pandoc-2.18-1-amd64 and
#            they are loaded via cdn (from CloudFlare) 
#            this has to be declared properly in your privacy policy
# ----------------------------------------------------------------------------
conv_cmd_remove_script = sed -e 's/<\!--.*>//'  -e 's/<script src=.*//'  -e 's/.*]-->//'

# ----------------------------------------------------------------------------
# Function:  conv_cmd_transform_md2html
# Arguments: 1: Infput filename (*.md in markdown format)
#            2. Output filename (*.html in HTML5)
# Returns:   Nothing
# Does:      ?
# REM:       The variable defined after $(CONV_NAME) will use $1 and $2
#            to deternin thier values
# ----------------------------------------------------------------------------
define conv_cmd_transform_md2html
$(__gmswe_tr2)$(value $(CONV_NAME)) $(CONV_PARAM_FORMAT_FROM) $(CONV_PARAM_FORMAT_TO) $(CONV_PARAM_STANDALONE) $(CONV_PARAM_CSS) $(CONV_PARAM_DATADIR) $(CONV_PARAM_TEMPLATE_FILE) $(CONV_PARAM_DOCUMENTROOT) $(CONV_PARAM_INPUTFILE) $(CONV_PARAM_METADATA_FILE) $(CONV_PARAM_METADATA_FILE_DEFAULT) $(CONV_PARAM_AFTER_BODY) $(CONV_PARAM_OUTPUTFILE)
endef

endif # __gmswe_markdown2html_included
