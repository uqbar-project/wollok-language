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
  @Expect(code = "shouldNotUseOverride", level = "error")
  override method fafafa() {}
}

object bar {
  @Expect(code = "shouldNotUseOverride", level = "error")
  override method fafafa() {}
}
