class SomeClass {
  var property someAttribute = "hello"
  const property constProperty = 1
  method createDateWithBadParam() = new Date(@Expect(code="namedArgumentShouldExist", level="error") hour = 10, month = 2, year = 2020)
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
  method updateSomeClassUsingUnexistentAttribute() {
    someClass = new SomeClass(@Expect(code="namedArgumentShouldExist", level="error") badAttribute = "bye")
  }
  method updateSomeClassCorrectly() {
    someClass = new SomeClass(someAttribute = "bye")
  }
  method updateSomeSubclassUsingUnexistentAttribute() {
    someClass = new SubclassOfSomeClass(@Expect(code="namedArgumentShouldExist", level="error") badAttribute = "bye")
  }
  method updateSomeSubclassCorrectly() {
    someClass = new SubclassOfSomeClass(someAttribute = "bye", constProperty = 2)
  }
  method throwingExceptionOk() {
    throw new MessageNotUnderstoodException(message = "Some message")
  }
  method usingMixinUsingUnexistenteAttribute() = new StackableClass(stackableAttribute = 1, @Expect(code="namedArgumentShouldExist", level="error") mixinAttributeNotFound = "bye", someAttribute = "ok")
  method usingMixedClassOk() = new StackableClass(stackableAttribute = 1, mixinAttribute = "bye", someAttribute = "ok")
}

object someObjectOk inherits SomeClass(someAttribute = "good!") {}

object someObjectUnexistentAttribute inherits SomeClass(@Expect(code="namedArgumentShouldExist", level="error") badAttribute = 0) {}

const literalOk = object inherits SomeClass(someAttribute = "good!") {}

const literalUnexistentAttribute = object inherits SomeClass(@Expect(code="namedArgumentShouldExist", level="error") badAttribute = 0) {}
