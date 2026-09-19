import cosas.*
import ciudad.*

object camion {
	var capacidad = 2500
	const tara = 1000
	
	method tara() = tara
	
	method capacidad() = capacidad
	
	method capacidad(_capacidad) {
		capacidad = _capacidad
	}
	
	method pesoTotal() = self.tara() + cargamento.sumaDeCargamento()
	
	method excedidoDePeso() = self.pesoTotal() > self.capacidad()
	
	method excedidoDePesoEnRuta(_ruta) = self.pesoTotal() > _ruta.pesoMaxPermitido()
	
	method pesoExcedidoCon(peso) = cargamento.calculoDePesoCon(
		peso
	) > self.capacidad()
	
	method cargar(unaCosa) {
		self.validarCarga(unaCosa)
		cargamento.agregar(unaCosa)
	}
	
	method descargar(unaCosa) {
		self.validarDescarga(unaCosa)
		cargamento.remover(unaCosa)
	}
	
	method descargarTodoElCargamento() {
		cargamento.vaciar()
	}
	
	method validarCarga(carga) {
		if (self.pesoExcedidoCon(carga) || cargamento.yaEstaEnElCamion(carga))
			self.error("no es posible cargar esto")
	}
	
	method validarDescarga(carga) {
		if (!cargamento.yaEstaEnElCamion(carga)) self.error(
				"no se puede decargar cosas que no estan en el camion"
			)

			
	}
	
	method cargamentoPar() = cargamento.cosasPar()
	
	method hayAlgoDePeso(peso) = cargamento.hayAlgoDePeso(peso)
	
	method cosaDeNivel(nivel) = cargamento.cosaConNivelDePeligrosidad(nivel)
	
	method cosasConMayorNivel(nivel) = cargamento.superanNivel(nivel)
	
	method cosasMasPeligrosasQue(cosa) = cargamento.masPeligrosasQue(cosa)
	
	method existenCosasConMayorNivel(nivel) = cargamento.hayCosasQueSuperanNivel(
		nivel
	)
	
	method puedeCircularRuta(_ruta) = _ruta.accesoARutaPermitido(self)
	
	method existeCosaDePesoEntre(peso1, peso2) = cargamento.cosaDePesoEntre(
		peso1,
		peso2
	)
	
	method cosaMasPesada() = cargamento.cosaMasPesada()
	
	method pesosDeTodoElCargamento() = cargamento.pesoDeCosas()
	
	method cantidadDeBultosTotales() = cargamento.cantidadDeBultos()
	
	method accidente() = cargamento.cargamentoConAccidente()
	
	method descargarEnDestino(destino) {
		cargamento.descargarEnDestino(destino)
		self.descargarTodoElCargamento()
	}

	
	method transportar(destino, camino){
				self.validarCamino(camino)
				self.descargarEnDestino(destino)
			}

method validarCamino(camino){
	if(!camino.accesoARutaPermitido(self)){self.error("no es posible tomar este camino")}
}
}

object cargamento {
	const property cosas = #{}
	
	method agregar(cosa) {
		cosas.add(cosa)
	}
	
	method remover(cosa) {
		cosas.remove(cosa)
	}
	
	method vaciar() {
		cosas.clear()
	}
	
	method calculoDePesoCon(cosa) = camion.pesoTotal() + cosa.peso()
	
	method yaEstaEnElCamion(cosa) = cosas.contains(cosa)
	
	method cosasPar() = cosas.all({ cosa => cosa.peso().even() })
	
	method sumaDeCargamento() = cosas.sum({ cosa => cosa.peso() })
	
	method hayAlgoDePeso(peso) = cosas.any({ cosa => cosa.peso() == peso })
	
	method cosaConNivelDePeligrosidad(nivel) = cosas.find(
		{ cosa => cosa.nivelPeligrosidad() == nivel }
	)
	
	method masPeligrosasQue(_cosas) = self.superanNivel(_cosas.nivelPeligrosidad())
	
	method superanNivel(nivel) = cosas.filter(
		{ cosa => cosa.nivelPeligrosidad() > nivel }
	)
	
	method hayCosasQueSuperanNivel(nivel) = !self.superanNivel(nivel).isEmpty()
	
	method cosaDePesoEntre(peso1, peso2) = cosas.any(
		{ cosa => cosa.peso().between(peso1, peso2) }
	)
	
	method cosaMasPesada() = cosas.max({ cosa => cosa.peso() })
	
	method pesoDeCosas() = cosas.map({ cosa => cosa.peso() })
	
	method cantidadDeBultos() = cosas.sum({ cosa => cosa.bultos() })
	
	method cargamentoConAccidente() = cosas.forEach(
		{ cosa => cosa.sufrirAccidente() }
	)
	
	method descargarEnDestino(destino) {
		destino.llegadaDeCamion(cosas)
	}
}