// No errors

object lobo {

	var calorias = 100
	
	method calorias(){
		return calorias
	}
	
	method estasGordo(){
		return calorias > 200
	}
	
	method estasSaludable(){
		return calorias > 20 and calorias < 150
	}
	
	method correr(minutos){
		calorias = calorias - minutos * 2
	}
	
	method comer(personaje){
		calorias = calorias + personaje.caloriasQueAporta()
	}
	
	method correrA(lugar){
		self.correr(lugar.minutos())
	}

	method soplar(casa){
		calorias = calorias - (casa.resistencia() + casa.pesoOcupantes())
	}
		
}

object chanchito{
	method peso(){
		return 50
	}
	method caloriasQueAporta(){
		return self.peso() / 10
	}
}


object chanchitoCasaMadera{
	method peso(){
		return 20
	}
	method caloriasQueAporta(){
		return 7
	}
}

object chanchitoTrabajador{
	const edad = 2
	
	method peso(){
		return edad * 5
	}
	method caloriasQueAporta(){
		return self.peso()
	}
}

 
object casaPaja{
	method pesoOcupantes(){
		return chanchito.peso()
	}
	
	method resistencia(){
		return 0
	}
	
	method minutos(){
		return 10
	}
}

object casaMadera{
	const minutos = 15
	var visitante = null
//	var visitante = chanchito
	

	method llega(alguien){
		visitante = alguien
	}

	method pesoOcupantes(){
		return chanchitoCasaMadera.peso() + visitante.peso()
	}
	
	method resistencia(){
		return 5
	}
	
	method minutos(){
		return minutos
	}   
}


object casaLadrillos{
	const ladrillos = 10
	var pesoOcupado = chanchitoTrabajador.peso()
//	const pesoOcupado = 10
	
	method llega(chanchito){
		pesoOcupado = pesoOcupado + chanchito.peso()
	}
	
	method pesoOcupantes(){
		return pesoOcupado
	}
	
	method resistencia(){
		return 2 * ladrillos
	}
	
	method minutos(){
		return casaPaja.minutos()+casaMadera.minutos()
	}
}

object abuela{
	
	method caloriasQueAporta(){
		return 0
	}
}

object casaAbuela{
	const minutos = 5
	
	method minutos(){
		return minutos
	}
}

object oveja{
	const nombre = "Dolly"
	
	method caloriasQueAporta(){
		return nombre.size()*5
	}
}
 object duende {
 	var varitas = 0 
 	const altura = 5
 	
 	method encontrarVaritas(cantidad) {
 		varitas = varitas + cantidad
 	}
 
 	method caloriasQueAporta() {
 		return varitas + altura /10
 	}
 	
 }


object bosque{
	method minutos(){
		return 10
	}
}

object canasta {
	const cantidadManzanas = 2
	method peso() {
		return 2 * cantidadManzanas
	} 
}

object caperucita{
	
	method caloriasQueAporta(){
		return 50 + canasta.peso()
	}
	method dondeVas(){
		return casaAbuela
	}
}

