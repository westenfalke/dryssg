__functions_tests := test_foo test_echo_argument

# ----------------------------------------------------------------------------
# Taeget:    __functions_test
# Arguments: A list of all $(__functions_tests)
# Does:      Triggers all test via prerequisit
# Returns:   Nothing
# ----------------------------------------------------------------------------
__functions_test : FORCE $(__functions_tests)
	$(__gmswe_dbg_tnp)

# ----------------------------------------------------------------------------
# Taeget:    func_foo
# Arguments: None
# Does:      Test the function.mk:func_foo
# Returns:   Nothing
# ----------------------------------------------------------------------------
test_foo : FORCE
	$(__gmswe_dbg_tnp)
	$(call func_foo,A,B,C)

# ----------------------------------------------------------------------------
# Target:    test_echo_argument
# Arguments: A string
# Does:      Test the function.mk:func_echo_argument
# ----------------------------------------------------------------------------
BAR = $(FOO)
FOO = $(call func_echo_argument,An Argument)
test_echo_argument :
	$(__gmswe_dbg_tnp)
	$(info value '$(FOO)' and '$(BAR)')
	$(call init_parameter)
	$(info value '$(FOO)' and '$(BAR)')
	$(call assert,$(call seq,$(FOO),$(BAR)),value '$(FOO)' and '$(BAR)' should be equal)
