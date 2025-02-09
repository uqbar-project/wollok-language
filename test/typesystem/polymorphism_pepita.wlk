object pepita {
	var energia = 100
	
	method comer(@Expect(type="(alpiste | manzana)")comida) {
		energia = energia + comida.energiaQueAporta()
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	const madurez = 1
	const base = 5
	
	method energiaQueAporta() {
		return base * madurez
	}	
}

object testPepita {
	method comeAlpiste() {
		pepita.comer(alpiste)
	}

	method comeManzana() {
		pepita.comer(manzana)
	}
}