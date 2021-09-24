@Expect(code="shouldNotHaveLoopInHierarchy", level="error")
class A inherits D {

}

@Expect(code="shouldNotHaveLoopInHierarchy", level="error")
class B inherits A {

}

@Expect(code="shouldNotHaveLoopInHierarchy", level="error")
class C inherits B {

}

@Expect(code="shouldNotHaveLoopInHierarchy", level="error")
class D inherits C {

}

@Expect(code="shouldNotHaveLoopInHierarchy", level="error")
class CyclicClass inherits CyclicClass {}

@Expect(code="shouldNotHaveLoopInHierarchy", level="error")
class CyclicA inherits CyclicB {}

@Expect(code="shouldNotHaveLoopInHierarchy", level="error")
class CyclicB inherits CyclicA {}

@Expect(code="shouldNotHaveLoopInHierarchy", level="error")
mixin MixinA inherits MixinA {}

@Expect(code="shouldNotHaveLoopInHierarchy", level="error")
mixin Mixin1 inherits Mixin3 {}

@Expect(code="shouldNotHaveLoopInHierarchy", level="error")
mixin Mixin2 inherits Mixin1 {}

@Expect(code="shouldNotHaveLoopInHierarchy", level="error")
mixin Mixin3 inherits Mixin2 {}

mixin GoodMixin {}

mixin GoodMixin2 inherits GoodMixin {}

mixin GoodMixin3 {}

mixin GoodMixin4 inherits GoodMixin2 and GoodMixin3 {}

object goodPepita {}

// Should not produce any validation report, since the problem is in Mixin1
object badPepita inherits Mixin1 {}

// Should not produce any validation report, since the problem is in CyclicB
object anotherBadPepita inherits CyclicB {}