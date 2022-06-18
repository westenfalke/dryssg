ifndef __gmswe_test_included
include config.mk
__gmswe_test_included := $(true)

ifdef GMSWE_TEST

include modules/test/__functions_test.mk
__test : __functions_test

else

endif #GMSWE_TEST

# ----------------------------------------------------------------------------
# Target:    EMPTYTARGET EMPTYTARGET (.PHONY) [EMPTYTARGET]
# Arguments: None
# Does:      Nothing, but
#            It's usesed to create a baseline for tests and in profiling
# ----------------------------------------------------------------------------
EMPTYTARGET : FORCE
	$(__gmswe_dbg_tnp)

endif #__gmswe_test_included
