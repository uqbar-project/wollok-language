
@Expect(code="nameShouldBeginWithLowercase", level="warning")
object SomeObject {}

object pepita {
  var energy = 100
  @Expect(code="nameShouldBeginWithLowercase", level="warning")
  var FlyCount = 1

  method fly(@Expect(code="nameShouldBeginWithLowercase", level="warning") Minutes) {
    FlyCount = FlyCount + 1
    energy = energy - (4 * Minutes)
  }

  method eat(grams) {
    var doubleGrams = grams * 2
    @Expect(code="nameShouldBeginWithLowercase", level="warning")
    var Total = doubleGrams + 100
    energy = energy + Total
  }
}

