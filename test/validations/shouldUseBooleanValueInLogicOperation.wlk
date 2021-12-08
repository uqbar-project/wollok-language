object pepita {
}

object p {
  method run() {        
    var cond = true
    cond = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") !pepita

    cond = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") !new List()   
    
    cond = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") not "un poco de suerte"
      
    cond = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") ! [1, 2, 3]
    
    cond = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") ! #{1, 2, 3}
    
    cond = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") ! object {}
      
    cond = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") not { a => a.toString() }
  }
}

object q {
  method run() {
    var value = false
    
    // AND / &&  (left)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") (null && value)

    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") (2 && value)

    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") (pepita && value)

    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") (new List() && value)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") ("un poco de suerte" && value)
      
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") ([1, 2, 3] && value)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") (#{1, 2, 3} && value)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") (object {} and value)
      
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") ({ a => a.toString() } && value)

    // AND / &&  (right)
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") (value and { a => a.toString() })

    // OR / || (left)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") (null || value)

    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") (2 or value)

    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") (pepita || value)

    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") (new List() or value)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") ("un poco de suerte" && value)
      
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") ([1, 2, 3] || value)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") (#{1, 2, 3} or value)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") (object {} || value)
      
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") ({ a => a.toString() } or value)
    
    // OR / || (right)
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error") (value || "un poco de suerte")

  }
}

// Bad Conditions inside if
object r {
  method run() {
    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error") !null)
      throw new Exception(message = "asd")

    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error") not null)
      throw new Exception(message = "asd")

    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error") !2)
      throw new Exception(message = "asd")

    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error") not 2)
      throw new Exception(message = "asd")

    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error") !pepita)
      throw new Exception(message = "asd")

    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error") !new List())   
      throw new Exception(message = "asd")
    
    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error") !"un poco de suerte")   
      throw new Exception(message = "asd")
      
    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error") ![1, 2, 3])   
      throw new Exception(message = "asd")
    
    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error") !#{1, 2, 3})   
      throw new Exception(message = "asd")  
    
    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error") !object {})   
      throw new Exception(message = "asd")
      
    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error") !{ a => a.toString() })   
      throw new Exception(message = "asd")  

  }
}