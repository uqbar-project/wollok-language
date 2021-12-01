class A {
	const age = 2
	
	method getFirstName() { return "John" }
	method getLastName() = "Doe"
	
	@Expect(code = "getterMethodShouldReturnAValue", value = "warning")
	method age() { console.println("blah") }

	// this are not getters	
	method geton() { console.println("blah") }
	method get() { console.println("blah") }
	method ungetBlah() { console.println("blah") }
	method showAge() { console.println(age) }
}

class AbstractClass {
  const someVariable = 10
  const usingNative = true

  method someVariable() // OK, it is abstract
  method usingNative() native
}

// same goes for objects
object anObject {
	const age = 23
	
	method getFirstName() { return "John" }
	method getLastName() = "Doe"
	
	@Expect(code = "getterMethodShouldReturnAValue", value = "warning")
	method age() { console.println("blah") }

	// this are not getters	
	method geton() { console.println("blah") }
	method get() { console.println("blah") }
	method ungetBlah() { console.println("blah") }
	method showAge() { console.println(age) }
}
