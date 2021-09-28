class SpecialList inherits List {
  // Allowed
  override method remove(other) {}

  @Expect(code="shouldUseOverrideKeyword", level="warning")
  method add(other) {}
}

object bar inherits List {
	@Expect(code="shouldUseOverrideKeyword", level="warning")
  method == (other) {
    return true
  }
}
