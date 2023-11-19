object shouldHaveBody {
  @Expect(code="shouldHaveBody", level="error")
  method noBody()
}

const o = object {
  @Expect(code="shouldHaveBody", level="error")
  method noBody()
}
