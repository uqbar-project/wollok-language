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
  @Expect(code = "doesntOverride", level = "error")
  override method fafafa() {}
}

object bar {
  @Expect(code = "doesntOverride", level = "error")
  override method fafafa() {}
}
