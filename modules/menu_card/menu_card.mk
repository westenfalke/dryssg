ifndef __gmswe_menu_card_included
include modules/markdown2html/markdown2html.mk
__gmswe_menu_card_included = $(true)

MENU_CARD.MODUL-LOC = modules/menu_card
MENU_CARD.FILE_NAME := menu_card.mk
#echo modules/menu_card/menu_card.mk|sha256sum
MENU_CARD.MODULE-ID := fc0eec4732ec4832bac6f6b635e4a23277b799e514a1dbf333b24559642dcea8
MENU_CARD.NAME := MENU_CARD 
MENU_CARD.SHORT_NAME := MC
MENU_CARD_TEMPLATE_HTML_NAME ?=  menu_card_partial.html
MENU_CARD_TEMPLATE_HTML ?= $(CONV_TEMPLATEDIR)/$(MENU_CARD_TEMPLATE_HTML_NAME)
MENU_CARD_DIR_NAME ?= menu_card
MENU_CARD_DIR ?= $(DOCUMENTS)/$(MENU_CARD_DIR_NAME)
MENU_CARD_METDATDTA_YAML ?= $(MENU_CARD_DIR)/$(METADATA.YAML)
MENU_CARD_INDEX_MD ?= $(MENU_CARD_DIR)/$(INDEX.MD)
MENU_CARD.DEPENDS_ON := modules/markdown2html/markdown2html.mk modules/trace/trace.mk modules/debug/debug.mk $(MENU_CARD_TEMPLATE_HTML_NAME) 





$(MENU_CARD_INDEX_MD) :
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$(dir $@)))
	$(info $(shell cp --no-clobber $(__gmswe_log_p_copy) $(MENU_CARD.MODUL-LOC)/$(INDEX.MD) $(MENU_CARD_INDEX_MD)))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

$(MENU_CARD_METDATDTA_YAML) :
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$(dir $@)))
	$(info $(shell cp --no-clobber $(__gmswe_log_p_copy) $(MENU_CARD.MODUL-LOC)/$(METADATA.YAML) $(MENU_CARD_METDATDTA_YAML)))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))

$(MENU_CARD_TEMPLATE_HTML) :
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$(dir $@)))
	$(info $(shell cp --no-clobber $(__gmswe_log_p_copy) $(MENU_CARD.MODUL-LOC)/$(MENU_CARD_TEMPLATE_HTML_NAME) $(MENU_CARD_TEMPLATE_HTML)))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))


# ----------------------------------------------------------------------------
# Target:    $$(MENU_CARD_DIR)) $(MENU_CARD_DIR)) [documents/menu_card]
# Arguments: None
# Does:      ?
# ----------------------------------------------------------------------------
$(MENU_CARD_DIR) : $(MENU_CARD_TEMPLATE_HTML) $(MENU_CARD_METDATDTA_YAML) $(MENU_CARD_INDEX_MD)
	$(__gmswe_dbg_tnp)	
	$(info $(call exec_cliVAL01,cmd_create_folder_w_parent,$@))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))    

# ----------------------------------------------------------------------------
# Function:  func_create_menu_card
# Arguments: None
# Returns:   Nothing
# Does:      ?
# ----------------------------------------------------------------------------
define func_create_menu_card
$(__gmswe_tr3)
endef

endif # __gmswe_menu_card_included
