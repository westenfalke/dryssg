ifndef __modules__modules_included
__modules__modules_included := $(true)
include modules/trace/trace.mk
include modules/dbg/dbg.mk
include modules/log/log.mk
include modules/res/res.mk
include modules/doc/doc.mk
include modules/sitemap_xml/sitemap_xml.mk
include modules/robots_txt/robots_txt.mk
include modules/md2html/md2html.mk
include modules/menu_card/menu_card.mk
include modules/gallery/gallery.mk
include modules/static_files/static_files.mk
include modules/test/test.mk
endif #__modules__modules_included
