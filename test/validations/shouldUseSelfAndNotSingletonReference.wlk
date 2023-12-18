object pepita {
  var energy = 100
  var property friend = @Expect(code="shouldUseSelfAndNotSingletonReference", level="warning", expectedOn="pepita") (pepita)

  method fly(kilometers) {
    energy = energy - (kilometers * 2)
  }

  method eat(grams) {
    energy = energy + (grams * 4)
  }

  method enjoy() {
    @Expect(code="shouldUseSelfAndNotSingletonReference", level="warning", expectedOn="pepita")
    pepita.eat(5)

    @Expect(code="shouldUseSelfAndNotSingletonReference", level="warning", expectedOn="pepita") (pepita)

    self.eat(1)

    self.friend(@Expect(code="shouldUseSelfAndNotSingletonReference", level="warning", expectedOn="pepita") pepita)
  }
}
