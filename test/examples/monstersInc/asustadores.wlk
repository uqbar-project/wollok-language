class Asustador {
  var property edad = 0
  var property nivelMotivacion = 100

  method entrarAPuerta(puerta) {
    return puerta.entra(self)
  }

  method asustar(ninio) {
    const a = self.getPorcentaje()
    return a * self.puntosDeTerror() / ninio.edad()
  }
  method getPorcentaje() {
    return nivelMotivacion / 100
  }

  method puntosDeTerror()

  method reducirMotivacion(cuantoPorCiento) {
    nivelMotivacion -= cuantoPorCiento * nivelMotivacion
  }
}

class AsustadorNato inherits Asustador {
  var puntosTerrorInnatos

  override method puntosDeTerror() {
    return puntosTerrorInnatos * self.edad()
  }
}

class AsustadorPerseverante inherits Asustador {
  var puntosDeTerror = 0

  method mejora(actividad) {
    puntosDeTerror += actividad.calcularMejora()
  }

  override method puntosDeTerror() = puntosDeTerror
}
