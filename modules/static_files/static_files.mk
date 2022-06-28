ifndef __gmswe_statc_files_included
__gmswe_statc_files_included = $(true)

STATICDIR ?= $(INSTALLDIR)/static
STATIC-PARAM-VERBOSE         := --verbose
STATIC-PARAM-RSYNC-INFO      := --info=NONE
STATIC-PARAM-RSYNC-DEBUG     := --debug=NONE

#STATIC-PARAM-RSYNC-DEFAULTS   := --update --delete --recursive $(STATIC-PARAM-VERBOSE) $(STATIC-PARAM-RSYNC-INFO) $(STATIC-PARAM-RSYNC-DEBUG)
STATIC-PARAM-RSYNC-DEFAULTS   := --times --delete --recursive $(STATIC-PARAM-VERBOSE) $(STATIC-PARAM-RSYNC-INFO) $(STATIC-PARAM-RSYNC-DEBUG)
STATIC-RSYNC-DEFAULT     := rsync $(STATIC-PARAM-RSYNC-DEFAULTS)

# ----------------------------------------------------------------------------
# Function:  cmd_sync_static_files
# Arguments: None
# Returns:   Nothing
# Does:      ?
# ----------------------------------------------------------------------------
cmd_sync_static_files = $(__gmswe_tr0)$(STATIC-RSYNC-DEFAULT) $(STATICDIR)/* $(DOCUMENTROOT)/

endif # __gmswe_statc_files_included
