import @Expect(code="missingReference", level="error") inexistentFile.*

object pepita {
  
  method energia() = @Expect(code="missingReference", level="error") energia
  
  method comer(p) {
    @Expect(code="missingReference", level="error", path="variable")
    energia = 100
  }

  method estaCansada() = @Expect(code="missingReference", level="error") energia < 10

  method methodName() {
    self.comer(@Expect(code="missingReference", level="error") energia)
  } 
}

class C inherits @Expect(code="missingReference", level="error", path="reference") InexistentClass {
  method catchingNonExistingException() {
    try {
      assert.that(true)
    } 
    catch e: @Expect(code = "missingReference", level="error") InexistentException
      assert.fail("InexistentException does not exist")
    @Expect(code = "catchShouldBeReachable", level="error")
    catch e: Exception
      assert.fail("Cannot check inheritance of inexistent exception")
  }
}

mixin M inherits @Expect(code="missingReference", level="error", path="reference") InexistentMixin { }

const a = new @Expect(code = "missingReference", level="error") InexistClass(edad = 5)