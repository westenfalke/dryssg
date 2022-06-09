.PHONY :
	$(__debug_t2p)
.SILENT :
	$(__debug_t2p)


GMSL_TRACE  := ENABLED
MAKE_DEBUG  := ENABELED
MAKE_TRACE  := ENABLED
MAKE_DOC    := ENABLED
MAKE_REPORT := ENABLED
include trace.mk
include debug.mk
include functions.mk

# ----------------------------------------------------------------------------
# Target:    FORCE
# Arguments: None
# Does:      Nothing, but to deal as an target without a recipe and
#            therefore to trigger another (not PHONY) target
# ----------------------------------------------------------------------------
FORCE :
	$(__debug_t2p)

# ----------------------------------------------------------------------------
# Target:    all
# Arguments: None
# Does:      Diplays usage
# ----------------------------------------------------------------------------
all : FORCE
	$(__debug_t2p)
	echo "usage"
	echo "# make website"
	echo "# make help [QUERY=pattern]"

QUERY :
	$(__debug_t2p)

# ----------------------------------------------------------------------------
# Target:    clean
# Arguments: None
# Does:      ?
# ----------------------------------------------------------------------------
clean : FORCE
	$(__debug_t2p)

# ----------------------------------------------------------------------------
# Target:    public_html
# Arguments: None
# Does:      ?
# ----------------------------------------------------------------------------
public_html :
	$(__debug_t2p)

# ----------------------------------------------------------------------------
# Target:    sitmap.xml
# Arguments: None
# Does:      ?
# ----------------------------------------------------------------------------
sitmap.xml : public_html
	$(__debug_t2p)

# ----------------------------------------------------------------------------
# Target:    robots.txt
# Arguments: None
# Does:      ?
# ----------------------------------------------------------------------------
robots.txt : sitmap.xml
	$(__debug_t2p)

# ----------------------------------------------------------------------------
# Target:    website
# Arguments: None
# Does:      Nothing, but to deal as an target without a recipe and
#            therefore to trigger another (not PHONY) target
# ----------------------------------------------------------------------------
website : robots.txt
	$(__debug_t2p)

# ----------------------------------------------------------------------------
# Target:    test_echo_argument
# Arguments: A string
# Does:      Test the function.mk:echo_argunent
# ----------------------------------------------------------------------------
test_echo_argument : FOO := An Argument
test_echo_argument : BAR := $(call echo,$(FOO))
test_echo_argument : FORCE
	$(__debug_t2p)
	$(call assert,$(call seq,$(FOO),$(BAR)),value '$(FOO)' and '$(BAR)' should be equal)

# ----------------------------------------------------------------------------
# Taeget:    foo
# Arguments: None
# Does:      Test the function.mk:foo
# Returns:   Nothing
# ----------------------------------------------------------------------------
foo : FORCE
	$(__debug_t2p)
	$(call foo,A,B,C)

# ----------------------------------------------------------------------------
# Target:    HelloWorld
# Arguments: None
# Does:      ?
# ----------------------------------------------------------------------------
func1 := echo
func2 := foo
HelloWorld :
	$(__debug_t2p)
	echo $(call $(func1),Hallo Welt)
	echo $(call $(func2),Hallo Welt)

# ----------------------------------------------------------------------------
# Target:    EMPTYTARGE
# Arguments: None
# Does:      Nothing, but to have FORCE as a prerequisit.
#            It's usesed to create a baselie for testsand in profiling
# ----------------------------------------------------------------------------
EMPTYTARGET : FORCE
	$(__debug_t2p)

# ----------------------------------------------------------------------------
# Target:    printallvars
# Arguments: None
# Does:      Prints the name, value and (expanded value) of all variables
#            in $(.VARIABLES)
#            except if they start with '__' hence this are likely to be gmsl
#            or if their origin is in (environment% default automatic)
# ----------------------------------------------------------------------------
printallvars : FORCE
	$(__debug_t2p)
	echo $(call printallvars)

# ----------------------------------------------------------------------------
# Target:    help
# Arguments: $(QUERY)
# Does:      ?
# ----------------------------------------------------------------------------
VALIDTAREGETS  := $(sort $(shell grep -v -e ':=|$(__gmsl_tab)' makefile | sed -n 's/\(^.*\)\( : \)\(.*$$\)/\1/p' | tr '\n' ' '))
VALIDFUNCTIONS := $(sort foo printvars printallvars prepgrep4help)
SAVEQUERIES   := $(sort $(VALIDTAREGETS) $(VALIDFUNCTIONS))
help :
	$(__debug_t2p)
	$(info $$(SAVEQUERIES) '$(SAVEQUERIES)')
	$(eval SANQUERY = $(filter $(QUERY),$(SAVEQUERIES)))
ifeq (/$(filter $(QUERY),$(SAVEQUERIES))/,//)
	$(warning $$(QUERY) '$(QUERY)' (is potentialy dangerous))
	$(eval SANQUERY = all)
	$(info $$(SANQUERY) '$(SANQUERY)' (default))
else
	$(info $$(SANQUERY) '$(SANQUERY)' (OK))
endif
	-$(call prepgrep4help,$(SANQUERY),functions.mk)
	-$(call prepgrep4help,$(SANQUERY),makefile)


# ----------------------------------------------------------------------------
# Target:    liste
# Arguments: $(VALIDTAREGETS) $(VALIDFUNCTIONS)
# Does:      ?
# ----------------------------------------------------------------------------
list : all
	echo "targets: [QUERY=($(foreach pattern,$(VALIDTAREGETS),$(pattern) |) <NOTHING>)]"
	echo "function: [QUERY=($(foreach pattern,$(VALIDFUNCTIONS),$(pattern) |) <NOTHING>)]"


.DEFAULT_GOAL := list
