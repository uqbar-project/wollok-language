object pepita {
  const extraEnergy = @Expect(code="shouldNotUseVoidSingleton", level="error", expectedOn="void") void
  
  var property friend = new Bird(energy = @Expect(code="shouldNotUseVoidSingleton", level="error", expectedOn="void") void)

  method normalEnergy() = extraEnergy - 100
}

class Bird {
  var property energy = 100

  method fly() {
    return @Expect(code="shouldNotUseVoidSingleton", level="error", expectedOn="void") void
  }
}

mixin Growable {
  var property height = 100

  method compare(anObject, anotherObject) = anObject === anotherObject

  method grow() {
    const originalValue = @Expect(code="shouldNotUseVoidSingleton", level="error", expectedOn="void") void

    if (self.compare(originalValue, @Expect(code="shouldNotUseVoidSingleton", level="error", expectedOn="void") void)) {
      height = height + 10
    }
  }
}
