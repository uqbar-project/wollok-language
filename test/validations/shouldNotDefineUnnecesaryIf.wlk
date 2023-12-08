object pepita {
}

object p {
  method run() {
    @Expect(code="shouldNotDefineUnnecesaryIf", level="error", expectedOn="true")
    if (true)
      throw new Exception(message = "asd")
  }
}
