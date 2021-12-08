object someObject {
  
  method unnecesaryIfBothReturnFalse(n) {
    @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning")
    if (n % 2 == 0)
      return false
    else
      return false
  }

  method unnecesaryIfBothReturnTrue(n) {
    @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning")
    if (n % 2 == 0)
      return true
    else
      return true
  }

  method unnecesaryIfBothReturnTrueFirstExpression(n) {
    return @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning") if (n % 2 == 0)
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
    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning") (true && algo)

    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning") (true and algo)

    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning") (algo && true)
    
    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning") (algo and true)

    //
    // OR
    //
    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning") (false || algo)
    
    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning") (false or algo)

    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning") (algo || false)

    cond = @Expect(code="shouldNotDefineUnnecessaryCondition", level="warning") (algo or false)
  }
}