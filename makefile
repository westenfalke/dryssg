.PHONY : all
.SILENT :
#GMSL_TRACE = ENABLED
MAKE_TRACE = ENABLED
#MAKE_DOC = ENABLED
include functions.mk

# ----------------------------------------------------------------------------
# Target:    all
# ----------------------------------------------------------------------------
all : robots.txt


clean : FORCE

sitmap.xml :

robots.txt : sitmap.xml

echo :
	echo $(call echo,Return Me)

foo :
	echo $(call foo,A,B,C)

func1 := echo
func2 := foo
HelloWorld :
	echo $(call $(func1),Hallo Welt)
	echo $(call $(func2),Hallo Welt)

# ----------------------------------------------------------------------------
# Targe:     printallvars
# Arguments: None
# Does:      Prints the name, value and (expanded value) of all variables
#            in $(.VARIABLES)
#            except if they start with '__' hence this are likely to be gmsl
#            or if their origin is in (environment% default automatic)
# ----------------------------------------------------------------------------
printallvars : FORCE
	$(info $$@ $@)
	$(call printallvars)

# ----------------------------------------------------------------------------
# Targe:     ENPTYTARGE
# Arguments: None
# Does:      Nothing, but to have FORCE as a prerequisit.
#            It's usesed to create a baselie for testsand in profiling
# ----------------------------------------------------------------------------
ENPTYTARGET : FORCE

# ----------------------------------------------------------------------------
# Targe:     FORCE
# Arguments: None
# Does:      Nothing, but to deal as an target without a recipe and
#            therefore to trigger another (not PHONY) target
# ----------------------------------------------------------------------------
FORCE :
