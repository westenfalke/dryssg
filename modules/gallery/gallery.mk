ifndef __module_gallery.included
__module_gallery.included = $(true)

MODULE_GALLERY.MODUL-LOC = modules/gallery/gallery.mk
#echo modules/gallery/gallery.mk|sha256sum
MODULE_GALLERY.MODULE-ID := XXXX
MODULE_GALLERY.NAME = GALLERY
MODULE_GALLERY.SHORT_NAME = I2G
MODULE_GALLERY.OVERVIEWCLASS    ?= columns is-mobile is-multiline is-vcentered is-variable is-3-mobile is-5-tablet is-5-desktop is-5-widescreen is-5-fullhd
MODULE_GALLERY.CLASS            ?= columns is-mobile is-multiline is-vcentered is-variable is-3-mobile is-5-tablet is-5-desktop is-5-widescreen is-5-fullhd
MODULE_GALLERY.DIVCLASS         ?= column is-one-fifth-desktop is-one-fifth-tablet is-one-third-mobile
MODULE_GALLERY.OVERVIEWDIVCLASS ?= column is-one-fifth-desktop is-one-fifth-tablet is-one-third-mobile
MODULE_GALLERY.IMGCLASS         ?=
MODULE_GALLERY.OVERVIEWIMGCLASS ?=
MODULE_GALLERY.FIGCLASS         ?= image
MODULE_GALLERY.OVERVIEWFIGCLASS ?= image
MODULE_GALLERY.COUNTERDELIM     ?= -

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
define module_gallaery.cmd_fooGALLERYbaz
endef

endif # __module_gallery.included
