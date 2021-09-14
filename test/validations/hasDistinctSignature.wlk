class Bird {
  var energy = 0

  @Expect(code="hasDistinctSignature", level="error")
  method eat(food) {
    energy = energy + food.energy()
  }

  @Expect(code="hasDistinctSignature", level="error")
  override method eat(food) {
    energy = 200
  }

  // Podemos definir un método con diferente aridad
  override method eat() {
    energy = 200
  }
}
