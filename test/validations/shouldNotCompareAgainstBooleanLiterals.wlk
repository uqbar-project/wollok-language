class SomeClass {
  method someMethod(param) {
    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (param.value() == true)) {
      return 1
    }
    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (param.value() == false)) {
      return 0
    }
  }

  method otherMethod(param) {
    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (param.value() === true)) {
      return 1
    }
    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (param.value() === false)) {
      return 0
    }
  }

  method anotherMethod(param) {
    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (param.value().equals(true))) {
      return 1
    }
    if (@Expect(code="shouldNotCompareAgainstBooleanLiterals", level="warning") (param.value().equals(false))) {
      return 0
    }
  }
}

