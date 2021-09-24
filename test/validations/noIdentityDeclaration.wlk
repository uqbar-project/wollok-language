class SomeClass {
  @Expect(code = "noIdentityDeclaration", level="error")
  var attribute = attribute

  method someMethod() {
    @Expect(code = "noIdentityDeclaration", level="error")
    var localVariable = localVariable
  }
}