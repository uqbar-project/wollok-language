class Persona {
	method comoEstas() {
		return "bien"
	}
}

class Direccion {
	const calle = "Medrano"
	const numero = 951

	method tipar() = calle.charAt(numero)
}

class DireccionRemota inherits Direccion {
	const ciudad = new Ciudad(km = 0)
	
	override method tipar() = ciudad.nombreCiudad()
}

class Ciudad {
	@Expect(type="Number")
	const km
	
	method nombreCiudad() = "Buenos Aires"
	
	method kmDondeEsta() = km
}

class Point {
	const  x
	const  y
	
	@Expect(type="() => Number")
	method tipar() = x / y
}

class Point3D inherits Point {
	@Expect(type="Number")
	const z = 0
	
	@Expect(type="() => Number")
	override method tipar() = super() + z
}

class TestConstructors {
	method basicConstruction() {
		@Expect(type="Persona")
		const alguien = new Persona()
	
		@Expect(type="String")
		const saludo = new Persona().comoEstas()
	
		@Expect(type="String")
		const saludo2 = alguien.comoEstas()
	}

	@Expect(type="(String, Number) => Direccion")
	method directInstantiation(c, n) {
		return new Direccion(calle = c, numero = n)
	}

	@Expect(type="(String, Number, Ciudad) => DireccionRemota")
	method directInstantiationWithInheritance(c, n, i) {
		return new DireccionRemota(calle = c, numero = n, ciudad = i)
	}
	@Expect(type="(Number, Number) => Point")
	method sameParameters(x, y) = new Point(x = x, y = y)

	@Expect(type="(Number, Number) => Point3D")
	method inherited(x, y) = new Point3D(x = x, y = y)

}