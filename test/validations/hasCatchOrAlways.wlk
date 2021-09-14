class BadClass {
  method badTry() {
    @Expect(code="hasCatchOrAlways", level="error")
    try {
      return 2
    }
  }
}
