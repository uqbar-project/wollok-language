object pepita {
}

object p {
  method run() {
    @Expect(code="ifShouldHaveReachableCode", level="error")
    if (true)
      throw new Exception(message = "asd")
    else 
      throw new Exception(message = "else")
          
    @Expect(code="ifShouldHaveReachableCode", level="error")
    if (false)
      throw new Exception(message = "asd")
    else 
      throw new Exception(message = "else")  
    }
}