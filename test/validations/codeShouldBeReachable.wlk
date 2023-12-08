object pepita {
}

object p {
  method testingIfWithUnreachableCode() {
    @Expect(code="codeShouldBeReachable", level="error", expectedOn="throw new Exception(message = \"else\")\n          \n    ")
    if (true)
      throw new Exception(message = "asd")
    else 
      throw new Exception(message = "else")
          
    @Expect(code="codeShouldBeReachable", level="error", expectedOn="throw new Exception(message = \"asd\")\n    ")
    if (false)
      throw new Exception(message = "asd")
    else 
      throw new Exception(message = "else")  
  }

   method testingBooleanBinaryOperationsWithUnreachableCode() {
    var cond = true
    const algo = true
      
    //
    // AND
    //
    cond = @Expect(code="codeShouldBeReachable", level="error", expectedOn="algo") (false and algo)

    cond = @Expect(code="codeShouldBeReachable", level="error", expectedOn="algo") (false && algo)

    //
    // OR
    //
    cond = @Expect(code="codeShouldBeReachable", level="error", expectedOn="algo") (true or algo)

    cond = @Expect(code="codeShouldBeReachable", level="error", expectedOn="algo") (true || algo)
  }
}
