/* ================================================================================
 * - common hierarchy of classes
 * - instantiation, anonymous object & singleton definitions with repeated 
 *   named arguments in the same definitions
 * ===============================================================================*/

class SomeClass {
  var property someAttribute = "hello"
  const property constProperty = 1
}

@Expect(code="linearizationShouldNotRepeatNamedArguments", level="warning")
object someObjectRepeatedNamedParameter inherits SomeClass(someAttribute = 0, someAttribute = 1) {}

const literalRepeatedNamedParameter = 
  @Expect(code="linearizationShouldNotRepeatNamedArguments", level="warning")
  object inherits SomeClass(someAttribute = 0, someAttribute = 1) {}

/* ================================================================================
 * - common hierarchy of classes and mixins
 * - instantiation, anonymous object & singleton definitions with repeated 
 *   named arguments in the different superclasses
 * ===============================================================================*/

mixin LinM0 {
  const property x
}

mixin LinM1 inherits LinM0 { }

mixin LinM2 inherits LinM0 { }

@Expect(code="linearizationShouldNotRepeatNamedArguments", level="warning")
class LinC1 inherits LinM1(x = 1) and LinM2(x = 1) { }

class LinC2 inherits LinM1(x = 1) and LinM2 { }
class LinC3 inherits LinM1 and LinM2(x = 1) { }
 
@Expect(code="linearizationShouldNotRepeatNamedArguments", level="warning")
object c1 inherits LinM1(x = 1) and LinM2(x = 1) { }

object linC2 inherits LinM1(x = 1) and LinM2 { }
object linC3 inherits LinM1 and LinM2(x = 1) { }

const o1 = 
  @Expect(code="linearizationShouldNotRepeatNamedArguments", level="warning")
  object inherits LinM1(x = 1) and LinM2(x = 1) { }

const linO2 = object inherits LinM1(x = 1) and LinM2 { }
const linO3 = object inherits LinM1 and LinM2(x = 1) { }
