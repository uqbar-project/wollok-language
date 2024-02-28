mixin M1 {
   method m() {
   	  self.doIt()      // expected abstract method
   }
   method doIt()
}

class C inherits M1 {} // should be considered abstract

class D inherits C {}


mixin M2 {}

class E inherits M2 and D {}

mixin M3 {
	method blah() { self.sarasa() }
	method sarasa()
}

class F inherits M3 and E {}

mixin DoIt {
	method doIt() {}
}

class G inherits DoIt and E {}

class DoItClass {
	method doIt() {}
}

class H inherits M2 and DoItClass {}

class I inherits M2 {
	method doIt() {}
}

// checks mixin must explicitly tell required methods
mixin M4 {
	method blah() {
	}
}

//
// Mixin Calling super() mixed in different combination
//  checks for super implementation present
//
mixin Doctor {
	override method name() = "Dr. " + super()
}

@Expect(code = "shouldImplementAllMethodsInHierarchy", level = "error", expectedOn="Tomato")
class Tomato inherits Doctor {}

@Expect(code = "shouldImplementAllMethodsInHierarchy", level = "error", expectedOn="TomatoWithNameBelowSuper")
class TomatoWithNameBelowSuper inherits Doctor {
	override method name() = "23"
}

mixin Named {
	method name() = "a name"
}

// OK !
class Person inherits Doctor and Named {}

// NOT OK ! order matters !
@Expect(code = "shouldImplementAllMethodsInHierarchy", level = "error", expectedOn="PersonBad")
class PersonBad inherits Named and Doctor {}

// OK: super method comes from super class
class WithName {
	method name() = "name on a class"
}
class ANamed inherits Doctor and WithName {
}

@Expect(code = "shouldImplementAllMethodsInHierarchy", level = "error", expectedOn="o1")
object o1 inherits Doctor {
}

// OK
object o2 inherits Doctor and WithName {
}

// OK
object o3 inherits Doctor and Named {}

@Expect(code = "shouldImplementAllMethodsInHierarchy", level = "error", expectedOn="o4")
object o4 inherits Named and Doctor {}


//
// Instantiation Time Mixins
//
class Pepin {}

object mixingAtInstantiation {
	method doIt() {
		
		return [
			// OK
			object inherits Doctor and WithName {},
			@Expect(code = "shouldImplementAllMethodsInHierarchy", level = "error", expectedOn="object inherits Doctor {}")
			object inherits Doctor {},
			
			// OK 
			object inherits Doctor and Named and Pepin {},
			@Expect(code = "shouldImplementAllMethodsInHierarchy", level = "error", expectedOn="object inherits Named and Doctor and Pepin {}")
			object inherits Named and Doctor and Pepin {}
		]
	}
}

// Superclass with an abstract method
class Superclass {
	method myMethod(someParameter)
}

// Concrete class should not call to super if method in superclass is abstract
@Expect(code = "shouldImplementAllMethodsInHierarchy", level = "error", expectedOn="ConcreteClass")	
class ConcreteClass inherits Superclass {

	method doStuff() {}

	override method myMethod(someParameter) {
		self.doStuff()
		super(someParameter)
	}
}