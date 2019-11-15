class Asustable {
  method teVaAAsustar(asustador)
}

class Ninio inherits Asustable {
  var property edad = 0

  override method teVaAAsustar(asustador) {
    return asustador.asustar(self)
  }
}

class Piyamada inherits Asustable {
  const ninios = []
  method agregarNinio(nene) { ninios.add(nene) }
  override method teVaAAsustar(asustador) {
    return ninios.fold(0, {acum, nene => 
      acum + asustador.asustar(nene)
    })
  }
}

class Adulto inherits Asustable {
}

class Adolescente inherits Asustable {
  override method teVaAAsustar(asustador) {
    const factor = 0.10
    asustador.reducirMotivacion(factor)
    return 0
  }
}
