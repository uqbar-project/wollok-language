class Bird {
  var energy = 0

  @Expect(code="methodShouldHaveDifferentSignature", level="error")
  method eat(food) {
    energy = energy + food.energy()
  }

  @Expect(code="methodShouldHaveDifferentSignature", level="error")
  method eat(food) {
    energy = 200
  }

  // We can define a method with different arity
  method eat() {
    energy = 200
  }
}

object o {
	@Expect(code="methodShouldHaveDifferentSignature", level="error")
	method foo() { }
	@Expect(code="methodShouldHaveDifferentSignature", level="error")
	method foo() { }
	method foo(a) { }
	method foo(a, b) { }
	
	@Expect(code="methodShouldHaveDifferentSignature", level="error")
	method bar(a) { }
	@Expect(code="methodShouldHaveDifferentSignature", level="error")
	method bar(a) { }
	method bar(a, b) { }
	
	@Expect(code="methodShouldHaveDifferentSignature", level="error")
	method zoo(a,b,c) {}
	@Expect(code="methodShouldHaveDifferentSignature", level="error")
	method zoo(a,b,c) {}
	method zoo(a) {}
	method zoo(a,b) {}
	method zoo(a,b,c,d) {}
}

mixin M1 {
	@Expect(code="methodShouldHaveDifferentSignature", level="error")
	method foo() { }
	@Expect(code="methodShouldHaveDifferentSignature", level="error")
	method foo() { }
	method foo(a) { }
	method foo(a, b) { }
}
