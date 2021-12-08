/* ================================================================================
 * - a class with several methods
 * - you cannot reassign const references, or parameters
 * ===============================================================================*/

class SomeClass {
  const constReference = 1
  var varReference = 1

  method tryingToChangeConstReference() {
    @Expect(code = "shouldNotReassignConst", value = "error")
    constReference = 2
    varReference = 2
  }

  method methodWithBlock() {
    const aBlock = { a =>
      @Expect(code = "shouldNotReassignConst", value = "error")
      a = 23
    }
    @Expect(code = "shouldNotReassignConst", value = "error")
    aBlock = null
  }
  
  method methodWithParam(aParam) {
    @Expect(code = "shouldNotReassignConst", value = "error")
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
		@Expect(code = "shouldNotReassignConst", value = "error")
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
    @Expect(code = "shouldNotReassignConst", value = "error")
		b = a + 1
	}
}
