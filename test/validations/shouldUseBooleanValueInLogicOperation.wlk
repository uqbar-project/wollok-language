object pepita {
}

object p {
  method run() {        
    var cond = true
    cond = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="!pepita") !pepita

    cond = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="!new List()") !new List()   
    
    cond = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="not \"un poco de suerte\"") not "un poco de suerte"
      
    cond = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="! [1, 2, 3]") ! [1, 2, 3]
    
    cond = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="! #{1, 2, 3}") ! #{1, 2, 3}
    
    cond = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="! object {}") ! object {}
      
    cond = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="not { a => a.toString() }") not { a => a.toString() }
  }
}

object q {
  method run() {
    var value = false
    
    // AND / &&  (left)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="null && value") (null && value)

    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="2 && value") (2 && value)

    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="pepita && value") (pepita && value)

    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="new List() && value") (new List() && value)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="\"un poco de suerte\" && value") ("un poco de suerte" && value)
      
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="[1, 2, 3] && value") ([1, 2, 3] && value)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="#{1, 2, 3} && value") (#{1, 2, 3} && value)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="object {} and value") (object {} and value)
      
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="{ a => a.toString() } && value") ({ a => a.toString() } && value)

    // AND / &&  (right)
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="value and { a => a.toString() }") (value and { a => a.toString() })

    // OR / || (left)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="null || value") (null || value)

    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="2 or value") (2 or value)

    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="pepita || value") (pepita || value)

    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="new List() or value") (new List() or value)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="\"un poco de suerte\" && value") ("un poco de suerte" && value)
      
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="[1, 2, 3] || value") ([1, 2, 3] || value)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="#{1, 2, 3} or value") (#{1, 2, 3} or value)
    
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="object {} || value") (object {} || value)
      
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="{ a => a.toString() } or value") ({ a => a.toString() } or value)
    
    // OR / || (right)
    value = @Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="value || \"un poco de suerte\"") (value || "un poco de suerte")

  }
}

// Bad Conditions inside if
object r {
  method run() {
    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="!null") !null)
      throw new Exception(message = "asd")

    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="not null") not null)
      throw new Exception(message = "asd")

    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="!2") !2)
      throw new Exception(message = "asd")

    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="not 2") not 2)
      throw new Exception(message = "asd")

    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="!pepita") !pepita)
      throw new Exception(message = "asd")

    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="!new List()") !new List())
      throw new Exception(message = "asd")
    
    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="!\"un poco de suerte\"") !"un poco de suerte")
      throw new Exception(message = "asd")
      
    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="![1, 2, 3]") ![1, 2, 3])
      throw new Exception(message = "asd")
    
    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="!#{1, 2, 3}") !#{1, 2, 3})
      throw new Exception(message = "asd")  
    
    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="!object {}") !object {})
      throw new Exception(message = "asd")
      
    if (@Expect(code="shouldUseBooleanValueInLogicOperation", level="error", expectedOn="!{ a => a.toString() }") !{ a => a.toString() })   
      throw new Exception(message = "asd")  

  }
}