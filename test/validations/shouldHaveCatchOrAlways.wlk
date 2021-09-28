class BadClass {
  method badTry() {
    @Expect(code="shouldHaveCatchOrAlways", level="error")
    try {
      return 2
    }
  }
}
