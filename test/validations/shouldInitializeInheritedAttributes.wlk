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

@Expect(code="shouldInitializeInheritedAttributes", level="error", values=["w, y"])
object o1 inherits C {}
object o2 inherits C(w = 1, x = 2, y = 3, z = 4) {} // OK
@Expect(code="shouldInitializeInheritedAttributes", level="error", values=["w"])
object o3 inherits C(x = 2, y = 3, z = 4) {}
object o4 inherits C(w = 1,        y = 3, z = 4) {}
@Expect(code="shouldInitializeInheritedAttributes", level="error", values=["y"])
object o5 inherits C(w = 1, x = 2, z = 4) {}
@Expect(code="shouldInitializeInheritedAttributes", level="error", values=["y"])
object o6 inherits C(w = 1, x = 2, z = 4) {}

const p1 = @Expect(code="shouldInitializeInheritedAttributes", level="error", values=["w, y"]) object inherits C {}
const p2 = object inherits C(w = 1, x = 2, y = 3, z = 4) {} // OK
const p3 = @Expect(code="shouldInitializeInheritedAttributes", level="error", values=["w"]) object inherits C(x = 2, y = 3, z = 4) {}
const p4 = object inherits C(w = 1,        y = 3, z = 4) {} // OK
const p5 = @Expect(code="shouldInitializeInheritedAttributes", level="error", values=["y"]) object inherits C(w = 1, x = 2, z = 4) {}
const p6 = @Expect(code="shouldInitializeInheritedAttributes", level="error", values=["y"]) object inherits C(w = 1, x = 2, z = 4) {}

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

@Expect(code="shouldInitializeInheritedAttributes", level="error", values=["y"])
object malSingleton1 inherits B(z = 3) { }

@Expect(code="shouldInitializeInheritedAttributes", level="error", values=["z"])
object malSingleton2 inherits B(y = 2) { }
object bienSingleton1 inherits B(y = 2, z = 3) { }		        // OK! x = 1, y = 2, z = 3
object bienSingleton2 inherits B(x = 0, y = 2, z = 3) { }    // OK! x = 0, y = 2, z = 3

const mal1 = @Expect(code="shouldInitializeInheritedAttributes", level="error", values=["y"]) object inherits B(z = 3) { }
const mal2 = @Expect(code="shouldInitializeInheritedAttributes", level="error", values=["z"]) object inherits B(y = 2) { }
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

const a1 = @Expect(code="shouldInitializeInheritedAttributes", level="error", values=["w, y, a"]) object inherits M1 and A1 {}

@Expect(code="shouldInitializeInheritedAttributes", level="error", values=["w, y, a"])
object mixedObject inherits M1 and A1 {}