object pepe {
	@Expect(type="(cadete | gerente)")
	var categoria = cadete
	
	@Expect(type="((cadete | gerente)) => Void")
	method cambiarCategoria(otraCategoria) {
		categoria = otraCategoria
	}

	@Expect(type="() => Number")
	method sueldo() {
		return categoria.sueldoBase()
	}
}

object cadete {
	method sueldoBase() {
		return 20
	}
}

object gerente {
	method sueldoBase() {
		return 40
	}
}

object pepeFijo {
	@Expect(type="cadete")
	const categoria = cadete
	
	@Expect(type="() => Number")
	method sueldo() {
		return categoria.sueldoBase()
	}
}

object pepeConProperty {
	@Expect(type="(cadete | gerente)")
	var property categoria = cadete
	
	@Expect(type="() => Number")
	method sueldo() {
		return categoria.sueldoBase()
	}
}
