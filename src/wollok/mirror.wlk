class InstanceVariableMirror {
  const target
  const property name
  
  method value() = new ObjectMirror(target = target).resolve(name)
  
  method valueToString() {
    const value = self.value()
    return if (value == null) "null" else value.printString()
  }

  override method toString() = name + "=" + self.value()
}

/**
  * Represents an object capable of give information of another object.
  * It offers a reflection mechanism that is completely decoupled
  * from the object whose structure is being introspected. 
  */
class ObjectMirror {
  const target

  /*
   * Accesses a variable by name, in a reflexive way.
   */
  method resolve(attributeName) native

  /**
   * Retrieves a specific variable for target object. Expects a name
   */
  method instanceVariableFor(name) native

  /**
   * Answers a list of instance variables for target object
   */
  method instanceVariables() native
    
}