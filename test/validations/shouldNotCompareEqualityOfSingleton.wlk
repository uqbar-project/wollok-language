object alpiste {}
object manzana {}
object mijo {}
const alfajor = object {}

object pepita {
  var energia = 100
  
  method comer(que) {
    if (@Expect(code="shouldNotCompareEqualityOfSingleton", level="warning", expectedOn="que == alpiste") (que == alpiste)) {
      energia += 5
    }

    if (@Expect(code="shouldNotCompareEqualityOfSingleton", level="warning", expectedOn="mijo == que") (mijo == que)) {
      energia += 5
    } else if (@Expect(code="shouldNotCompareEqualityOfSingleton", level="warning", expectedOn="que === manzana") (que === manzana))
        energia +=80

    // OK
    if (que == object {}) {
      energia += 100
    }

    // OK
    if (que == alfajor) {
      energia += 20
    }

    if (que==5)
      energia += 5
    else
      if(energia == que) energia +=80

  }
}
