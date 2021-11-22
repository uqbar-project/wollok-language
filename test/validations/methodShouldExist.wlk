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