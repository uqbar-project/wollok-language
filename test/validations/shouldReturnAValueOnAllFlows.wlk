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