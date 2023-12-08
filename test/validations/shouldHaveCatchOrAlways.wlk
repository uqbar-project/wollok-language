class BadClass {
  method badTry() {
    @Expect(code="shouldHaveCatchOrAlways", level="error", expectedOn="try {
      return 2
    }
  ")
    try {
      return 2
    }
  }
}
