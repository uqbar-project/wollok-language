class Foo {
    method foo() { console.println('foo') }
    
    method bar() { console.println('bar') }
}

class Baz inherits Foo {
  @Expect(code="overridingMethodShouldHaveABody", level="error", expectedOn="foo")
  override method foo()
    
  // this one is ok in terms of not having a body
  override method bar() native
}