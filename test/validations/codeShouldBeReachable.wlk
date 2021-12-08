object pepita {
}

object p {
  method testingIfWithUnreachableCode() {
    @Expect(code="codeShouldBeReachable", level="error")
    if (true)
      throw new Exception(message = "asd")
    else 
      throw new Exception(message = "else")
          
    @Expect(code="codeShouldBeReachable", level="error")
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
    cond = @Expect(code="codeShouldBeReachable", level="error") (false and algo)

    cond = @Expect(code="codeShouldBeReachable", level="error") (false && algo)

    //
    // OR
    //
    cond = @Expect(code="codeShouldBeReachable", level="error") (true or algo)

    cond = @Expect(code="codeShouldBeReachable", level="error") (true || algo)
  }
}
