class SomeClass {
  method someMethod(param) {
    if (@Expect(code="dontCheckEqualityAgainstBooleanLiterals", level="warning") (param.value() == true)) {
      return 1
    }
    if (@Expect(code="dontCheckEqualityAgainstBooleanLiterals", level="warning") (param.value() == false)) {
      return 0
    }
  }

  method otherMethod(param) {
    if (@Expect(code="dontCheckEqualityAgainstBooleanLiterals", level="warning") (param.value() === true)) {
      return 1
    }
    if (@Expect(code="dontCheckEqualityAgainstBooleanLiterals", level="warning") (param.value() === false)) {
      return 0
    }
  }
}

