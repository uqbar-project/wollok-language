
class AsistenteNormal {
  method calcularEnergia(energia) = energia
}

class AsistenteIneficiente {
  var reduce = 0
  method calcularEnergia(energia) = energia - reduce
}

class AsistenteSupereficiente {
  var factor
  method calcularEnergia(energia) = energia * (1 + factor)
}