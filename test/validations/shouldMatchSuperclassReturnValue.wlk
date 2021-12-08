class A {
	method giveMeANumber() {
		return 10
	}
}

class B inherits A {
	@Expect(code="shouldMatchSuperclassReturnValue", level="error")
  override method giveMeANumber() { console.println("blah") }
}

class C inherits A {
	override method giveMeANumber() { 
		return 0
	}
}

class D inherits C {
}

class E inherits D {
	@Expect(code="shouldMatchSuperclassReturnValue", level="error")
	override method giveMeANumber() { console.println("blah") }
}

class F inherits A {
	override method giveMeANumber() = 6
}


// OPPOSITE CASE: adding a return to a non-return method

class Z {
	method doSomething() {
		console.println("Blah")
	}
}

class Y inherits Z {
	@Expect(code="shouldMatchSuperclassReturnValue", level="error")
	override method doSomething() {
		return 23
	}	
}


// OVERRIDING ABSTRACTS WON'T CHECK

class M {
	method anAbstractMethod()	
}

// returns
class N inherits M {
	override method anAbstractMethod() { return 2 }
}

// doesn't return
class O inherits M {
	override method anAbstractMethod() { console.println("blah") }
}

// return shortcut
class P inherits M {
	override method anAbstractMethod() = 2
}


///  case where overriding method throws exception should raise an error

class Persona {
  method quiereSubirA(unMicro) {
    return false
  }
}
class Indeciso inherits Persona {
  override method quiereSubirA(unMicro) {
    throw new Exception()
  }
}

class WithoutReturnMethod {
  var x
  method myMethod(){
    x = 3
  }	
}
class WithReturnMethod inherits WithoutReturnMethod {
  override method myMethod(){
    throw new Exception()
  }
}