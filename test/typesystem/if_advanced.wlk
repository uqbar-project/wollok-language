// This file should have no problems

object pepitac137 {
	var energia = 1400
	
	method energia1() { 
		return energia
	}
	
	method volar1(km) {
		energia -= 100 + km
	}

	method comer1(gramos) {
		energia += 4 * gramos
	}
	
	method estaDebil1() {
		return energia < 50
	}

	method estaFeliz1() {
		return energia.between(500, 1000)
	}
	
	method cuantoQuiereVolar1() {
		var cuantoQuiereVolar = energia / 5
		if (energia.between(300, 400)) {
			cuantoQuiereVolar += 10
		}
		if (energia % 20 == 0) {
			cuantoQuiereVolar += 15
		}
		return cuantoQuiereVolar
	}
	
	method haceLoQueQuieras1() {
		if (self.estaDebil1()) {
			self.comer1(20)
		}
		if (self.estaFeliz1()) {
			self.volar1(self.cuantoQuiereVolar1())
		}
	}
}