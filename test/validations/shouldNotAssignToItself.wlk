class SomeClass {
  var value = 0

  method someMethod() {
    @Expect(code="shouldNotAssignToItself", level="error")
    value = value
  }
}