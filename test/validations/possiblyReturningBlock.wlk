class SomeClass {
  var a = 1
  var b = 2

  method voidMethod() {
    b = 5
  }

  @Expect(code="possiblyReturningBlock", level="warning")
  method fakeReturn() = {
    return 2
  }

  @Expect(code="possiblyReturningBlock", level="warning")
  method fakeReturnUsingVoidClosure() = { return }

  @Expect(code="possiblyReturningBlock", level="warning")
  method fakeReturnUsingVariables() = {
    return a + b
  }

  @Expect(code="possiblyReturningBlock", level="warning")
  method fakeReturnUsingAssignment() = {
    a = 3
  }

  // It's ok if method is not defined as synthetic, you can return a closure with no params
  method okReturn() {
    return {
      return 2
    }
  }

  // It's also ok if you define a synthetic method returning a non-closure value
  method goodMethod() = 2

  // You can use a synthetic definition returning a closure with several args
  method anotherGoodReturnMethod() = { a, b => a + b }
}
