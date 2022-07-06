ifndef __module_menu_card.included
include modules/md2html/md2html.mk
__module_menu_card.included = $(true)

MODULE_MENU_CARD.MODUL-LOC = modules/menu_card
MODULE_MENU_CARD.FILE_NAME := menu_card.mk
#echo modules/menu_card/menu_card.mk|sha256sum
MODULE_MENU_CARD.MODULE-ID := fc0eec4732ec4832bac6f6b635e4a23277b799e514a1dbf333b24559642dcea8
MODULE_MENU_CARD.NAME := MENU_CARD 
MODULE_MENU_CARD.SHORT_NAME := MC
MODULE_MENU_CARD.TEMPLATE_HTML_NAME ?=  menu_card_partial.html
MODULE_MENU_CARD.TEMPLATE_HTML ?= $(MOUDULE_MD2HTML.TEMPLATEDIR)/$(MODULE_MENU_CARD.TEMPLATE_HTML_NAME)
MODULE_MENU_CARD.DIR_NAME ?= menu_card
MODULE_MENU_CARD.DIR ?= $(MODULE_DOC.DOCUMENTS)/$(MODULE_MENU_CARD.DIR_NAME)
MODULE_MENU_CARD.METDATDTA_YAML ?= $(MODULE_MENU_CARD.DIR)/$(CORE_DEF_METADATA.YAML)
MODULE_MENU_CARD.INDEX_MD ?= $(MODULE_MENU_CARD.DIR)/$(CORE_DEF_INDEX.MD)
MODULE_MENU_CARD.DEPENDS_ON := modules/markdown2html/markdown2html.mk modules/trace/trace.mk modules/debug/debug.mk $(MODULE_MENU_CARD.TEMPLATE_HTML_NAME) 


$(MODULE_MENU_CARD.INDEX_MD) :
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_create_folder_w_parent,$(dir $@)))
	$(info $(shell cp --no-clobber $(__module_log.log_p_copy) $(MODULE_MENU_CARD.MODUL-LOC)/$(CORE_DEF_INDEX.MD) $(MODULE_MENU_CARD.INDEX_MD)))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))

$(MODULE_MENU_CARD.METDATDTA_YAML) :
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_create_folder_w_parent,$(dir $@)))
	$(info $(shell cp --no-clobber $(__module_log.log_p_copy) $(MODULE_MENU_CARD.MODUL-LOC)/$(CORE_DEF_METADATA.YAML) $(MODULE_MENU_CARD.METDATDTA_YAML)))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))

$(MODULE_MENU_CARD.TEMPLATE_HTML) :
	$(__module_dbg.tnp)
	$(info $(call core_exec_cliVAL01,core_cmd_invalidate_target,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_create_folder_w_parent,$(dir $@)))
	$(info $(shell cp --no-clobber $(__module_log.log_p_copy) $(MODULE_MENU_CARD.MODUL-LOC)/$(MODULE_MENU_CARD.TEMPLATE_HTML_NAME) $(MODULE_MENU_CARD.TEMPLATE_HTML)))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))


# ----------------------------------------------------------------------------
# Target:    $$(MODULE_MENU_CARD.DIR)) $(MODULE_MENU_CARD.DIR)) [documents/menu_card]
# Arguments: None
# Does:      ?
# ----------------------------------------------------------------------------
$(MODULE_MENU_CARD.DIR) : $(MODULE_MENU_CARD.TEMPLATE_HTML) $(MODULE_MENU_CARD.METDATDTA_YAML) $(MODULE_MENU_CARD.INDEX_MD)
	$(__module_dbg.tnp)	
	$(info $(call core_exec_cliVAL01,core_cmd_create_folder_w_parent,$@))
	$(info $(call core_exec_cliVAL01,core_cmd_mark_target_done,$@))    

# ----------------------------------------------------------------------------
# Function:  func_create_menu_card
# Arguments: None
# Returns:   Nothing
# Does:      ?
# ----------------------------------------------------------------------------
define func_create_menu_card
$(module_trace.tr3)
endef

endif # __module_menu_card.included
