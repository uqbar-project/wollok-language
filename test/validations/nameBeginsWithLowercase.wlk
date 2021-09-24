
@Expect(code="nameBeginsWithLowercase", level="warning")
object SomeObject {}

object pepita {
  var energy = 100
  @Expect(code="nameBeginsWithLowercase", level="warning")
  var FlyCount = 1

  method fly(@Expect(code="nameBeginsWithLowercase", level="warning") Minutes) {
    FlyCount = FlyCount + 1
    energy = energy - (4 * Minutes)
  }

  method eat(grams) {
    var doubleGrams = grams * 2
    @Expect(code="nameBeginsWithLowercase", level="warning")
    var Total = doubleGrams + 100
    energy = energy + Total
  }
}

