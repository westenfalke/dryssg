ifndef __gmswe_menu_card_included
include modules/markdown2html/markdown2html.mk
__gmswe_menu_card_included = $(true)

#echo modules/menu_card/menu_card.mk|sha256sum
MENU_CARD.MODULE-ID := fc0eec4732ec4832bac6f6b635e4a23277b799e514a1dbf333b24559642dcea8
MENU_CARD.NAME := MENU_CARD 
MENU_CARD.SHORT_NAME := MC
MENU_CARD_TEMPLATE_HTML_NAME ?=  menu_card_partial.html
MENU_CARD_TEMPLATE_HTML ?= $(CONV_TEMPLATEDIR)/$(MENU_CARD_TEMPLATE_HTML_NAME)
MENU_CARD_DIR_NAME ?= menu_card
MENU_CARD_DIR ?= $(DOCUMENTS)/$(MENU_CARD_DIR_NAME)
MENU_CARD.DEPENDS_ON := modules/markdown2html/markdown2html.mk modules/trace/trace.mk modules/debug/debug.mk $(MENU_CARD_TEMPLATE_HTML_NAME) 

$(MENU_CARD_TEMPLATE_HTML) :
	$(__gmswe_dbg_tnp)
	$(info $(call exec_cliVAL01,cmd_invalidate_target,$@))
	[ -e $@ ] || $(file > $@,$(mc_get_partial_html))
	$(info $(call exec_cliVAL01,cmd_mark_target_done,$@))


# ----------------------------------------------------------------------------
# Target:    $$(MENU_CARD_DIR)) $(MENU_CARD_DIR)) [documents/menu_card]
# Arguments: None
# Does:      ?
# ----------------------------------------------------------------------------
$(MENU_CARD_DIR) : $(MENU_CARD_TEMPLATE_HTML)
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

define mc_get_partial_html
$(__gmswe_tr0)
<!-- $(MENU_CARD_TEMPLATE_HTML_NAME) >>> -->
<div class="panel is-secondary">
    <ul class="container">
        $for(menue)$
        $if(it.sectiontitle)$
        <li class="column panel-heading has-text-centered">
            $it.sectiontitle$
        </li>
        $else$
        <li class="columns is-gapless panel-block message">
        <div class="column has-text-left "> <span class="is-capitalized has-text-weight-semibold"> $it.title$ </span> <span class="">$it.description$</span> </div>
        <div class="column has-text-right is-one-fifth is-narrow-mobile is-size-4 is-family-monospace"> $it.price$ </div>
        </li>
        $endif$
        $endfor$
    </ul>
</div>
<!-- <<< $(MENU_CARD_TEMPLATE_HTML_NAME) -->

endef

endif # __gmswe_menu_card_included
