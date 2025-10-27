class Ave {
	@Expect(type="String")
	var property nombre
	var energia = 100
	
	@Expect(type="(Number) => Void")
	method come(gramos) {
		energia = energia + gramos 
	}
	
	@Expect(type="() => Number")
	method energia() = energia
}

class Golondrina inherits Ave {
	
	@Expect(type="() => Void")
	method vola() {
		energia = energia - 10 
	}
	
	@Expect(type="(Number) => Void")
	override method come(gramos) {
		super(gramos + 10) 
	}
}

class GolondrinaMentirosa inherits Golondrina {

	@Expect(type="() => Number")
	override method energia() = super() + 10
}

class EntrenadorChanta inherits EntrenadorDeGolondrinas {
	@Expect(type="(Ave) => Void")
	override method alimentar(_ave) { 
		super(new GolondrinaMentirosa(nombre = "Claudia", energia = 1))
	}
	
	// @Expect(type="(Golondrina) => Void")
	override method hacerQueVuele(golondrina) {
		golondrina.come(1)
		super(golondrina)
	}
	
	@Expect(type="() => GolondrinaMentirosa")
	override method pajaro() {
		@Expect(type="Golondrina")
		const p = super()
		return new GolondrinaMentirosa(nombre = "Claudia", energia = 1)
	} 
}

class EntrenadorDeGolondrinas inherits EntrenadorDeAves {
	@Expect(type="(Ave) => Void")
	override method alimentar(_ave) { 
		super(new Golondrina(nombre = "Edmundo"))
	}
	
	@Expect(type="(Golondrina) => Void")
	method hacerQueVuele(golondrina) {
		golondrina.vola()
	} 
	
	@Expect(type="() => Golondrina")
	override method pajaro() {
		@Expect(type="Ave")
		const a = super()
		return new Golondrina(nombre = "Firulais")
	}
	
	method hacerVolarGolondrina() { self.hacerQueVuele(new Golondrina(nombre = "Pedro")) }
}

class EntrenadorDeAves {
	const ave
	
	@Expect(type="(Golondrina) => Void")
	method alimentar(unAve) { unAve.come(10) }
	
	@Expect(type="() => Ave")
	method pajaro() = new Ave(nombre = "Pedro")
	
	method alimentarFavorita() { ave.come(1) }
}

object escuela {
	method entrenadorDeAves() = new EntrenadorDeAves(ave = new Ave(nombre = "Pedro"))
	method entrenadorDeGolondrinas() = new EntrenadorDeGolondrinas(ave = new Golondrina(nombre = "Pedro"))
}
