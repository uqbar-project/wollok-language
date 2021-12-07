@Expect(code="shouldNotDefineUnusedVariables", level="warning")
class SomeClass {
  var unusedVariable = 0
  const usedVariable = 1000

  method calculatedValue() = usedVariable * 20
}

@Expect(code="shouldNotDefineUnusedVariables", level="warning")
object someObject {
  var unusedVariable = object {}
  const usedVariable = 1000

  method calculatedValue() = usedVariable * 20
}
