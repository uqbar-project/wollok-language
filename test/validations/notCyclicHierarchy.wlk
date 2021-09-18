@Expect(code="notCyclicHierarchy", level="error")
class A inherits D {

}

@Expect(code="notCyclicHierarchy", level="error")
class B inherits A {

}

@Expect(code="notCyclicHierarchy", level="error")
class C inherits B {

}

@Expect(code="notCyclicHierarchy", level="error")
class D inherits C {

}

@Expect(code="notCyclicHierarchy", level="error")
class CyclicClass inherits CyclicClass {}

@Expect(code="notCyclicHierarchy", level="error")
class CyclicA inherits CyclicB {}

@Expect(code="notCyclicHierarchy", level="error")
class CyclicB inherits CyclicA {}