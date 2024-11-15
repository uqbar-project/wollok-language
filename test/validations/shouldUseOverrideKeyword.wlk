class SpecialList inherits List {
  // Allowed
  override method remove(other) {}

  @Expect(code="shouldUseOverrideKeyword", level="warning")
  method add(other) {}
}

object bar inherits List {
	@Expect(code="shouldUseOverrideKeyword", level="warning")
  method == (other) {
    return true
  }
}

class SomeSuperClass {
  method someMethod() = 1
}

class SomeSubClass inherits SomeSuperClass {
  @Expect(code="shouldUseOverrideKeyword", level="warning")
  method someMethod() = 2
}

class A { method m() }
class B inherits A {
  const property m // Allowed because m is a property
}

class C {
  const property value = 0
}

class D inherits C {
  @Expect(code="shouldUseOverrideKeyword", level="warning")
  method value() = 1
}