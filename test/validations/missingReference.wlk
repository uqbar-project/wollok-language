import @Expect(code="missingReference", level="error", expectedOn="inexistentFile") inexistentFile.*

object pepita {
  
  method energia() = (@Expect(code="missingReference", level="error", expectedOn="energia") energia)
  
  method comer(p) {
    @Expect(code="missingReference", level="error", path="variable", expectedOn="energia")
    energia = 100
  }

  method estaCansada() = (@Expect(code="missingReference", level="error", expectedOn="energia") energia < 10)

  method methodName() {
    self.comer(@Expect(code="missingReference", level="error", expectedOn="energia") energia)
  } 
}

class C inherits @Expect(code="missingReference", level="error", path="reference", expectedOn="InexistentClass") InexistentClass {
  method catchingNonExistingException() {
    try {
      assert.that(true)
    } 
    catch e: @Expect(code = "missingReference", level="error", expectedOn="InexistentException") InexistentException
      assert.fail("InexistentException does not exist")
    @Expect(code = "catchShouldBeReachable", level="error")
    catch e: Exception
      assert.fail("Cannot check inheritance of inexistent exception")
  }
}

mixin M inherits @Expect(code="missingReference", level="error", path="reference", expectedOn="InexistentMixin") InexistentMixin { }

const a = new @Expect(code = "missingReference", level="error", expectedOn="InexistClass") InexistClass(edad = 5)