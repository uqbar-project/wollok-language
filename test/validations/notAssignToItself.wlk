class SomeClass {
  var value = 0

  method someMethod() {
    @Expect(code="notAssignToItself", level="error")
    value = value
  }
}