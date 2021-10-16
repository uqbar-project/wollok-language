class Levadura {
	const biomasa = 100
	
	method getBiomasa() = biomasa
}

class Ale inherits Levadura {
	@Expect(code="shouldNotDuplicateVariables", level="error")
	const biomasa = 200
	
	method algoConBiomasaParaEvitarWarning() {
		return biomasa
	}
}

class B inherits Levadura {
	
}

/**
 * self one duplicates a var that is two levels up
 */
class C inherits B {
	@Expect(code="shouldNotDuplicateVariables", level="error")
	const biomasa = 200
	
		method algoConBiomasaParaEvitarWarning() {
		return biomasa
	}
}

// same for objects
object anObject inherits Levadura {
	@Expect(code="shouldNotDuplicateVariables", level="error")
	const biomasa = 200
	
		method algoConBiomasaParaEvitarWarning() {
		return biomasa
	}
}
