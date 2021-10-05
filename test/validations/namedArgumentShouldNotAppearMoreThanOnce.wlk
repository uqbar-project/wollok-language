class SomeClass {
  var property someAttribute = "hello"
  const property constProperty = 1
  method createDateWithBadParam() = new Date(@Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning") day = 10, @Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning") day = 11, month = 2, year = 2020)
}

class SubclassOfSomeClass inherits SomeClass {
}

mixin SomeMixin {
  var property mixinAttribute = "hello"
}

class StackableClass inherits SomeMixin and SomeClass {
  const stackableAttribute = 2
}

class AnotherClass {
  var someClass
  method updateSomeClassUsingRepeatedNamedParameter() {
    someClass = new SomeClass(@Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning") someAttribute = "bye", @Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning") someAttribute = "good bye")
  }
  method updateSomeSubclassUsingRepeatedNamedParameter() {
    someClass = new SubclassOfSomeClass(@Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning") constProperty = "bye", @Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning") constProperty = "good bye")
  }
  method throwingExceptionRepeatedNamedParameters() {
    throw new MessageNotUnderstoodException(@Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning") message = "Some message", @Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning") message = "Some different message")
  }
  method usingMixinUsingRepeatedNamedParameters() = new StackableClass(@Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning") stackableAttribute = 1, @Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning") stackableAttribute = 0, someAttribute = "ok")
}

object someObjectRepeatedNamedParameter inherits SomeClass(@Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning") someAttribute = 0, @Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning") someAttribute = 1) {}

const literalRepeatedNamedParameter = object inherits SomeClass(@Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning") someAttribute = 0, @Expect(code="namedArgumentShouldNotAppearMoreThanOnce", level="warning") someAttribute = 1) {}
