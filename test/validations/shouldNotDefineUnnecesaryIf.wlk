object pepita {
}

object p {
  method run() {
    @Expect(code="shouldNotDefineUnnecesaryIf", level="error")
    if (true)
      throw new Exception(message = "asd")
  }
}
