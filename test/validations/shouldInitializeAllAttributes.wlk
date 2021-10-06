/* ================================================================================
 * - using a simple hierarchy 
 * - instantiation with new using different strategies
 * ===============================================================================*/
class Ave {
  var variableInicializadaConNull = null
	var energia
	var edad = 10
	method cumplirAnios() {
		edad = edad + 1
	}
	method volar() { energia = energia - 10 }
}

class Golondrina inherits Ave {
	const peso
	method estaGorda() = peso > 100
}

class Torcaza inherits Ave {
	var color
	
	method esLinda() = color === "rojo"
}

class Entrenador {
	var pepita = null
	var otraPepita = null
	var torcaza = null
	method crearUnAve() {
		pepita = @Expect(code="shouldInitializeAllAttributes", level="error") new Ave(edad = 2) // missing 'energia'
		pepita = new Ave(edad = 2, energia = 50)
		pepita = new Ave(energia = 50)
	}
	method crearOtraAve() {
		otraPepita = @Expect(code="shouldInitializeAllAttributes", level="error") new Golondrina(edad = 2)
		otraPepita = @Expect(code="shouldInitializeAllAttributes", level="error") new Golondrina(edad = 10, peso = 5) // missing 'energia'
		otraPepita = new Golondrina(edad = 10, peso = 5, energia = 56)
	}
	method crearTorcaza() {
		torcaza = new Torcaza(color = "rojo", energia = 25, edad = 3) // OK
		torcaza = @Expect(code="shouldInitializeAllAttributes", level="error") new Torcaza(color = "rojo") // missing 'energia'
		torcaza = @Expect(code="shouldInitializeAllAttributes", level="error") new Torcaza(edad = 5) // missing 'color' and 'energia'
		torcaza = @Expect(code="shouldInitializeAllAttributes", level="error") new Torcaza() // missing 'color' and 'energia'
	}
}

/* ================================================================================
 * - using a single class
 * - singleton & anonymous objects definitions
 * ===============================================================================*/

class C {
  const w
  const x = 5 
  var y
  var z = 9
  
  method reset() {
  	y = y + 3
  	z = z + 1
  }
  method calculate() = w + x + y + z
}

object o1 inherits @Expect(code="shouldInitializeAllAttributes", level="error") C {} // missing 'w' and 'y'

object o2 inherits C(w = 1, x = 2, y = 3, z = 4) {} // OK
object o3 inherits @Expect(code="shouldInitializeAllAttributes", level="error") C(x = 2, y = 3, z = 4) {} // missing 'w'
object o4 inherits C(w = 1,        y = 3, z = 4) {}
object o5 inherits @Expect(code="shouldInitializeAllAttributes", level="error") C(w = 1, x = 2, z = 4) {} // missing 'y'
object o6 inherits @Expect(code="shouldInitializeAllAttributes", level="error") C(w = 1, x = 2, z = 4) {} // missing 'y'

const p1 = object inherits @Expect(code="shouldInitializeAllAttributes", level="error") C {} // missing 'w' and 'y'
const p2 = object inherits C(w = 1, x = 2, y = 3, z = 4) {} // OK
const p3 = object inherits @Expect(code="shouldInitializeAllAttributes", level="error") C(x = 2, y = 3, z = 4) {} // missing 'w'
const p4 = object inherits C(w = 1,        y = 3, z = 4) {} // OK
const p5 = object inherits @Expect(code="shouldInitializeAllAttributes", level="error") C(w = 1, x = 2, z = 4) {} // missing 'y'
const p6 = object inherits @Expect(code="shouldInitializeAllAttributes", level="error") C(w = 1, x = 2, z = 4) {} // missing 'y'

/* ================================================================================
 * - using a combined hierarchy of classes
 * - singleton & anonymous objects definitions
 * ===============================================================================*/

class A {
  const x
  const y
  
  method x() = x
  method y() = y
}

class B inherits A(x = 1) {
  const z
  
  method z() = z
}

object mal1 inherits @Expect(code="shouldInitializeAllAttributes", level="error") B(z = 3) { } // missing 'y'

object mal2 inherits @Expect(code="shouldInitializeAllAttributes", level="error") B(y = 2) { } // missing 'z'
object bien1 inherits B(y = 2, z = 3) { }		        // OK! x = 1, y = 2, z = 3
object bien2 inherits B(x = 0, y = 2, z = 3) { }    // OK! x = 0, y = 2, z = 3

const mal1 = object inherits @Expect(code="shouldInitializeAllAttributes", level="error") B(z = 3) { } // missing 'y'
const mal2 = object inherits @Expect(code="shouldInitializeAllAttributes", level="error") B(y = 2) { } // missing 'z'
const bien1 = object inherits B(y = 2, z = 3) { }        // OK! x = 1, y = 2, z = 3
const bien2 = object inherits B(x = 0, y = 2, z = 3) { } // OK! x = 0, y = 2, z = 3

/* ================================================================================
 * - using a combined hierarchy of classes and mixins
 * - anonymous objects & singletons definitions
 * ===============================================================================*/

mixin M1 {
  const w   // OK
  const x = 5 // OK
  var y       // OK
  var z = 9   // OK
  
  method reset() {
  	y = 2
  	z = z + 4
  }
  method calculate() = w + x + y + z
}

class A1 {
  const a
  method calculate() = a + 5
}

const a1 = object inherits @Expect(code="shouldInitializeAllAttributes", level="error") M1 and @Expect(code="shouldInitializeAllAttributes", level="error") A1 {} // missing 'a', 'w' and 'y'

object mixedObject inherits @Expect(code="shouldInitializeAllAttributes", level="error") M1 and @Expect(code="shouldInitializeAllAttributes", level="error") A1 {} // missing 'a', 'w' and 'y'
