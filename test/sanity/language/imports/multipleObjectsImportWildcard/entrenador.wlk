import aves.*

object mostaza {
  method entrenar() {
    return [pepita, pepona].map{ ave => ave.nombre() }.join(",")
  }
}
