class ReachAException inherits wollok.lang.Exception {}
class ReachBException inherits wollok.lang.Exception {}
class ReachCException inherits wollok.lang.Exception {}
class ReachDException inherits ReachCException {}
      
class A { 
  method m1() { throw new ReachCException(message = "hello you see") }
}
      
object p {  
  const a = new A()
  method unreachableCatches() {      
    try {
      a.m1()
      assert.fail("Should have thrown exception")
    }
    catch e : ReachAException
      assert.fail("incorrect catch !")
    catch e
      console.println("blah")
    @Expect(code = "catchShouldBeReachable", level="error")
    catch e : ReachBException
      assert.fail("incorrect catch !")
  }
  
  method twoCatchesWithoutType() {      
    try {
      a.m1()
      assert.fail("Should have thrown exception")
    }
    catch e
      console.println("blah")
    @Expect(code = "catchShouldBeReachable", level="error")
    catch e
      assert.fail("incorrect catch !")
    @Expect(code = "catchShouldBeReachable", level="error")
    catch e : ReachBException
      assert.fail("incorrect catch !")
  }

  method catchingFromSpecificToMoreGeneralOk() {
    try {
      a.m1()
      assert.that(true)
    } 
    catch e: ReachDException
      assert.fail("D exception is not ok")
    catch e: ReachCException
      assert.fail("C exception is still not good")
    catch e
      assert.equals(1, 1)
  }

  method catchingFromGeneralToSpecificNotOk() {
    try {
      a.m1()
      assert.that(true)
    } 
    catch e: ReachCException
      assert.fail("C exception is still not good")
    @Expect(code = "catchShouldBeReachable", level="error")
    catch e: ReachDException
      assert.fail("D exception is not ok")
  }

}
