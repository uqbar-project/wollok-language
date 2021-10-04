class SomeClass {
  var property someAttribute = "hello"
  method createDateWithBadParam() = new Date(@Expect(code="namedArgumentShouldExist", level="error") hour = 10, month = 2, year = 2020)
}

class AnotherClass {
  var someClass
  method updateSomeClassWithBadAttribute() {
    someClass = new SomeClass(@Expect(code="namedArgumentShouldExist", level="error") badAttribute = "bye")
  }
  method updateSomeClassCorrectly() {
    someClass = new SomeClass(someAttribute = "bye")
  }
}
