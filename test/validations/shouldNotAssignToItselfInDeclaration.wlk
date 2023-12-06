class SomeClass {
  @Expect(code = "shouldNotAssignToItselfInDeclaration", level="error", expectedOn="var attribute = attribute")
  var attribute = attribute

  method attribute() = attribute

  method updateAttribute() {
    attribute = !attribute
  }
  
  method someMethod() {
    @Expect(code = "shouldNotAssignToItselfInDeclaration", level="error", expectedOn="var localVariable = localVariable")
    var localVariable = localVariable

    localVariable = !localVariable
  }
}