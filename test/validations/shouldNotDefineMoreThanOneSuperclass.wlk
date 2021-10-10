class A {}
class B {}
mixin M1 {}
mixin M2 {}

const goodObjectLiteral1 = object inherits M1 and A {}

const goodObjectLiteral3 = object inherits M1 and M2 and A {}

@Expect(code="shouldNotDefineMoreThanOneSuperclass", level="error")
class BadSubclass inherits A and B {}

@Expect(code="shouldNotDefineMoreThanOneSuperclass", level="error")
class BadSubclass2 inherits A and M1 and B {}

@Expect(code="shouldNotDefineMoreThanOneSuperclass", level="error")
class BadSubclass3 inherits M1 and A and B {}

@Expect(code="shouldNotDefineMoreThanOneSuperclass", level="error")
object bad1 inherits A and B {}

@Expect(code="shouldNotDefineMoreThanOneSuperclass", level="error")
object bad2 inherits A and M1 and B {}

@Expect(code="shouldNotDefineMoreThanOneSuperclass", level="error")
object bad3 inherits M1 and A and B {}

const badLiteral1 = @Expect(code="shouldNotDefineMoreThanOneSuperclass", level="error") object inherits A and B {}

const badLiteral2 = @Expect(code="shouldNotDefineMoreThanOneSuperclass", level="error") object inherits A and M1 and B {}

const badLiteral3 = @Expect(code="shouldNotDefineMoreThanOneSuperclass", level="error") object inherits M1 and A and B {}

const emptyObject = object { }
