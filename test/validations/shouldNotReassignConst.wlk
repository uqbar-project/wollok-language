/* ================================================================================
 * - a class with several methods
 * - you cannot reassign const references, or parameters
 * ===============================================================================*/

class SomeClass {
  const constReference = 1
  var varReference = 1

  method tryingToChangeConstReference() {
    @Expect(code = "shouldNotReassignConst", level = "error")
    constReference = 2
    varReference = 2
  }

  method methodWithBlock() {
    const aBlock = { a =>
      @Expect(code = "shouldNotReassignConst", value = "error", expectedOn = "a")
      a = 23
    }
    @Expect(code = "shouldNotReassignConst", value = "error", expectedOn = "aBlock")
    aBlock = null
  }
  
  method methodWithParam(aParam) {
    @Expect(code = "shouldNotReassignConst", value = "error", expectedOn = "aParam")
    aParam = 23
  }

}

/* ================================================================================
 * - a hierarchy of classes
 * - several methods initialize: const cannot be reassigned, while vars are allowed
 * ===============================================================================*/

class A {
  const property a = 2
  
  override method initialize() {
    @Expect(code = "shouldNotReassignConst", value = "error", expectedOn = "a")
    a = 1
  }
}

class B inherits A {
  var property b

  override method initialize() {
    super()
    b = 2
  }
}

class C {
  var property a = 1
  const property b
  
  override method initialize() {
    @Expect(code = "shouldNotReassignConst", value = "error", expectedOn = "b")
    b = a + 1
  }
}

/* ================================================================================
 * - multiops operators
 * ===============================================================================*/

class MultiOpsOperations {
  
  method run() {
    var n = 1
    n = n + 1  // OK
    
    const m = 1
    @Expect(code = "shouldNotReassignConst", value = "error", expectedOn = "m")
    m -= 3

    @Expect(code = "shouldNotReassignConst", value = "error", expectedOn = "m")
    m += 3
  }  
}
