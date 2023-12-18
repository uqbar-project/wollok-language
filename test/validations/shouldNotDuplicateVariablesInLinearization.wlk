class Ave {
  var energia = 100
  method comer() { energia = energia + 50 }
}

mixin Caminante {
  var property kilometros = 0
  method caminar(tiempo) { kilometros = kilometros + (4 * tiempo) }
}

mixin Volador {
  var property kilometros = 0
  method volar() { kilometros = kilometros + 100 }
}

@Expect(code="shouldNotDuplicateVariablesInLinearization", level="error", expectedOn="object pepita inherits Caminante and Volador and Ave {}")
object pepita inherits Caminante and Volador and Ave {}

const avecita = 
  @Expect(code="shouldNotDuplicateVariablesInLinearization", level="error", expectedOn="object inherits Caminante and Volador and Ave {}")
  object inherits Caminante and Volador and Ave {}

