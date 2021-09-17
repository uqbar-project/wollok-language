class SomeClass {
  @Expect(code="onlyLastParameterIsVarArg", level="error")
  method invalidMethod(arg..., arg2) {
    return 10
  }

  method validMethod(arg1, arg2...) {
    return arg2 + arg1 + 20
  }
}
