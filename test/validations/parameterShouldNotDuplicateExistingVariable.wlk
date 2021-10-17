class Person {
  var name = ""
  var toBeHidden = 23

  method repeatedParameters(
    @Expect(code="parameterShouldNotDuplicateExistingVariable", level="error")
    p1,
    @Expect(code="parameterShouldNotDuplicateExistingVariable", level="error")
    p1
  ) {}  
  
  
  method hidingFieldWithParameter(
    @Expect(code="parameterShouldNotDuplicateExistingVariable", level="error")
    toBeHidden
  ) {}
  
}
