class SomeClass {
  @Expect(code="onlyLastParameterCanBeVarArg", level="error")
	method preffixVarArgAsFirstParam(numbers..., preffix) {
	}
	
  @Expect(code="onlyLastParameterCanBeVarArg", level="error")
	method preffixVarArgsAtTheMiddle(a, numbers..., preffix) {
	}

  method validMethod(arg1, arg2...) {
    return arg2 + arg1 + 20
  }
}
