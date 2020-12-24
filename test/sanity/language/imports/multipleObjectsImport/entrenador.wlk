import aves.pepita
import aves.pepona

object mostaza {
  method entrenar() {
    return [pepita, pepona].map{ ave => ave.nombre() }.join(",")
  }
}
