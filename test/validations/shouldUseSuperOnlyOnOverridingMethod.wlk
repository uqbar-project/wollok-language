class Golondrina {
  var energia = 100
  
  method energia() {
    return energia
  }

  method jugar() {
    energia = energia / 2
  }
}

class GolondrinaRenga inherits Golondrina {
  override method jugar() {
    @Expect(code="shouldUseSuperOnlyOnOverridingMethod", level="error", expectedOn="super(1)\n  ")
    super(1)
  }
}
