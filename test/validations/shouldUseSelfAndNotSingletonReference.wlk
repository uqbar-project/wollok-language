object pepita {
  var energy = 100

  method fly(kilometers) {
    energy = energy - (kilometers * 2)
  }

  method eat(grams) {
    energy = energy + (grams * 4)
  }

  method enjoy() {
    @Expect(code="shouldUseSelfAndNotSingletonReference", level="warning") (pepita.eat(5))

    @Expect(code="shouldUseSelfAndNotSingletonReference", level="warning") (pepita.fly(2))

    self.eat(1)
  }
}
