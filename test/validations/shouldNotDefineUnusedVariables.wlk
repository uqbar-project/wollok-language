class SomeClass {
  @Expect(code="shouldNotDefineUnusedVariables", level="warning", expectedOn="unusedVariable")
  var unusedVariable = 0
  const usedVariable = 1000

  method calculatedValue() = usedVariable * 20
}

object someObject {
  @Expect(code="shouldNotDefineUnusedVariables", level="warning", expectedOn="unusedVariable")
  var unusedVariable = object {}
  const usedVariable = 1000

  method calculatedValue() = usedVariable * 20
}

// Happy paths
// Used by variable
object usedByAnotherVariable {
  const usedVariable = 6
  var property referencingVariable = usedVariable + 1
}

// Used by local variable
object usedByLocalVariable {
  const usedVariable = 6
  method methodUsingVariable() {
    const condition = usedVariable > 6
    return if (condition) 2 else 3
  }
}

// Used by return + if - condition branch
object usedByReturnCondition {
  const usedVariable = 6
  method methodUsingVariable() = if (usedVariable.even()) 3 else 2
}


// Used by return + if - if branch
object usedByReturnIf {
  const usedVariable = 6
  const anotherVariable = true
  method methodUsingVariable() = if (anotherVariable) usedVariable else 2
}

// Used by return + if - else branch
object usedByReturnElse {
  const usedVariable = 6
  const anotherVariable = true
  method methodUsingVariable() = if (anotherVariable) 2 else usedVariable
}

// Used by plain return
object usedByPlainReturn {
  const usedVariable = 6
  method methodUsingVariable() {
    return usedVariable
  }
}

// Used by assignment (inside if)
object usedByAssignment {
  var usedVariable = 6
  method methodUsingVariable() {
    if (1.randomUpTo(5) < 3) {
      usedVariable = 10
    }
  }
}

// Used by reference
object usedByReference {
  const usedVariable = 6
  method methodUsingVariable() = usedVariable * 2
}

// Used by sending a message
object usedBySendingAMessage {
  const usedVariable = 6
  method methodUsingVariable() = usedVariable.even()
}

// Used by parameter while sending a message
object usedByParameterSendingAMessage {
  const usedVariable = 6
  method methodUsingVariable() = 2.max(usedVariable)
}

// Used by named parameter in new
object usedByParameterInNew {
  const usedVariable = 6
  method methodUsingVariable() = new Date(day = usedVariable, month = 11, year = 2021)
}

// Used by throw
object usedByThrow {
  const usedVariable = "There was an error"
  method methodUsingVariable() {
    throw new Exception(message = usedVariable)
  }
}

// Used by try/catch - try branch
object usedByTryBranch {
  var usedVariable = 5
  method methodUsingVariable() {
    try {
      usedVariable = 6
      return 1
    } catch e: Exception {
      return 2
    }
  }
}

// Used by try/catch - catch branch
object usedByCatchBranch {
  var usedVariable = 5
  method methodUsingVariable() {
    try {
      return 1
    } catch e: Exception {
      usedVariable = 6
      return 2
    }
  }
}

// Used by try/catch - always branch
object usedByAlwaysBranch {
  var usedVariable = 5
  method methodUsingVariable() {
    try {
      return 1
    } catch e: Exception {
      return 2
    } then always {
      usedVariable = 6
    }
  }
}

// Used by closure/block
class Tour {
  var property fechaSalida = new Date()
  var property montoTotal = 0
}

object reportes {

	const property tours = []

	const currentYear = new Date().year()
	
	method totalToursDelAnio() = tours.filter{ tour => tour.fechaSalida().year() == currentYear }.sum{ tour => tour.montoTotal() }

}

// A const property with native methods
class ObjectMirrorStub {
  const property target

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

object o {
  const a = 1
  // a is used in assignment
  const property b = a
}