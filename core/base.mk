ifndef __core_base_included
include config.mk
__core_base_included := $(true)

CORE_BASE_MAKEFILE_PATH        := $(abspath $(lastword $(MAKEFILE_LIST)))
CORE_BASE_MAKEFILE_DIR         := $(dir $(CORE_BASE_MAKEFILE_PATH))
CORE_BASE_DIR                  := $(shell realpath --relative-to=$(CORE_BASE_MAKEFILE_DIR) $(CORE_BASE_MAKEFILE_DIR))
CORE_BASE_INSTALL_DIR          ?= $(CORE_BASE_DIR)
CORE_BASE_REALPATH_TO_BASE_DIR := realpath --relative-to=$(CORE_BASE_DIR)

endif #__core_base_included
