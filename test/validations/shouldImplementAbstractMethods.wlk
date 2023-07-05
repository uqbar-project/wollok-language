// abstract class
class A {
	method abstractBlah()
}

@Expect(code="shouldImplementAbstractMethods", level="error")
object anA inherits A {
}

class B inherits A {
	method otherAbstract(one, two)
}

@Expect(code="shouldImplementAbstractMethods", level="error")
object aB inherits B {}


class Animal {
	var property nombre
}

object ornitorrinco inherits Animal(nombre = "julian") {} 

const o = @Expect(code="shouldImplementAbstractMethods", level="error") object inherits A {}

const o3 = @Expect(code="shouldImplementAbstractMethods", level="error") object inherits B {}

const o4 = object inherits Animal(nombre = "firulais") {} 

class C {
  method abstractBlah(someParam)
}

@Expect(code="shouldImplementAbstractMethods", level="error")
object aC inherits C {
  method abstractBlah() {}
}

const unnamedAC = @Expect(code="shouldImplementAbstractMethods", level="error") object inherits C {
  method abstractBlah() {}
}

@Expect(code="shouldImplementAbstractMethods", level="error")
object badWko {
	method abstractMethod()
}

const o2 = @Expect(code="shouldImplementAbstractMethods", level="error") object {
  method abstractMethod()
}
