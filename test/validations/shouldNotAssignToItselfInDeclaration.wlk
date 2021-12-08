class SomeClass {
  @Expect(code = "shouldNotAssignToItselfInDeclaration", level="error")
  var attribute = attribute

  method attribute() = attribute
  
  method someMethod() {
    @Expect(code = "shouldNotAssignToItselfInDeclaration", level="error")
    var localVariable = localVariable
  }
}