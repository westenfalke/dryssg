ifndef __module_md2html.included
__module_md2html.included = $(true)

#echo modules/md2html/md2html.mk|sha256sum
MOUDULE_MD2HTML.MODULE-ID := 8d041fef6aa9d87739ce82a83e8107896d1ad28398e3814cf5adc229989a890f
MOUDULE_MD2HTML.NAME = MD2HTML
MOUDULE_MD2HTML.SHORT_NAME = CONV
MOUDULE_MD2HTML.NAME := PANDOC# set to the name of the variable which containst the path to the binary
PANDOC ?= /usr/bin/pandoc
MOUDULE_MD2HTML.DATADIRNAME ?= .pandoc
MOUDULE_MD2HTML.TEMPLATE_DIR_NAME ?= templates
MOUDULE_MD2HTML.DATADIR ?= $(CORE_BASE_INSTALL_DIR)/$(MOUDULE_MD2HTML.DATADIRNAME)
MOUDULE_MD2HTML.TEMPLATEDIR ?= $(MOUDULE_MD2HTML.DATADIR)/$(MOUDULE_MD2HTML.TEMPLATE_DIR_NAME)
MOUDULE_MD2HTML.PARAM_DATADIR ?= --data-dir=$(MOUDULE_MD2HTML.DATADIR)
MOUDULE_MD2HTML.PARAM_FORMAT_FROM ?= --from=markdown
MOUDULE_MD2HTML.PARAM_FORMAT_TO ?= --to=html
MOUDULE_MD2HTML.PARAM_STANDALONE ?= --standalone
MOUDULE_MD2HTML.PARAM_INPUTFILE ?= $1
MOUDULE_MD2HTML.PARAM_OUTPUTFILE ?= --output=$2
MOUDULE_MD2HTML.DEFAULT_TEMPLATE_HTML_NAME ?= default.html
MOUDULE_MD2HTML.DEFAULT.HTML ?= $(MOUDULE_MD2HTML.DATADIR)/$(MOUDULE_MD2HTML.TEMPLATE_DIR_NAME)/$(MOUDULE_MD2HTML.DEFAULT_TEMPLATE_HTML_NAME)
MOUDULE_MD2HTML.TEMPLATE_HTML_NAME ?= $(MOUDULE_MD2HTML.DEFAULT_TEMPLATE_HTML_NAME)
MOUDULE_MD2HTML.PARAM_TEMPLATE_FILE ?= --template $(MOUDULE_MD2HTML.TEMPLATE_HTML_NAME)
MOUDULE_MD2HTML.RELPATHTODOCUMENTROOT = $(shell realpath --relative-to=$(dir $2) $(CORE_DEF_DOCUMENTROOT))
MOUDULE_MD2HTML.PARAM_DOCUMENTROOT = --variable=documentroot:$(MOUDULE_MD2HTML.RELPATHTODOCUMENTROOT)
MOUDULE_MD2HTML.METADATA_FILE_EXIST = $(if $1$,$(wildcard $(dir $1)$(CORE_DEF_METADATA.YAML)))
MOUDULE_MD2HTML.PARAM_METADATA_FILE = $(if $(MOUDULE_MD2HTML.METADATA_FILE_EXIST),--metadata-file=$(wildcard $(dir $1)$(CORE_DEF_METADATA.YAML)))
MOUDULE_MD2HTML.PARAM_METADATA_FILE_DEFAULT ?= --metadata-file=$(MODULE_RES.METADATA.YAML)
MOUDULE_MD2HTML.PARAM_AFTER_BODY ?= --include-after-body=$(MODULE_RES.DIR)/$(CORE_DEF_AFTER_BODY.HTML)
MOUDULE_MD2HTML.PARAM_CSS += --css=$(MOUDULE_MD2HTML.RELPATHTODOCUMENTROOT)/css/bulma-carousel.min.css
MOUDULE_MD2HTML.PARAM_CSS += --css=$(MOUDULE_MD2HTML.RELPATHTODOCUMENTROOT)/css/bulma.css

# ----------------------------------------------------------------------------
# Target:    $$(MOUDULE_MD2HTML.DEFAULT.HTML) $(MOUDULE_MD2HTML.DEFAULT.HTML) .pandoc/templates/default.html
# Arguments: None
# Does:      Creates default tempaltes
# ----------------------------------------------------------------------------
$(MOUDULE_MD2HTML.DEFAULT.HTML) :
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_create_folder_w_parent,$(dir $@)))
	[ -e $@ ] || pandoc --print-default-template=html5 | $(module_md2html.cmd_remove_script) > $@ 


# ----------------------------------------------------------------------------
# Target:    $$(MOUDULE_MD2HTML.DATADIR) $(MOUDULE_MD2HTML.DATADIR) .pandoc
# Arguments: None
# Does:      Creates the folder for CONC templates 
#            and (probably empty) default tempaltes
# ----------------------------------------------------------------------------
$(MOUDULE_MD2HTML.DATADIR) : $(MOUDULE_MD2HTML.DEFAULT.HTML)
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_create_folder_w_parent,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))	

# ----------------------------------------------------------------------------
# Function:  module_md2html.cmd_remove_script
# Arguments: None
# Returns:   A sed CLI CMD to remove a script tag from the 
#            original pandoc default.html template  
# Does:      replaces the <script> tag witout removing the <EOL> 
# REM:       As seen in pandoc-2.18-1-amd64 and
#            they are loaded via cdn (from CloudFlare) 
#            this has to be declared properly in your privacy policy
# ----------------------------------------------------------------------------
module_md2html.cmd_remove_script = sed -e 's/<\!--.*>//'  -e 's/<script src=.*//'  -e 's/.*]-->//'

# ----------------------------------------------------------------------------
# Function:  module_md2html.cmd_transform_md2html
# Arguments: 1: Infput filename (*.md in markdown format)
#            2. Output filename (*.html in HTML5)
# Returns:   Nothing
# Does:      ?
# REM:       The variable defined after $(MOUDULE_MD2HTML.NAME) will use $1 and $2
#            to deternin thier values
# ----------------------------------------------------------------------------
define module_md2html.cmd_transform_md2html
$(module_trace.tr2)$(value $(MOUDULE_MD2HTML.NAME)) $(MOUDULE_MD2HTML.PARAM_FORMAT_FROM) $(MOUDULE_MD2HTML.PARAM_FORMAT_TO) $(MOUDULE_MD2HTML.PARAM_STANDALONE) $(MOUDULE_MD2HTML.PARAM_CSS) $(MOUDULE_MD2HTML.PARAM_DATADIR) $(MOUDULE_MD2HTML.PARAM_TEMPLATE_FILE) $(MOUDULE_MD2HTML.PARAM_DOCUMENTROOT) $(MOUDULE_MD2HTML.PARAM_INPUTFILE) $(MOUDULE_MD2HTML.PARAM_METADATA_FILE) $(MOUDULE_MD2HTML.PARAM_METADATA_FILE_DEFAULT) $(MOUDULE_MD2HTML.PARAM_AFTER_BODY) $(MOUDULE_MD2HTML.PARAM_OUTPUTFILE)
endef

endif # __module_md2html.included
