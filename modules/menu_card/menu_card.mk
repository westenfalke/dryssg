ifndef __gmswe_menu_card_included
__gmswe_menu_card_included = $(true)

MENU_CARD_TEMPLATE_HTML_NAME ?=  menu_card_partial.html
MENU_CARD_TEMPLATE_HTML ?= $(CONV_TEMPLATEDIR)/$(MENU_CARD_TEMPLATE_HTML_NAME)
MENU_CARD_DIR_NAME ?= menu_card
MENU_CARD_DIR ?= $(DOCUMENTS)/$(MENU_CARD_DIR_NAME)

# ----------------------------------------------------------------------------
# Target:    $$() $() []
# Arguments: None
# Does:      ?
# ----------------------------------------------------------------------------
$(MENU_CARD_DIR) :
	$(__gmswe_dbg_tnp)	

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
