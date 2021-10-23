object pepita {}

object p {
  method run() {
    var a = 2
    const b = 2

    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (null)
      throw new Exception(message = "asd")

    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (2)
      throw new Exception(message = "asd")
        
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (pepita)
      throw new Exception(message = "asd")

    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (new List())   
      throw new Exception(message = "asd")
    
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if ("un poco de suerte")   
      throw new Exception(message = "asd")
      
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if ([1, 2, 3])   
      throw new Exception(message = "asd")
    
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (#{1, 2, 3})   
      throw new Exception(message = "asd")  
    
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (object {})   
      throw new Exception(message = "asd")
      
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
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

object q {
  method run() {
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (!null)
      throw new Exception(message = "asd")

    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (not null)
      throw new Exception(message = "asd")

    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (!2)
      throw new Exception(message = "asd")

    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (not 2)
      throw new Exception(message = "asd")

    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (!pepita)
      throw new Exception(message = "asd")

    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (!new List())   
      throw new Exception(message = "asd")
    
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (!"un poco de suerte")   
      throw new Exception(message = "asd")
      
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (![1, 2, 3])   
      throw new Exception(message = "asd")
    
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (!#{1, 2, 3})   
      throw new Exception(message = "asd")  
    
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (!object {})   
      throw new Exception(message = "asd")
      
    @Expect(code="shouldUseBooleanValueInIfCondition", level="error")
    if (!{ a => a.toString() })   
      throw new Exception(message = "asd")  

  }
}