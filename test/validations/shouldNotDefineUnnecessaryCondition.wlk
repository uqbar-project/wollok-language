object someObject {
  
  method unnecesaryIfBothReturnFalse(n) {
    @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning", expectedOn="if (n % 2 == 0)
      return false
    else
      return false")
    if (n % 2 == 0)
      return false
    else
      return false
  }

  method unnecesaryIfBothReturnTrue(n) {
    @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning", expectedOn="if (n % 2 == 0)
      return true
    else
      return true")
    if (n % 2 == 0)
      return true
    else
      return true
  }

  method unnecesaryIfBothReturnTrueFirstExpression(n) {
    return @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning", expectedOn="if (n % 2 == 0)
      { return true }
    else
      { return true }") if (n % 2 == 0)
      { return true }
    else
      { return true }
  }
}

object p {
  method run() {
    var cond = true
    const algo = true
      
    //
    // AND
    //
    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning", expectedOn="true && algo") (true && algo)

    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning", expectedOn="true and algo") (true and algo)

    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning", expectedOn="algo && true") (algo && true)
    
    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning", expectedOn="algo and true") (algo and true)

    //
    // OR
    //
    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning", expectedOn="false || algo") (false || algo)
    
    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning", expectedOn="false or algo") (false or algo)

    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning", expectedOn="algo || false") (algo || false)

    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning", expectedOn="algo or false") (algo or false)
  }
}