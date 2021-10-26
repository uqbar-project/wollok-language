const pepita = object {
  @Expect(code="shouldNotDefineNativeMethodsOnUnnamedSingleton", level="error")
  method fly() native
}

// OK
object pepona {
  method fly() native
}

// OK
class Bird {
  method fly() native
}

// OK
mixin Animal {
  method eat() native
}