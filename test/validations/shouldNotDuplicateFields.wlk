class Levadura {
	const biomasa = 100
	
	method getBiomasa() = biomasa
}

class Ale inherits Levadura {
	@Expect(code="shouldNotDuplicateFields", level="error")
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
	@Expect(code="shouldNotDuplicateFields", level="error")
	const biomasa = 200
	
		method algoConBiomasaParaEvitarWarning() {
		return biomasa
	}
}

// same for objects
object anObject inherits Levadura {
	@Expect(code="shouldNotDuplicateFields", level="error")
	const biomasa = 200
	
		method algoConBiomasaParaEvitarWarning() {
		return biomasa
	}
}

class Ave {
  var energia = 100
  method comer() { energia = energia + 50 }
}

mixin Volador {
  var property kilometros = 0
  method volar() { kilometros = kilometros + 100 }
}

// the singleton definition is ok since the problem will appear on the variable definition
object pepona inherits Volador and Ave {
  @Expect(code="shouldNotDuplicateFields", level="error")
  var energia = 120
}
