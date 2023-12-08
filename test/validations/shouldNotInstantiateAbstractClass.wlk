class AbstractClass {
  method abstractMethod()
  method concreteMethod() = 1
}

class ConcreteClass inherits AbstractClass {
  override method abstractMethod() = 2
}

class SomeClass {
  method something(param) {
    const value = @Expect(code="shouldNotInstantiateAbstractClass", level="error", expectedOn="new AbstractClass()\n    ") new AbstractClass()
    const anotherValue = new ConcreteClass()
    return if (param) value.concreteMethod() else anotherValue.abstractMethod()
  }
}