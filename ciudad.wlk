import camion.*
import cosas.*

object ruta {
  var nivelPermitido = 0 
  
  method nivelPermitido(_nivel) {
    nivelPermitido = _nivel
  }
  method accesoARutaPermitido(_camion) {
    return (!_camion.excedidoDePeso() && ! _camion.existenCosasConMayorNivel(nivelPermitido)) 
  }
}

object almacen {
  const elementos = #{}
  method cargar(cosa) {
		elementos.add(cosa)
	}
	
	method descargar(cosa) {
		elementos.remove(cosa)
	}
	
	method vaciar() {
		elementos.clear()
	}

    method llegadaDeCamion(_cosas) {
      elementos.addAll(_cosas)
    }

    method elementos() {
      return elementos
    }
	
}
object ruta9 {
  const nivelPermitido = 20
  
  method accesoARutaPermitido(_camion) {
    return (! _camion.existenCosasConMayorNivel(nivelPermitido) && !camion.excedidoDePeso()) 
  }
}
object caminosVecinales {
  var nivelPermitido = 0 
  var pesoMaxPermitido = 0

  method pesoMaxPermitido(){
    return pesoMaxPermitido
  }

  method pesoMaxPermitido(_max) {
    pesoMaxPermitido = _max
  }
  
  method nivelPermitido(_nivel) {
    nivelPermitido = _nivel
  }
  method accesoARutaPermitido(_camion) {
    return (!_camion.excedidoDePesoEnRuta(self)) 
  }
}