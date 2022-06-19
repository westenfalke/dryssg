ifndef __gmswe_modules_included
__gmswe_modules_included := $(true)
include modules/trace/trace.mk
include modules/debug/debug.mk
include modules/logging/logging.mk
include modules/documents/documents.mk
include modules/sitemap_xml/sitemap_xml.mk
include modules/robots_txt/robots_txt.mk
include modules/markdown2html/markdown2html.mk
include modules/menu_card/menu_card.mk
include modules/test/test.mk
endif #__gmswe_modules_included
