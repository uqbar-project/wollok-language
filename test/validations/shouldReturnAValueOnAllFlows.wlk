object pepita {
  method energia() = 100
  method velocidad() = 50
}

object pepona {}

object joaquin {
  const tocaEnGrupo = false
  var property nombre = ""
  var property apellido = ""
  var property anioComienzo = 1990
  var property anioNacimiento = 1980

  method gracia() {
    return if (tocaEnGrupo) 2 else 9
  }

  method testValorDevuelto() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (tocaEnGrupo) return 5")
    if (tocaEnGrupo) return 5
  }

  // Throw cases ===========================================================================

  // OK
  method testValorDevueltoThenThrowLiteral() = if (tocaEnGrupo) throw new Exception() else 5

  // OK
  method testValorDevueltoElseThrowLiteral() = if (tocaEnGrupo) 5 else throw new Exception()

  // OK
  method testValorDevueltoThenThrowNew() = if (tocaEnGrupo) throw new Exception() else new Date()

  // OK
  method testValorDevueltoElseThrowNew() = if (tocaEnGrupo) new Date() else throw new Exception()

  // OK
  method testValorDevueltoElseThrowReturn() {
    if (tocaEnGrupo) return 2 else throw new DomainException(message = "No toca en grupo")
  }

  // OK
  method testValorDevueltoThenThrowReturn() {
    if (tocaEnGrupo) throw new DomainException(message = "No toca en grupo") else return 2
  }

  // OK
  method testValorDevueltoElseThrowSelf() = if (tocaEnGrupo) self else throw new Exception()

  // OK
  method testValorDevueltoThenThrowSelf() = if (tocaEnGrupo) throw new Exception() else self

  // OK
  method testValorDevueltoElseThrowSend() = if (tocaEnGrupo) "someone".reverse() else throw new Exception()

  // OK
  method testValorDevueltoThenThrowSend() = if (tocaEnGrupo) throw new Exception() else "someone".reverse()

  // OK
  method testValorDevueltoElseThrowReference() = if (tocaEnGrupo) pepita else throw new Exception()

  // OK
  method testValorDevueltoThenThrowReference() = if (tocaEnGrupo) throw new Exception() else pepita

  // OK
  method testValorDevueltoThrowEnAmbasRamasDelIf() = if (tocaEnGrupo) throw new Exception(message = "ufa") else throw new Exception(message = "je")

  // Send cases ===========================================================================

  // OK
  method testValorDevueltoElseSendLiteral() = if (tocaEnGrupo) 5 else pepita.energia()

  // OK
  method testValorDevueltoThenSendLiteral() = if (tocaEnGrupo) pepita.energia() else 5

  // OK
  method testValorDevueltoElseSendNew() = if (tocaEnGrupo) new Date() else pepita.energia()

  // OK
  method testValorDevueltoThenSendNew() = if (tocaEnGrupo) pepita.energia() else new Date()

  // OK
  method testValorDevueltoElseSendSelf() = if (tocaEnGrupo) self else pepita.energia()

  // OK
  method testValorDevueltoThenSendSelf() = if (tocaEnGrupo) pepita.energia() else self

  // OK
  method testValorDevueltoElseSendReference() = if (tocaEnGrupo) pepita else pepita.energia()

  // OK
  method testValorDevueltoThenSendReference() = if (tocaEnGrupo) pepita.energia() else pepita

  // OK
  method testValorDevueltoElseSendAmbasRamasDelIf() = if (tocaEnGrupo) pepita.velocidad() else pepita.energia()

  // Literal cases ===========================================================================

  // OK
  method testValorDevueltoLiteralAmbasRamasDelIf() = if (tocaEnGrupo) 5 else 2

  // OK
  method testValorDevueltoThenLiteralNew() = if (tocaEnGrupo) new Date() else 5

  // OK
  method testValorDevueltoElseLiteralNew() = if (tocaEnGrupo) 5 else new Date()

  // OK
  method testValorDevueltoElseLiteralSelf() = if (tocaEnGrupo) 5 else self

  // OK
  method testValorDevueltoThenLiteralSelf() = if (tocaEnGrupo) self else 5

  // OK
  method testValorDevueltoElseLiteralReference() = if (tocaEnGrupo) 5 else pepita

  // OK
  method testValorDevueltoThenLiteralReference() = if (tocaEnGrupo) pepita else 5

  // Reference cases =====================================================================

  // OK
  method testValorDevueltoElseReferenceNew() = if (tocaEnGrupo) new Date() else pepita

  // OK
  method testValorDevueltoThenReferenceNew() = if (tocaEnGrupo) pepita else new Date()

  // OK
  method testValorDevueltoReferenceAmbasRamas() = if (tocaEnGrupo) pepita else pepona

  // New cases ===========================================================================

  // OK
  method testValorDevueltoElseNewSelf() = if (tocaEnGrupo) new Date() else self

  // OK
  method testValorDevueltoThenNewSelf() = if (tocaEnGrupo) self else new Date()

  // OK
  method testValorDevueltoNewAmbasRamasDelIf() = if (tocaEnGrupo) new Date() else new List()

  // Self cases ===========================================================================

  // OK
  method testValorDevueltoSelfAmbasRamasDelIf() = if (tocaEnGrupo) self else self

  // =====================================================================================

  method testValorDevueltoConMetodoGet() =
    (@Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (tocaEnGrupo) 5")
    if (tocaEnGrupo) 5)

  method validarFelicidad() {
    assert.equals(10, @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (tocaEnGrupo) 5") if (tocaEnGrupo) 5)
  }

  method felicidadTotal(numero) = numero + @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (tocaEnGrupo) 5") (if (tocaEnGrupo) 5)

  method ifInsideExpressionWithoutElseShouldFailForReturn() {
    return @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if(1 == 2) 2") (if(1 == 2) 2)
  }

  method ifInsideExpressionWithoutElseShouldFailForBinaryLeftOperation() {
    return (@Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if(1 == 2) 2") if(1 == 2) 2) + 3
  }

  method ifInsideExpressionWithoutElseShouldFailInAssignment() {
    var failed = @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if(1 == 2) 2") if(1 == 2) 2
    const ok = if (1 == 2) 2 else 3
    failed = ok
    return ok == 3
  }

  method invokeAddOneTo() {
    return self.felicidadTotal(@Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (1 == 2) 4") if (1 == 2) 4)
  }

  method testValorDevueltoOFecha() =
    // OK
    if (tocaEnGrupo) 5 else new Date().plusDays(30)

  method testValorDevueltoONombre() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error")
    if (tocaEnGrupo) return 5 else apellido = "Spinetta"
  }

  method alegria() {
    return @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (tocaEnGrupo) 22") if (tocaEnGrupo) 22
  }

  method calcularNombre() {
    return @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (tocaEnGrupo) 22 else nombre = \"Luis\"") if (tocaEnGrupo) 22 else nombre = "Luis"
  }

  method definirNombre() {
    return @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (tocaEnGrupo) nombre = \"Luis\" else 22") if (tocaEnGrupo) nombre = "Luis" else 22
  }

  // OK
  method nombreFancy() = if (nombre != null) ("<" + nombre.toString() + ">") else ""

  override method == (otroMusico) {
    // OK, return is not the last line
    if (otroMusico == null) return false
  
    return nombre == otroMusico.nombre() && apellido == otroMusico.apellido()
  }

  method actualizarDatos() {
    if (nombre == null) {
      // OK
      if (apellido == null) {
        apellido = "N/A"
      } else {
        nombre = "N/A"
      }
    }
  }

}


