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

@Expect(code="shouldInitializeAllAttributes", level="error")
object o1 inherits C {} // missing 'w' and 'y'
object o2 inherits C(w = 1, x = 2, y = 3, z = 4) {} // OK
@Expect(code="shouldInitializeAllAttributes", level="error")
object o3 inherits C(x = 2, y = 3, z = 4) {} // missing 'w'
object o4 inherits C(w = 1,        y = 3, z = 4) {}
@Expect(code="shouldInitializeAllAttributes", level="error")
object o5 inherits C(w = 1, x = 2, z = 4) {} // missing 'y'
@Expect(code="shouldInitializeAllAttributes", level="error")
object o6 inherits C(w = 1, x = 2, z = 4) {} // missing 'y'

const p1 = @Expect(code="shouldInitializeAllAttributes", level="error") object inherits C {} // missing 'w' and 'y'
const p2 = object inherits C(w = 1, x = 2, y = 3, z = 4) {} // OK
const p3 = @Expect(code="shouldInitializeAllAttributes", level="error") object inherits C(x = 2, y = 3, z = 4) {} // missing 'w'
const p4 = object inherits C(w = 1,        y = 3, z = 4) {} // OK
const p5 = @Expect(code="shouldInitializeAllAttributes", level="error") object inherits C(w = 1, x = 2, z = 4) {} // missing 'y'
const p6 = @Expect(code="shouldInitializeAllAttributes", level="error") object inherits C(w = 1, x = 2, z = 4) {} // missing 'y'

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

@Expect(code="shouldInitializeAllAttributes", level="error") 
object malSingleton1 inherits B(z = 3) { } // missing 'y'

@Expect(code="shouldInitializeAllAttributes", level="error") 
object malSingleton2 inherits B(y = 2) { } // missing 'z'
object bienSingleton1 inherits B(y = 2, z = 3) { }		        // OK! x = 1, y = 2, z = 3
object bienSingleton2 inherits B(x = 0, y = 2, z = 3) { }    // OK! x = 0, y = 2, z = 3

const mal1 = @Expect(code="shouldInitializeAllAttributes", level="error") object inherits B(z = 3) { } // missing 'y'
const mal2 = @Expect(code="shouldInitializeAllAttributes", level="error") object inherits B(y = 2) { } // missing 'z'
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

const a1 = @Expect(code="shouldInitializeAllAttributes", level="error") object inherits M1 and A1 {} // missing 'a', 'w' and 'y'

@Expect(code="shouldInitializeAllAttributes", level="error")
object mixedObject inherits M1 and A1 {} // missing 'a', 'w' and 'y'
