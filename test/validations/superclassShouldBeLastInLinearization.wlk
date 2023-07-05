class A {}
class B {}
mixin M1 {}
mixin M2 {}

const badObjectLiteral1 = @Expect(code="superclassShouldBeLastInLinearization", level="error") object inherits A and M1 {}

const goodObjectLiteral1 = object inherits M1 and A {}

const badObjectLiteral2 = @Expect(code="superclassShouldBeLastInLinearization", level="error") object inherits A and M1 and M2 {}

const badObjectLiteral3 = @Expect(code="superclassShouldBeLastInLinearization", level="error") object inherits M1 and A and M2 {}

const goodObjectLiteral3 = object inherits M1 and M2 and A {}

@Expect(code="superclassShouldBeLastInLinearization", level="error")
object badLinearization1 inherits A and M1 and M2 {}

@Expect(code="superclassShouldBeLastInLinearization", level="error")
object badLinearization2 inherits M1 and A and M2 {}

object goodLinearization3 inherits M1 and M2 and A {}

@Expect(code="superclassShouldBeLastInLinearization", level="error")
class BadLinearizationClass1 inherits A and M1 and M2 {}

@Expect(code="superclassShouldBeLastInLinearization", level="error")
class BadLinearizationClass2 inherits M1 and A and M2 {}

class GoodLinearizationClass3 inherits M1 and M2 and A {}
