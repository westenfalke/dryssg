__functions_tests := test_foo test_echo_argument

# ----------------------------------------------------------------------------
# Taeget:    __functions_test
# Arguments: A list of all $(__functions_tests)
# Does:      Triggers all test via prerequisit
# Returns:   Nothing
# ----------------------------------------------------------------------------
__functions_test : FORCE $(__functions_tests)
	$(__module_dbg.tnp)

# ----------------------------------------------------------------------------
# Taeget:    core_func_foo
# Arguments: None
# Does:      Test the function.mk:core_func_foo
# Returns:   Nothing
# ----------------------------------------------------------------------------
test_foo : FORCE
	$(__module_dbg.tnp)
	$(call core_func_foo,A,B,C)

# ----------------------------------------------------------------------------
# Target:    test_echo_argument
# Arguments: A string
# Does:      Test the function.mk:core_func_echo_argument# ----------------------------------------------------------------------------
BAR = $(FOO)
FOO = $(call core_func_echo_argument,An Argument)
test_echo_argument :
	$(__module_dbg.tnp)
	$(info value '$(FOO)' and '$(BAR)')
	$(call init_parameter)
	$(info value '$(FOO)' and '$(BAR)')
	$(call assert,$(call seq,$(FOO),$(BAR)),value '$(FOO)' and '$(BAR)' should be equal)
