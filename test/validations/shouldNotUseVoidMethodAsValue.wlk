object pepita {
	var energy = 0

	// self is the void method	
	method eat(something) {
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
		// XPECT errors --> "Message send "eat(10)" produces no value (missing return in method?)" at "eat"
		self.setA(pepita.eat(10))
	}
	
	method initialization(aParam) {
		// XPECT errors --> "Message send "eat(10)" produces no value (missing return in method?)" at "eat"
		const a = pepita.eat(10)
		
		self.setA(a)
	}
	
	method assignment(aParam) {
		var a = null
		
		// XPECT errors --> "Message send "eat(10)" produces no value (missing return in method?)" at "eat"
		a = pepita.eat(10)
		
		self.setA(a)
	}
	
	method asReturnValue() {
		// XPECT errors --> "Message send "eat(10)" produces no value (missing return in method?)" at "eat"
		return pepita.eat(10)
	}
	
	method asAnIfCondition() {
		// XPECT errors --> "Message send "eat(10)" produces no value (missing return in method?)" at "eat"
		return if (pepita.eat(10))
			20
		else 
			30	
	}
	
	method asABinaryOperatorArgument() {
		const cond = true
		return [
			// XPECT errors --> "Message send "eat(10)" produces no value (missing return in method?)" at "eat"
			10 + pepita.eat(10),
			// XPECT errors --> "Message send "eat(10)" produces no value (missing return in method?)" at "eat"
			10 * pepita.eat(10),
			// XPECT errors --> "Message send "eat(10)" produces no value (missing return in method?)" at "eat"
			cond && pepita.eat(10),
			// XPECT errors --> "Message send "eat(10)" produces no value (missing return in method?)" at "eat"
			cond || pepita.eat(10)
		]
	}
	
	method asTargetForNewMessageSend() {
		// XPECT errors --> "Message send "eat(10)" produces no value (missing return in method?)" at "eat"
		pepita.eat(10).cantina() 
	}
	
	method asListLiteralElement() {
		// XPECT errors --> "Message send "eat(10)" produces no value (missing return in method?)" at "eat"
		return [1, 2, 3, pepita.eat(10)] 
	}
	
	override method toBeOverriden(a) {
		// XPECT errors --> "Message send "eat(10)" produces no value (missing return in method?)" at "eat"
		super(pepita.eat(10))
	}
	
	method asConstructorArg() {
		// XPECT errors --> "Message send "eat(10)" produces no value (missing return in method?)" at "eat"
		return new B(a = pepita.eat(10)) 
	}
	
	// XPECT errors --> "Message send "eat(10)" produces no value (missing return in method?)" at "eat"
	method asExpressionOnMethodShortcut() = pepita.eat(10) 
}

class B {
	var property a
}
