import autos.*

object dominic {
  const autos = []

  method comprar(auto) {
    autos.add(auto)
  }

  method autosNoEnCondiciones() = autos.filter({auto => !auto.estaEnCondiciones()})
  method autosEnCondiciones() = autos.filter({auto => auto.estaEnCondiciones()})

  method enviarAutoDañadoATaller() {
    taller.recibirAutos(self.autosNoEnCondiciones())
  }

  method hacerPruebaDeVelocidad() {
     autos.forEach({auto => auto.hacerPrueba()})
  }

  method venderTodosLosAutos() {
    autos.clear()    
  }

  method promedioDeVelocidades() = autos.sum({auto => auto.velocidadMaxima()}) / autos.size()

  method autoMasRapido() = self.autosEnCondiciones().max({auto => auto.velocidadMaxima()})

  method hayAutoMasRapidoDelPromedio() = self.autoMasRapido().velocidadMaxima() > self.promedioDeVelocidades() *2
  
}

object taller {
  const autosAReparar = []

  method recibirAutos(listaDeAutos) {
    autosAReparar.addAll(listaDeAutos)
  }

  method repararAutos() {
    autosAReparar.forEach({auto => auto.reparar()})
    autosAReparar.clear()
  }
}