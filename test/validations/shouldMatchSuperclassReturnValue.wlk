class A {
	method giveMeANumber() {
		return 10
	}
}

class B inherits A {
	@Expect(code="shouldMatchSuperclassReturnValue", level="error", expectedOn="console.println(\"blah\")")
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
	@Expect(code="shouldMatchSuperclassReturnValue", level="error", expectedOn="console.println(\"blah\")")
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
	@Expect(code="shouldMatchSuperclassReturnValue", level="error", expectedOn="23")
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

// If in method - superclass
class SuperFilosofo {
  method iluminacion() = if (1 > 0) 3 else 5
}

class SuperFilosofoHijoOk inherits SuperFilosofo {
  override method iluminacion() = 4
}

//
class SuperFilosofo2 {
  method iluminacion() {
    return if (1 > 0) 3 else 5
  }
}

class SuperFilosofo2HijoOk inherits SuperFilosofo2 {
  override method iluminacion() = 4
}

//
class SuperFilosofo3 {
  method iluminacion() {
    if (1 > 0) {
      return 3
    }

    return 5
  }
}

class SuperFilosofo3HijoOk inherits SuperFilosofo3 {
  override method iluminacion() = 4
}

//
class SuperFilosofo4 {
  method iluminacion() {
    if (1 > 0) return 3 else return 5
  }
}

class SuperFilosofo4HijoOk inherits SuperFilosofo4 {
  override method iluminacion() = 4
}

// If in method - subclass
class Filosofo {
  method iluminacion() = 4
}

class FilosofoRotoOk inherits Filosofo {
	@Expect(code="shouldMatchSuperclassReturnValue", level="error", expectedOn="if (1 > 0) 3 else 5")
  override method iluminacion() {
    if (1 > 0) 3 else 5
  }
}

class FilosofoFeliz inherits Filosofo {
  override method iluminacion() {
    if (1 > 0) {
      return 3
    }

    return 5
  }
}

class FilosofoFeliz2 inherits Filosofo {
  override method iluminacion() = if (1 > 0) 3 else 5
}

class FilosofoFeliz3 inherits Filosofo {
  override method iluminacion() {
    return if (1 > 0) 3 else 5
  }
}

class FilosofoFeliz4 inherits Filosofo {
  override method iluminacion() {
    if (1 > 0) {
      return 3
    } else {
      return 5
    }
  }
}

// nested if - subclass
class Filosofo5 {
  method iluminacion() = 4
}

class Filosofo5Ok inherits Filosofo5 {
  var property a = 10

  override method iluminacion() =
    if (a > 0)
      if (a < 10) 3 else 5
    else
      if (a < 0)
        if (a === 0) 5 else 2
      else
        3

}

// nested if - superclass
class Filosofo6 {
  var property a = 10

  method iluminacion() =
    if (a > 0)
      if (a < 10) 3 else 5
    else
      if (a < 0)
        if (a === 0) 5 else 2
      else
        3
}

class Filosofo6Ok inherits Filosofo6 {
  override method iluminacion() = 4
}
