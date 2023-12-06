
@Expect(code="nameShouldBeginWithLowercase", level="warning", expectedOn="SomeObject")
object SomeObject {}

object pepita {
  var energy = 100
  @Expect(code="nameShouldBeginWithLowercase", level="warning", expectedOn="FlyCount")
  var FlyCount = 1

  method fly(@Expect(code="nameShouldBeginWithLowercase", level="warning", expectedOn="Minutes") Minutes) {
    FlyCount = FlyCount + 1
    energy = energy - (4 * Minutes)
  }

  method eat(grams) {
    const doubleGrams = grams * 2
    @Expect(code="nameShouldBeginWithLowercase", level="warning", expectedOn="Total")
    var Total = doubleGrams + 100
    Total = Total / energy
    energy = energy + Total
  }
}

