class Person {
  var property toBeHidden = 23

  method repeatedParameters(
    @Expect(code="parameterShouldNotDuplicateExistingVariable", level="error", expectedOn="p1")
    p1,
    @Expect(code="parameterShouldNotDuplicateExistingVariable", level="error", expectedOn="p1")
    p1
  ) {}  
  
  
  method hidingFieldWithParameter(
    @Expect(code="parameterShouldNotDuplicateExistingVariable", level="error", expectedOn="toBeHidden")
    toBeHidden
  ) {}
  
}
