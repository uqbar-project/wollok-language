import trenes.*

class Deposito {
  const formaciones = []

  method agregarFormacion(unTren) { formaciones.add(unTren) }
  method vagonesMasPesados() { return formaciones.map { tren => tren.vagonMasPesado()} }
}

const tren1 = new Tren()