/* ================================================================================
 * - second example: a class with several return vs. literal expressions/throws
 * ===============================================================================*/

class A {
  var c
  
  method setC(_c) { c = _c }
  
  method foo() = "Foo"
  
  method getFoo() { return "Foo" }
  
  method getBar() { 
    if (self.getFoo() == "Foo")  
      return "Foo"
    else
      return "Bar"
  }
  
  method getZoo() { 
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (self.getFoo() == \"Foo\")  
      return \"Foo\"")
    if (self.getFoo() == "Foo")  
      return "Foo"
  }
  
  method getZoo2() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (self.getFoo() == \"Foo\")
      return \"Foo\"")
    if (self.getFoo() == "Foo")
      return "Foo"
    
    var a = 2
    a += 1
  }
  
  method getXoo() { 
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (self.getFoo() == \"Foo\")  
      return \"Foo\"
    else
      \"Bar\"")
    if (self.getFoo() == "Foo")  
      return "Foo"
    else
      "Bar"
  }
  
  method getXoo2() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (self.getFoo() == \"Foo\") {
      var a = 23
      a += 2
      return a
    }
    else
      \"Bar\"")
    if (self.getFoo() == "Foo") {
      var a = 23
      a += 2
      return a
    }
    else
      "Bar"
  }
  
  method getXoo3() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (self.getFoo() == \"Foo\") {
      \"Foo\"
    }
    else {
      return \"Bar\"
    }") 
    if (self.getFoo() == "Foo") {
      "Foo"
    }
    else {
      return "Bar"
    }
  }
  
  method getThrowingException() {
    if (self.getFoo() == "Foo") {
      throw new Exception() 
    }
    else {
      return "Foo"
    }
  }
  
  method getThrowingExceptionAtIf() {
    if (self.getFoo() == "Foo") {
      throw new Exception() 
    }
    var a = 23
    a += 2
    return "Foo"
  }
  
  method getThrowingExceptionAtBody() {
    if (self.getFoo() == "Foo") {
      return "Foo" 
    }
    var a = 23
    a += 2
    throw new Exception()
  }
  
  method withTryCatch() {
    try {
      return 23
    }
    catch e : Exception {
      self.setC("saasas")
      throw e
    }
  }
  
  method cargar() {
    ["hola", "chau"]
      .map { p =>
        return p
      }
  }

  method doSomething() {
    c = 0
  }

}


