object joaquin {
  const tocaEnGrupo = false
  var property nombre = ""
  var property apellido = ""
  var property anioComienzo = 1990
  var property anioNacimiento = 1980
  
  method felicidad() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error")
    if (tocaEnGrupo) return 5
  }

  method felicidadConMetodoGet() =
    @Expect(code="shouldReturnAValueOnAllFlows", level="error")
    if (tocaEnGrupo) 5

  method felicidadOFecha() =
    // OK
    if (tocaEnGrupo) 5 else new Date().plusDays(30)

  method felicidadONombre() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error")
    if (tocaEnGrupo) return 5 else apellido = "Spinetta"
  }

  method alegria() {
    return @Expect(code="shouldReturnAValueOnAllFlows", level="error") if (tocaEnGrupo) 22
  }

  method calcularNombre() {
    return @Expect(code="shouldReturnAValueOnAllFlows", level="error") if (tocaEnGrupo) 22 else nombre = "Luis"
  }

  method definirNombre() {
    return @Expect(code="shouldReturnAValueOnAllFlows", level="error") if (tocaEnGrupo) nombre = "Luis" else 22
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

  method returningValueOrError() {
    if (tocaEnGrupo) return 2 else throw new DomainException(message = "No toca en grupo")
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
    @Expect(code="shouldReturnAValueOnAllFlows", level="error")
    if (self.getFoo() == "Foo")  
      return "Foo"
  }
  
  method getZoo2() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error")
    if (self.getFoo() == "Foo")
      return "Foo"
    
    var a = 2
    a += 1
  }
  
  method getXoo() { 
    @Expect(code="shouldReturnAValueOnAllFlows", level="error")
    if (self.getFoo() == "Foo")  
      return "Foo"
    else
      "Bar"
  }
  
  method getXoo2() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error")
    if (self.getFoo() == "Foo") {
      var a = 23
      a += 2
      return a
    }
    else
      "Bar"
  }
  
  method getXoo3() {
    @Expect(code="shouldReturnAValueOnAllFlows", level="error") 
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
      .map{ p =>
        return p
      }
  }

}
