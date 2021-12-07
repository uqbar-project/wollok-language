/* ================================================================================
 * - using a combined hierarchy of classes and mixins
 * - instantiation of subclasses, anonymous objects and singletons definitions
 * ===============================================================================*/

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
  const property stackableAttribute = 2
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

/* ================================================================================
 * - using a combined hierarchy of classes and mixins
 * - subclasses definitions
 * ===============================================================================*/

class A {
  const x
  const y
  method suma() = x + y
}

class B inherits A(x = 1) {
  const z
  method z() = z
}

mixin M {
  const w
  method w() = w
}

class C1 inherits M and B(@Expect(code="namedArgumentShouldExist", level="error") q = 3) { } // missing 'q'
class C2 inherits M and B(@Expect(code="namedArgumentShouldExist", level="error") w = 3) { } // missing 'w'
class C3 inherits M(@Expect(code="namedArgumentShouldExist", level="error") z = 3) and B { } // missing 'z'
class C4 inherits M and B(x = 0) { }        // OK! x = 0
class C5 inherits M and B(y = 0) { }        // OK! x = 1, y = 0
class C6 inherits M and B(z = 0) { }        // OK! x = 1, z = 0
class C7 inherits M(w = 0) and B(z = 0) { } // OK! w = 0, x = 1, z = 0
