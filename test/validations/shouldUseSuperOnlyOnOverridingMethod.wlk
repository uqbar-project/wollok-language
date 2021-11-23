class Golondrina {
  var energia = 100
  
  method energia() {
    @Expect(code="shouldUseSuperOnlyOnOverridingMethod", level="error")
    super()
    return energia
  }

  method jugar() {
    energia = energia / 2
  }
}

class GolondrinaRenga inherits Golondrina {
  override method jugar() {
    @Expect(code="shouldUseSuperOnlyOnOverridingMethod", level="error")
    super(1)
  }
}

class SuperInvocationTest {
  method run() {
    return object {
      method valak(a) {
        @Expect(code="shouldUseSuperOnlyOnOverridingMethod", level="error")
        super(a * 2)
      }
    }
  }
}
