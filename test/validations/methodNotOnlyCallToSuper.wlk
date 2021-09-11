class Superclass {
  method superclassMethod() = 42
}

class Subclass inherits Superclass {
  @Expect(code="methodNotOnlyCallToSuper", level="warning")
  override method superclassMethodInvalid() = super()

  override method superclassMethodValid() = super() * 2
}
