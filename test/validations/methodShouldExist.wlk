class Persona {
	method getNombre() {
		return "hardcodeado"
	}
	method blah() {
		@Expect(code="methodShouldExist", level="error")
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
		@Expect(code="methodShouldExist", level="error")
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
		@Expect(code="methodShouldExist", level="error")
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
    @Expect(code="methodShouldExist", level="error")
    (self.notImplemented())
  }
  method primitive()
}