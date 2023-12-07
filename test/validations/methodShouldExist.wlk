class Persona {
  method getNombre() {
    return "hardcodeado"
  }
  method blah() {
    @Expect(code="methodShouldExist", level="error", expectedOn="self.bleh()")
    (self.bleh())
  }
  method primitiveMethod()
  method templateMethod() {
    // it's ok to call an abstract method
    self.primitiveMethod()
    self.blah()
  }
}

class Profesor inherits Persona {
  method subBlah() {
    self.getNombre()
    self.blah()
    @Expect(code="methodShouldExist", level="error", expectedOn="self.bleh()")
    (self.bleh())
  }
  override method primitiveMethod() {}
}

object o {
  method foo() {
    return 23
  }
  method bar() {
    self.foo()
    @Expect(code="methodShouldExist", level="error", expectedOn="self.foobar()")
    (self.foobar())
  }
}

mixin M {
  method template() {
    // it's ok to call an abstract method
    self.primitive()
    self.implemented()
  }
  method implemented() {
    @Expect(code="methodShouldExist", level="error", expectedOn="self.notImplemented()")
    (self.notImplemented())
  }
  method primitive()
}

class Personaje {
  method blah() {
    pepita.foo()
    pepita.bar()
    
    @Expect(code="methodShouldExist", level="error", expectedOn="pepita.fooBar()")
    (pepita.fooBar())
    
    @Expect(code="methodShouldExist", level="error", expectedOn="pepita.fooBar(2, \"hola\")")
    (pepita.fooBar(2, "hola"))
    
    @Expect(code="methodShouldExist", level="error", expectedOn="pepita.fooWithParam()")
    (pepita.fooWithParam())

    @Expect(code="methodShouldExist", level="error", expectedOn="pepita.fooWithParam(new Date(), 2, 4)")
    (pepita.fooWithParam(new Date(), 2, 4))

    @Expect(code="methodShouldExist", level="error", expectedOn="pepita.foO()")
    (pepita.foO())
    
    @Expect(code="methodShouldExist", level="error", expectedOn="pepita.severalDef()")
    (pepita.severalDef())
    
    @Expect(code="methodShouldExist", level="error", expectedOn="pepita.severalDef(1, 2, 3, 4)")
    (pepita.severalDef(1, 2, 3, 4))
  }
}

class B {
  const i = pepita.foo()
  const x = @Expect(code="methodShouldExist", level="error", expectedOn="pepita.zoo()") (pepita.zoo())
  
  method a() = i + x
}


object pepita {
  method foo() = 23
  method bar() = self.foo()
  method fooWithParam(p) {
  }
  method severalDef(a) { return a + 1 }
  method severalDef(a, b) = a + b
}