class B inherits A {
  var property noPuede = true

  // Throw + super cases =================================================================

  // OK
  override method foo() = if (noPuede) throw new Exception() else super()

  // OK
  override method getFoo() = if (noPuede) super() else throw new Exception()

  // OK
  override method doSomething() {
    if (noPuede) super()
    c = 2
  }

}

class C inherits A {
  const siPuede = true

  // Send + super cases =================================================================

  // OK
  override method foo() = if (siPuede) super() else pepita.energia()

  // OK
  override method getFoo() = if (siPuede) pepita.energia() else super()
}

class D inherits A {
  const quizasPuede = true

  // Literal + super cases =================================================================

  // OK
  override method foo() = if (quizasPuede) 5 else super()

  // OK
  override method getFoo() = if (quizasPuede) super() else 5
}

class E inherits A {
  const capazQueSi = true

  // Reference + super cases =================================================================

  // OK
  override method foo() = if (capazQueSi) pepita else super()

  // OK
  override method getFoo() = if (capazQueSi) super() else pepita
}

/* ================================================================================
 * - Closures
 * ===============================================================================*/

object closureTests {
  var bool = true

  // OK
  const property c1 = { 
    if (bool) { return 1 } 
    "2"
  }

  const property c2 = { 
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (bool) { return 1 }")
    if (bool) { return 1 }
    bool = false
  }

  method m1() { bool = false }
}

// Issue 121 - https://github.com/uqbar-project/wollok-ts/issues/314
class A121 {
    method a121(){}
}

class B121 inherits A121 {
    var cumple = false
    override method a121(){
        if (cumple){
            cumple = false
        } else {
            super()
        }   
    }
}

// Issue 314 - https://github.com/uqbar-project/wollok-ts/issues/314
class NoSePuedeSacrificarException inherits DomainException {}
class NoPuedeRecorrerException inherits DomainException {}

class Guerrero {
  var property poder = 100
}

class Grupo {
  const guerreros = []
  method sacrificarMiembro() {
  }

  method puedeRecorrerZona(zona) = true

  method intentarRecorrerZona(zona) {
    if (not self.puedeRecorrerZona(zona)) {
        try {
            self.sacrificarMiembro()
        } catch e : NoSePuedeSacrificarException {
            throw new NoPuedeRecorrerException(message = "El grupo no puede recorrer la zona")
        }
    }
    guerreros.forEach({ guerrero => zona.aplicarEfectos(guerrero) })
  }
}

/* ================================================================================
 * - try/catch/then always examples
 * ===============================================================================*/
class AbstractTryCatch {
  method tryWithAssignmentAndCatchWithSuperShouldPass() {
  }

  method tryWithSuperAndCatchWithAssignmentShouldPass() {
  }

}

class TryCatchAlways inherits AbstractTryCatch {
  var someVariable = 1

