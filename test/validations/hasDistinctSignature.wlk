class Bird {
  var energy = 0

  @Expect(code="hasDistinctSignature", level="error")
  method eat(food) {
    energy = energy + food.energy()
  }

  @Expect(code="hasDistinctSignature", level="error")
  method eat(food) {
    energy = 200
  }

  // We can define a method with different arity
  method eat() {
    energy = 200
  }
}

object o {
	@Expect(code="hasDistinctSignature", level="error")
	method foo() { }
	@Expect(code="hasDistinctSignature", level="error")
	method foo() { }
	method foo(a) { }
	method foo(a, b) { }
	
	@Expect(code="hasDistinctSignature", level="error")
	method bar(a) { }
	@Expect(code="hasDistinctSignature", level="error")
	method bar(a) { }
	method bar(a, b) { }
	
	@Expect(code="hasDistinctSignature", level="error")
	method zoo(a,b,c) {}
	@Expect(code="hasDistinctSignature", level="error")
	method zoo(a,b,c) {}
	method zoo(a) {}
	method zoo(a,b) {}
	method zoo(a,b,c,d) {}
}

mixin M1 {
	@Expect(code="hasDistinctSignature", level="error")
	method foo() { }
	@Expect(code="hasDistinctSignature", level="error")
	method foo() { }
	method foo(a) { }
	method foo(a, b) { }
}
