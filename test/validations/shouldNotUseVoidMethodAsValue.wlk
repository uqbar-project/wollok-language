object pepita {
	var energy = 0

	// self is the void method	
	method ingest(something) {
		energy -= something
	}

}

class A {
	method toBeOverriden(a) {}
}

class MethodsCalledOnWellKnowObjects inherits A {
	var e
	method setA(a) { e = a }

	
	method asParameter() {
		self.setA(@Expect(code = "shouldNotUseVoidMethodAsValue", message = "error", expected="pepita.ingest(10)") (pepita.ingest(10)))
	}
	
	method initialization(aParam) {
		const a = @Expect(code = "shouldNotUseVoidMethodAsValue", message = "error", expected="pepita.ingest(10)") (pepita.ingest(10))
		
		self.setA(a)
	}
	
	method assignment(aParam) {
		var a = null
		
		a = @Expect(code = "shouldNotUseVoidMethodAsValue", message = "error", expected="pepita.ingest(10)") (pepita.ingest(10))
		
		self.setA(a)
	}
	
	method asReturnValue() {
		return @Expect(code = "shouldNotUseVoidMethodAsValue", message = "error", expected="pepita.ingest(10)") (pepita.ingest(10))
	}
	
	method asAnIfCondition() {
		return if (@Expect(code = "shouldNotUseVoidMethodAsValue", message = "error", expected="pepita.ingest(10)") (pepita.ingest(10)))
			20
		else 
			30	
	}
	
	method asABinaryOperatorArgument() {
		const cond = true
		return [
			10 + @Expect(code = "shouldNotUseVoidMethodAsValue", message = "error", expected="pepita.ingest(10)") (pepita.ingest(10)),
			10 * @Expect(code = "shouldNotUseVoidMethodAsValue", message = "error", expected="pepita.ingest(10)") (pepita.ingest(10)),
			cond && @Expect(code = "shouldNotUseVoidMethodAsValue", message = "error", expected="pepita.ingest(10)") (pepita.ingest(10)),
			cond || @Expect(code = "shouldNotUseVoidMethodAsValue", message = "error", expected="pepita.ingest(10)") (pepita.ingest(10))
		]
	}
	
	method asTargetForNewMessageSend() {
		(@Expect(code = "shouldNotUseVoidMethodAsValue", message = "error", expected="pepita.ingest(10)") (pepita.ingest(10))).cantina() 
	}
	
	method asListLiteralElement() {
		return [1, 2, @Expect(code = "shouldNotUseVoidMethodAsValue", message = "error", expected="pepita.ingest(10)") (pepita.ingest(10))]
	}
	
	override method toBeOverriden(a) {
		super(@Expect(code = "shouldNotUseVoidMethodAsValue", message = "error", expected="pepita.ingest(10)") (pepita.ingest(10)))
	}
	
	method asConstructorArg() {
		return new B(a = @Expect(code = "shouldNotUseVoidMethodAsValue", message = "error", expected="pepita.ingest(10)") (pepita.ingest(10)))
	}
	
	method asExpressionOnMethodShortcut() = (@Expect(code = "shouldNotUseVoidMethodAsValue", message = "error", expected="pepita.ingest(10)") (pepita.ingest(10)))
}

class B {
	var property a
}
