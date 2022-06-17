ifndef __gmswe_base_included
include config.mk
__gmswe_base_included := $(true)

MAKEFILEPATH      := $(abspath $(lastword $(MAKEFILE_LIST)))
MAKEFILEDIR       := $(dir $(MAKEFILEPATH))
BASEDIR           := $(shell realpath --relative-to=$(MAKEFILEDIR) $(MAKEFILEDIR))
INSTALLDIR        ?= $(BASEDIR)
REALPATHTOBASEDIR := realpath --relative-to=$(BASEDIR)
INITDIRNAME       := .init
INITDIR           := $(shell $(REALPATHTOBASEDIR) $(BASEDIR)$(XSLASH)$(INITDIRNAME))

endif #__gmswe_base_included
