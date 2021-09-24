class Superclass {
  method superclassMethod() = 42
  method superclassMethodValid() = 10
  method superclassMethodInvalid() = 2
}

class Subclass inherits Superclass {
  @Expect(code="methodNotOnlyCallToSuper", level="warning")
  override method superclassMethod() = super()

  override method superclassMethodValid() = super() * 2

  @Expect(code="methodNotOnlyCallToSuper", level="warning")
  override method superclassMethodInvalid() { return super() }
}

