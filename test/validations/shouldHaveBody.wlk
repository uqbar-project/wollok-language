object shouldHaveBody {
  @Expect(code="shouldHaveBody", level="error", expectedOn="method noBody()\n")
  method noBody()
}

const o = object {
  @Expect(code="shouldHaveBody", level="error", expectedOn="method noBody()\n")
  method noBody()
}
