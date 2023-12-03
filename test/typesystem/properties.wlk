object propertiesTest {
	const property constante = 7
	var property variable = "hola"
	
	@Expect(type="(String) => Void")
	method initializedProperties(param) {
		@Expect(type="Number")
		const p1 = self.constante()
		
		@Expect(type="String")
		const p2 = self.variable()

		self.variable(param)
	}
}

object propertiesInferenceTest {
	@Expect(type="Number") // Based on use
	var property variable = null
	
	method uninitializedProperties() {
		self.variable(123)
		@Expect(type="Number")
		const p = self.variable()
	}
	
	method parametrizedProperties() {
		@Expect(type="PropertiesInferenceClass<Boolean>")
		const boolContainer = new PropertiesInferenceClass(notInitialized = true)
		@Expect(type="Boolean")
		const p1 = boolContainer.notInitialized()

		@Expect(type="PropertiesInferenceClass<Number>")
		const numberContainer = new PropertiesInferenceClass(notInitialized = 1)
		@Expect(type="Number")
		const p2 = numberContainer.notInitialized()
	}
}

@Type(variable="Param")
class PropertiesInferenceClass {
	@Type(name="Param")
	var property notInitialized
}
