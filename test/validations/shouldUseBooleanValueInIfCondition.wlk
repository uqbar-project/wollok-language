object pepita {}

object p {
  method run() {
    var a = 2
    const b = 2

    a = a + 1
    
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error", expectedOn="null")
    if (null)
      throw new Exception(message = "asd")

    @Expect(code="shouldUseBooleanValueInIfCondition", level="error", expectedOn="2")
    if (2)
      throw new Exception(message = "asd")
        
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error", expectedOn="pepita")
    if (pepita)
      throw new Exception(message = "asd")

    @Expect(code="shouldUseBooleanValueInIfCondition", level="error", expectedOn="new List()")
    if (new List())   
      throw new Exception(message = "asd")
    
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error", expectedOn="\"un poco de suerte\"")
    if ("un poco de suerte")   
      throw new Exception(message = "asd")
      
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error", expectedOn="[1, 2, 3]")
    if ([1, 2, 3])   
      throw new Exception(message = "asd")
    
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error", expectedOn="#{1, 2, 3}")
    if (#{1, 2, 3})   
      throw new Exception(message = "asd")  
    
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error", expectedOn="object {}")
    if (object {})   
      throw new Exception(message = "asd")
      
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error", expectedOn="{ a => a.toString() }")
    if ({ a => a.toString() })   
      throw new Exception(message = "asd")  

    // *************************************
    // PENDING once we have a type system
    // *************************************
    
    //  errors --> "Expecting a boolean" at "2+2"
    if (2+2)
      throw new Exception(message = "asd")

  }

}
