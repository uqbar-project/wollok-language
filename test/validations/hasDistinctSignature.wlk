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
