import cosas.*

object camion {
	const property cosas = #{}
	var capacidad = 2500
	const tara = 1000

	method pesoTotal() {
	  return tara + self.sumaDeCargamento()
	}

	method capacidad() = capacidad
	
	method capacidad(_capacidad) {
		capacidad = _capacidad
	}
	
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		self.validarDescarga(unaCosa)
		cosas.remove(unaCosa)
	}
	
	method descargarTodoElCargamento(_cosas) {
		cosas.clear(_cosas)
	}
	
	method validarCarga(carga) {
		if (( self.pesoExcedidoCon(carga)) || self.yaEstaEnElCamion(carga)) self.error(
				"no es posible cargar esto"
			)
	}

	method calculoDePesoCon(cosa){
		return self.pesoTotal() + cosa.peso()
	}

	method pesoExcedidoCon(peso) {
	  return self.calculoDePesoCon(peso) > capacidad
	}

	method validarDescarga(carga) {
		if (!self.yaEstaEnElCamion(carga)) self.error(
				"no se puede decargar cosas que no estan en el camion"
			)
	}
	
	method yaEstaEnElCamion(cosa) = cosas.contains(cosa)
	
	method cargamentoPar() = self.sumaDeCargamento().even()
	
	method sumaDeCargamento() = cosas.sum({ cosa => cosa.peso() })
	
	method hayAlgoDePeso(peso) {
		return cosas.any({ cosa => cosa.peso() == peso })
	}
	
}