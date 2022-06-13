ifndef __gmswe_test_included
include config.mk
__gmswe_test_included := $(true)
include __functions_test.mk

__test : __functions_test
endif #__gmswe_test_included
