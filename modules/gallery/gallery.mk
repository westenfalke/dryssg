ifndef __gmswe_gallery_included
__gmswe_gallery_included = $(true)

GALLERY.MODUL-LOC = modules/gallery/gallery.mk
#echo modules/gallery/gallery.mk|sha256sum
GALLERY.MODULE-ID := XXXX
GALLERY.NAME = GALLERY
GALLERYL.SHORT_NAME = I2G
GALLERY_OVERVIEWCLASS    ?= columns is-mobile is-multiline is-vcentered is-variable is-3-mobile is-5-tablet is-5-desktop is-5-widescreen is-5-fullhd
GALLERY_CLASS            ?= columns is-mobile is-multiline is-vcentered is-variable is-3-mobile is-5-tablet is-5-desktop is-5-widescreen is-5-fullhd
GALLREY_DIVCLASS         ?= column is-one-fifth-desktop is-one-fifth-tablet is-one-third-mobile
GALLREY_OVERVIEWDIVCLASS ?= column is-one-fifth-desktop is-one-fifth-tablet is-one-third-mobile
GALLREY_IMGCLASS         ?=
GALLREY_OVERVIEWIMGCLASS ?=
GALLREY_FIGCLASS         ?= image
GALLREY_OVERVIEWFIGCLASS ?= image
GALLREY_COUNTERDELIM     ?= -

# ----------------------------------------------------------------------------
# Target:    $$() $() 
# Arguments: None
# Does:      ?
# ----------------------------------------------------------------------------
$() :

	
# ----------------------------------------------------------------------------
# Function:  
# Arguments: 1: ?
#            2. ?
# Returns:   Nothing
# Does:      ?
# REM:       ?
# ----------------------------------------------------------------------------
define cmd_fooGALLERYbaz
endef

endif # __gmswe_gallery_included
