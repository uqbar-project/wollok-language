class ReachAException inherits wollok.lang.Exception {}
class ReachBException inherits wollok.lang.Exception {}
class ReachCException inherits wollok.lang.Exception {}
// TODO: Falta una DException que herede de CException y catchear primero CException y después DException
      
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
}
