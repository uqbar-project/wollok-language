class Ave {
	var property energia
		
	method come() {
		energia += 3
	}
}

class Golondrina inherits Ave {
	
	@Expect(type="() => Number")
	method energy() = self.energia() 
	
	method vola() {
		energia -= 10 
	}
	
}

object entrenador {
	@Expect(type="(Ave) => Void")
	method alimentar(ave) {
		ave.come()
	}
	
	@Expect(type="(Golondrina) => Void")
	method queVuele(golondrina) {
		golondrina.vola()
		self.alimentar(golondrina)
	}
}

object testEntrenador {
	method alimentarAve() {
		entrenador.alimentar(new Ave(energia = 0))
	}
	method volarGolondrina() {
		entrenador.queVuele(new Golondrina(energia = 10))
	}
}