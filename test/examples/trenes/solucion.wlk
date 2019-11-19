class Deposito {
  const formaciones = []

  method agregarFormacion(unTren) { formaciones.add(unTren) }
  method vagonesMasPesados() { return formaciones.map { tren => tren.vagonMasPesado()} }
}

class Tren {
  const vagones = []
  const locomotoras = []

  method agregarVagon(vagon) { vagones.add(vagon) }
  method cantidadPasajeros() = vagones.sum{ vagon => vagon.cantidadPasajeros() }
  method cantidadVagonesLivianos() = vagones.count { vagon => vagon.esLiviano()}
  method velocidadMaxima() = locomotoras.min{ locomotora => locomotora.velocidadMaxima() }.velocidadMaxima()
  method agregarLocomotora(loco) { locomotoras.add(loco)  }
  method esEficiente() = locomotoras.all{l=> l.esEficiente()}
  method puedeMoverse() = self.arrastreUtilTotalLocomotoras() >= self.pesoMaximoTotalDeVagones()
  method arrastreUtilTotalLocomotoras() = locomotoras.sum {l=> l.arrastreUtil() }
  method pesoMaximoTotalDeVagones() = vagones.sum{v=> v.pesoMaximo()}
  method kilosEmpujeFaltantes() =
    if (self.puedeMoverse())
      0
    else
      self.pesoMaximoTotalDeVagones() - self.arrastreUtilTotalLocomotoras()

  method vagonMasPesado() = vagones.max({ vagon => vagon.pesoMaximo() })
}

class Locomotora {
  var peso
  var pesoMaximoArrastre
  var velocidadMaxima
  method velocidadMaxima() = velocidadMaxima 

  method esEficiente() = pesoMaximoArrastre >= 5 * peso
  method arrastreUtil() = pesoMaximoArrastre - peso
}

class Vagon {
  method esLiviano() = self.pesoMaximo() < 2500
  method cantidadPasajeros() 
  method pesoMaximo()
}

class VagonPasajeros inherits Vagon {
  var ancho
  var largo

  override method cantidadPasajeros() {
    return largo * if (ancho < 2.5) 8 else 10
  }
  override method pesoMaximo() {
    return self.cantidadPasajeros() * 80
  }
}

class VagonCarga inherits Vagon {
  var cargaMaxima
  override method cantidadPasajeros() = 0
  override method pesoMaximo() = cargaMaxima + 160
}
