object pepona {
	@Expect(type="Number")
	var energia = 0

	// FIXME - Remove type annotation
	@Expect(type="(Number) => Void")
	method vola(@Type(name="Number") kms) { energia -= kms + 10 }
	
	method energiaPepona() = 100
}

object arbol {
	method altura() = 999
}

object entrenador {
	@Expect(type="(pepona) => Number")
	method tomarEnergia(energetico) = energetico.energiaPepona()
	
	@Expect(type="() => Number")
	method prueba() = self.tomarEnergia(pepona)
	
	method prueba2() = self.tomarEnergia(@Expect(code="typeMismatch", level="warning", values=["pepona", "arbol"]) arbol)
	
	method prueba3() {
		pepona.vola(@Expect(code="typeMismatch", level="warning", values=["Number", "arbol"]) arbol)	
	}
}

