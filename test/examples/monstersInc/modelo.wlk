object monstersInc {
  const equipos = []
  const puertas = []

  method getEquipos() = equipos
  method agregarPuerta(puerta) { puertas.add(puerta) }
  method agregarEquipo(equipo) { equipos.add(equipo) }
  method removerEquipo(equipo) { equipos.remove(equipo) }
  method energiaTotalGenerada() {
    return equipos.sum({equipo => equipo.energiaGenerada()})
  }

  method cualquierPuerta() {
    if (puertas.size() >= 1) return puertas.anyOne()
    else throw new Exception(message = "No hay puertas")
  }

  method diaLaboral() {
    equipos.forEach({equipo => equipo.visitar(self.cualquierPuerta())})
  }

  method equipoMasAsustador() {
    return equipos.max({ equipo => equipo.energiaGenerada()})
  } 
}

class Puerta {
  var contenido

  method entra(asustador) { 
    return contenido.teVaAAsustar(asustador)
  }
}

class Equipo {
  var asustador
  var property asistente
  var property energiaGenerada = 0

  method visitar(puerta) {
    const energiaPorAsustar = energiaGenerada + asustador.entrarAPuerta(puerta)
    energiaGenerada = asistente.calcularEnergia(energiaPorAsustar)
  }
  method nuevoDia() { energiaGenerada = 0 }
}

