include gmsl
#GMSL_TRACE  := $(true)
MAKE_DEBUG  := $(true)
MAKE_TRACE  := $(true)
MAKE_DOC    := $(true)
MAKE_REPORT := $(true)
include dryssg.mk
.PHONY : QUERY
	$(__debug_t2p)
.SILENT :
	$(__debug_t2p)

# ----------------------------------------------------------------------------
# Target:    FORCE
# Arguments: None
# Does:      Nothing, but to deal as an target without a recipe and
#            therefore to trigger another (not PHONY) target
# ----------------------------------------------------------------------------
FORCE :
	$(__debug_t2p)
	$(info $$(MAKECMDGOALS) $(MAKECMDGOALS))

# ----------------------------------------------------------------------------
# Target:    all
# Arguments: None
# Does:      Diplays usage
# ----------------------------------------------------------------------------
usage : FORCE
	$(__debug_t2p)
	@echo "usage"
	@echo "# make help"
	@echo "# make website"
	@echo "# make search [QUERY=pattern]"

export GOALS := BOTTOM

QUERY : help
	$(__debug_t2p)
	$(info $$(MAKECMDGOALS) $(MAKECMDGOALS))

# ----------------------------------------------------------------------------
# Target:    clean_public_html
# Arguments: None
# Does:      Removes the folder provided by public_html and its content
#            It does not remove other generated conent out site public_html
# ----------------------------------------------------------------------------
clean_public_html : FORCE
	$(__debug_t2p)
	$(info $$(MAKECMDGOALS) $(MAKECMDGOALS))

# ----------------------------------------------------------------------------
# Target:    public_html
# Arguments: None
# Does:      Provide the parent folder for the website.
#            The content of this folder is wat's going to be published
# ----------------------------------------------------------------------------
public_html : FORCE
	$(__debug_t2p)

# ----------------------------------------------------------------------------
# Target:    sitmap.xml
# Arguments: None
# Does:      Creates a file referencing the HTML-files of the website
#            A search engine can use this file to navigate
#            and index the website
# ----------------------------------------------------------------------------
sitmap.xml : public_html
	$(__debug_t2p)

# ----------------------------------------------------------------------------
# Target:    robots.txt
# Arguments: None
# Does:      Provides a is static file in order to point
#            search engins to the sitmap.xml
# ----------------------------------------------------------------------------
robots.txt : sitmap.xml
	$(__debug_t2p)

# ----------------------------------------------------------------------------
# Target:    website
# Arguments: None
# Does:      Build all parts of a website
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
# Target:    EMPTYTARGET
# Arguments: None
# Does:      Nothing, but
#            It's usesed to create a baseline for tests and in profiling
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
find :
	$(__debug_t2p)
	$(eval SANQUERY = $(shell echo $(QUERY) | sed 's/[^a-zA-Z0-9_-]//g'))
	$(if $(SANQUERY),-$(call fetch_comment4pattern,$(SANQUERY),functions.mk))
	$(if $(SANQUERY),-$(call fetch_comment4pattern,$(SANQUERY),makefile))
	$(if $(SANQUERY),-$(call fetch_comment4pattern,$(SANQUERY),/usr/include/__gmsl))

.DEFAULT_GOAL := usage
