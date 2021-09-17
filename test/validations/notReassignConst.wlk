class SomeClass {
  const constReference = 1
  var varReference = 1

  method tryingToChangeConstReference() {
    @Expect(code = "notReassignConst", value = "error")
    constReference = 2
    varReference = 2
  }
}