object pepita {
  @Expect(code="shouldNotAssignValueInLoop", level="error", expectedOn="var property energia = self.energia()")
  var property energia = self.energia()
}

object pepona {
  var property energia = pepe.energia()
}

object pepe {
  method energia() = 2
}
