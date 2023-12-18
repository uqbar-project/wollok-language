class Foo {
  // Allowed
  override method == (other) {
    return true
  }
}

object foo {
  // Allowed
  override method == (other) {
    return true
  }
}

class Bar {
  @Expect(code = "shouldNotUseOverride", level = "error", expectedOn = "override")
  override method fafafa() {}
}

object bar {
  @Expect(code = "shouldNotUseOverride", level = "error", expectedOn = "override")
  override method fafafa() {}
}

/* ================================================================================
 * - a subclass of a library superclass (from lang, lib, or any other base wlk)
 * - trying to override methods that don't exist
 * ===============================================================================*/


class SpecialList inherits List {
  // Allowed
  override method remove (other) {
  }
    
  @Expect(code = "shouldNotUseOverride", level = "error", expectedOn = "override")
  override method fafafa() {}
}

object barList inherits List {
  @Expect(code = "shouldNotUseOverride", level = "error", expectedOn = "override")
  override method fafafa() {}
}
