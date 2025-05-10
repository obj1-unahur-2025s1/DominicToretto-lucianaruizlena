import dominic.*

object laFerrari {
  var motor = 87

  method motor() = motor.between(0, 100) 
  method estaEnCondiciones() = motor >= 65
  method reparar() { motor = 100 }
  method velocidadMaxima() = if (motor > 75){110 + 15} else {110} // 110 + if(motor > 75){15} else{0}
  method hacerPrueba() {
    motor = (motor - 30).max(0)    
  }
}

object laFlechaRubi {
  var cantidadCombustible = 100
  var color = azul
  var property combustible = gasolina
  
  method cambiarColor(nuevoColor) {color = nuevoColor}

  method enCondiciones() = 
    cantidadCombustible > combustible.nivelMinimo(cantidadCombustible) && 
    color.esAptoParaCorrer()

  method hacerPrueba() {
    cantidadCombustible = (cantidadCombustible - 5).max(0)    
  }

  method reparar() {
    cantidadCombustible = cantidadCombustible * 2
    color = color.cambiarDeColor()
  }

  method velocidadMaxima() = cantidadCombustible * 2 + combustible.combustibleAdicional(cantidadCombustible)
}

object gasolina {
  method nivelMinimo() = 85
  method combustibleAdicional(litros) = 10
}

object nafta {
  method nivelMinimo() = 50
  method combustibleAdicional(litros) = ((litros * 2) * 0.10) * -1 //el -1 transforma el valor negativo, permitiendo restar el 10% en vez de sumárselo.
}

object nitrogeno {
  method nivelMinimo() = 0
  method combustibleAdicional(litros) = litros * 2 * 10 
}

object rojo {
  method cambiarDeColor() = azul
  method esAptoParaCorrer() = true
}

object azul {
  method cambiarDeColor() = verde 
  method esAptoParaCorrer() = false
  
}

object verde {
  method cambiarDeColor() = rojo
  method esAptoParaCorrer() = false
  
}

object elIntocable {
  var property enCondiciones = true

  method hacerPrueba() {
    enCondiciones = false
  }

  method reparar() {
    enCondiciones = true    
  }

  method velocidadMaxima() = 45 
}

object inventado {
  var motor = 55
  var property enCondiciones = false
  method velocidadMaxima() = if(motor >= 50){80} else{50}

  method motor() = motor 

  method reparar() {
    motor = 100
    enCondiciones = true
  }

  method hacerPrueba() {
    motor = motor - 50.max(0)
    enCondiciones = false
  }
}