  method tryWithReturnAndCatchWithAssignmentShouldFail() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="try {
      return 2
    } catch e {
      someVariable = 2
    }") 
    try {
      return 2
    } catch e {
      someVariable = 2
    }
  }

  method tryWithAssignmentAndCatchWithReturnShouldFail() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="try {
      someVariable = 2
    } catch e {
      return 2
    }") 
    try {
      someVariable = 2
    } catch e {
      return 2
    }
  }

  method tryWithThenAlwaysWithAssignmentAndCatchWithReturnShouldFail() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="try {
      return 1
    } catch e {
      return 2
    } then always {
      someVariable = 3
    }") 
    try {
      return 1
    } catch e {
      return 2
    } then always {
      someVariable = 3
    }
  }

  method tryWithAssignmentAndThenAlwaysWithReturnAndCatchWithReturnShouldPass() {
    try {
      someVariable = 3
    } catch e {
      return 2
    } then always {
      return 1
    }
  }

  method tryWithIfWithReturnAndAssignmentAndCatchWithReturnShouldFail() {
    try {
      @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="if (someVariable > 1) return 1 else { someVariable = 2 }")
      if (someVariable > 1) return 1 else { someVariable = 2 }
    } catch e {
      return 2
    }
  }

  method tryWithAssignmentAndThenAlwaysWithReturnAndCatchWithThrowShouldPass() {
    try {
      someVariable = 3
    } catch e {
      throw new DomainException()
    } then always {
      return 1
    }
  }

  method tryWithAssignmentAndThenAlwaysWithThrowAndCatchWithThrowShouldPass() {
    try {
      someVariable = 3
    } catch e {
      throw new DomainException(message = "Catch failed")
    } then always {
      throw new DomainException(message = "It failed!")
    }
  }

  method tryWithLiteralAndCatchWithThrowShouldPass() =
    try {
      3
    } catch e {
      throw new DomainException(message = "Catch failed")
    }

  method tryWithLiteralAndCatchWithAssignmentShouldFail() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="try {
      3
    } catch e {
      someVariable = 3
    }")
    try {
      3
    } catch e {
      someVariable = 3
    }    
  }

  method tryWithAssignmentAndCatchWithNewShouldFail() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="try {
      someVariable = 3
    } catch e {
      new Date()
    }")
    try {
      someVariable = 3
    } catch e {
      new Date()
    }
  }

  method tryWithNewAndCatchWithAssignmentShouldFail() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="try {
      new Date()
    } catch e {
      someVariable = 3
    }")
    try {
      new Date()
    } catch e {
      someVariable = 3
    }
  }

  method tryWithAssignmentAndCatchWithReferenceShouldFail() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="try {
      someVariable = 3
    } catch e {
      someVariable
    }")
    try {
      someVariable = 3
    } catch e {
      someVariable
    }
  }

  method tryWithReferenceAndCatchWithAssignmentShouldFail() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="try {
      someVariable
    } catch e {
      someVariable = 3
    }")
    try {
      someVariable
    } catch e {
      someVariable = 3
    }
  }

  method tryWithAssignmentAndCatchWithSendShouldPass() {
    try {
      someVariable = 3
    } catch e {
      // until we have a Type System this will pass
      2.even()
    }
  }

  method tryWithSendAndCatchWithSendShouldPass() {
    try {
      // until we have a Type System this will pass
      2.even()
    } catch e {
      someVariable = 3
    }
  }

  override method tryWithAssignmentAndCatchWithSuperShouldPass() {
    try {
      someVariable = 3
    } catch e {
      // until we have a Type System this will pass
      super()
    }
  }

  override method tryWithSuperAndCatchWithAssignmentShouldPass() {
    try {
      // until we have a Type System this will pass
      super()
    } catch e {
      someVariable = 3
    }
  }

  method tryWithAssignmentAndCatchWithVariableShouldPass() {
    const local = 12
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="try {
      someVariable = 3
    } catch e {
      local
    }")
    try {
      someVariable = 3
    } catch e {
      local
    }
  }

  method tryWithVariableAndCatchWithAssignmentShouldPass() {
    const local = 13
    @Expect(code="shouldReturnAValueOnAllFlows", level="error", expectedOn="try {
      local
    } catch e {
      someVariable = 3
    }")
    try {
      local
    } catch e {
      someVariable = 3
    }
  }

}