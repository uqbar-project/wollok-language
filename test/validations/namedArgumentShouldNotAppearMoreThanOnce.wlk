class SomeClass {
  var property someAttribute = "hello"
  const property constProperty = 1
  method createDateWithBadParam() = new Date(@Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning", expectedOn="day") day = 10, @Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning", expectedOn="day") day = 11, month = 2, year = 2020)
}

class SubclassOfSomeClass inherits SomeClass {
}

mixin SomeMixin {
  var property mixinAttribute = "hello"
}

class StackableClass inherits SomeMixin and SomeClass {
  const property stackableAttribute = 2
}

class AnotherClass {
  var someClass
  method updateSomeClassUsingRepeatedNamedParameter() {
    someClass = new SomeClass(@Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning", expectedOn="someAttribute") someAttribute = "bye", @Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning", expectedOn="someAttribute") someAttribute = "good bye")
  }
  method updateSomeSubclassUsingRepeatedNamedParameter() {
    someClass = new SubclassOfSomeClass(@Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning", expectedOn="constProperty") constProperty = "bye", @Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning", expectedOn="constProperty") constProperty = "good bye")
  }
  method throwingExceptionRepeatedNamedParameters() {
    throw new MessageNotUnderstoodException(@Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning", expectedOn="message") message = "Some message", @Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning", expectedOn="message") message = "Some different message")
  }
  method usingMixinUsingRepeatedNamedParameters() = new StackableClass(@Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning", expectedOn="stackableAttribute") stackableAttribute = 1, @Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning", expectedOn="stackableAttribute") stackableAttribute = 0, someAttribute = "ok")
}
