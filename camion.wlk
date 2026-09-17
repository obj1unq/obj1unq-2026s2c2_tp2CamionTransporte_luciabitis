import cosas.*

object camion {
	const property cosas = #{}
	var capacidad = 10000
	
	method capacidad() = capacidad
	
	method capacidad(_capacidad) {
		capacidad = _capacidad
	}
	
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa) {
		cosas.remove(unaCosa)
	}
	
	method descargarTodoElCargamento(_cosas) {
		cosas.clear(_cosas)
	}
	
	method validarCarga(carga) {
		if (carga.peso() > capacidad) self.error("carga muy pesada")
	}
}