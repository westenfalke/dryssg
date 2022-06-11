include config.mk
.PHONY : QUERY
	$(__debug_tnp)
.SILENT :
	$(__debug_tnp)

# ----------------------------------------------------------------------------
# Target:    FORCE
# Arguments: None
# Does:      Nothing, but to deal as an target without a recipe and
#            therefore to trigger another (not PHONY) target
# ----------------------------------------------------------------------------
FORCE :
	$(__debug_tnp)

# ----------------------------------------------------------------------------
# Target:    usage
# Arguments: None
# Does:      Diplays usage
# ----------------------------------------------------------------------------
usage : FORCE
	$(__debug_tnp)
	@echo "usage"
	@echo "# make usage"
	@echo "# make website"
	@echo "# make find [QUERY=pattern]"

# ----------------------------------------------------------------------------
# Target:      .DEFAULT_GOAL : QUERY
# Prerequisit: 'usage :' if $(QUERY) is empty, else 'find :'
# Arguments:   $(QUERY)
# Does:        Supplies CLI with auto compleation for the find target
#              find [QUERY=pattern]
#              Diplays usage, QUERY is empty
# ----------------------------------------------------------------------------
QUERY : $(if $(QUERY),find,usage)
	$(__debug_tnp)

# ----------------------------------------------------------------------------
# Target:    clean_public_html
# Arguments: None
# Does:      Removes the folder provided by public_html and its content
#            It does not remove other generated conent out site public_html
# ----------------------------------------------------------------------------
clean_public_html : FORCE
	$(__debug_tnp)

# ----------------------------------------------------------------------------
# Target:    public_html
# Arguments: None
# Does:      Provide the parent folder for the website.
#            The content of this folder is wat's going to be published
# ----------------------------------------------------------------------------
public_html : FORCE
	$(__debug_tnp)

# ----------------------------------------------------------------------------
# Target:    sitmap.xml
# Arguments: None
# Does:      Creates a file referencing the HTML-files of the website
#            A search engine can use this file to navigate
#            and index the website
# ----------------------------------------------------------------------------
sitmap.xml : public_html
	$(__debug_tnp)

# ----------------------------------------------------------------------------
# Target:    robots.txt
# Arguments: None
# Does:      Provides a is static file in order to point
#            search engins to the sitmap.xml
# ----------------------------------------------------------------------------
robots.txt : sitmap.xml
	$(__debug_tnp)

# ----------------------------------------------------------------------------
# Target:    website
# Arguments: None
# Does:      Build all parts of a website
# ----------------------------------------------------------------------------
website : robots.txt
	$(__debug_tnp)

# ----------------------------------------------------------------------------
# Target:    test_echo_argument
# Arguments: A string
# Does:      Test the function.mk:echo_argunent
# ----------------------------------------------------------------------------
test_echo_argument : FOO := An Argument
test_echo_argument : BAR := $(call echo,$(FOO))
test_echo_argument : FORCE
	$(__debug_tnp)
	$(call assert,$(call seq,$(FOO),$(BAR)),value '$(FOO)' and '$(BAR)' should be equal)

# ----------------------------------------------------------------------------
# Taeget:    foo
# Arguments: None
# Does:      Test the function.mk:foo
# Returns:   Nothing
# ----------------------------------------------------------------------------
foo : FORCE
	$(__debug_tnp)
	$(call foo,A,B,C)

# ----------------------------------------------------------------------------
# Target:    EMPTYTARGET
# Arguments: None
# Does:      Nothing, but
#            It's usesed to create a baseline for tests and in profiling
# ----------------------------------------------------------------------------
EMPTYTARGET : FORCE
	$(__debug_tnp)

# ----------------------------------------------------------------------------
# Target:    printallvars
# Arguments: None
# Does:      Prints the name, value and (expanded value) of all variables
#            in $(.VARIABLES)
#            except if they start with '__' hence this are likely to be gmsl
#            or if their origin is in (environment% default automatic)
# ----------------------------------------------------------------------------
printallvars : FORCE
	$(__debug_tnp)
	echo $(call printallvars)

# ----------------------------------------------------------------------------
# Target:    find
# Arguments: $(QUERY) text/plain [a-zA-Z0-9_-]
# Does:      Searches the comments blocks of the make files
# ----------------------------------------------------------------------------
find :
	$(__debug_tnp)
	$(eval SANQUERY = $(shell echo $(QUERY) | sed 's/[^a-zA-Z0-9_-]//g'))
	$(if $(SANQUERY),-$(call fetch_comment4pattern,$(SANQUERY),functions.mk))
	$(if $(SANQUERY),-$(call fetch_comment4pattern,$(SANQUERY),makefile))
	$(if $(SANQUERY),-$(call fetch_comment4pattern,$(SANQUERY),/usr/include/__gmsl))

.DEFAULT_GOAL := QUERY
