class Actividad {
  method calcularMejora()
}

class EstudiarMateria inherits Actividad {
  var materia
  var puntos = 0

  override method calcularMejora() = puntos
}

class EjercitarEnSimulador inherits Actividad {
  var horas = 0
  override method calcularMejora() = 10 * horas
}