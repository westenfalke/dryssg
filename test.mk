ifndef __gmswe_test_included
include config.mk
__gmswe_test_included := $(true)

ifdef GMSWE_TEST

include __functions_test.mk
__test : __functions_test

else

endif #GMSWE_TEST

endif #__gmswe_test_included
