object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10
	
	method bultos() = 1
	
	method sufrirAccidente() {
		
	}
}

object arenaAGranel {
	var peso = 0
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
	method nivelPeligrosidad() = 1
	
	method bultos() = 1
	
	method sufrirAccidente() {
		peso += 20
	}
}

object bumblebee {
	var estado = auto
	
	method estado() = estado
	
	method estado(_estado) {
		estado = _estado
	}
	
	method peso() = 800
	
	method nivelPeligrosidad() = estado.peligrosidad()
	
	method bultos() = 2
	
	method sufrirAccidente() {
		estado = estado.siguienteEstado()
	}
}

object auto {
	method peligrosidad() = 15
	
	method siguienteEstado() = robot
}

object robot {
	method peligrosidad() = 30
	
	method siguienteEstado() = auto
}

object paqueteDeLadrillos {
	var cantidad = 0
	
	method cantidad(_cantidad) {
		cantidad = _cantidad
	}
	
	method cantidad() = cantidad
	
	method peso() = cantidad * 2
	
	method nivelPeligrosidad() = 2
	
	method bultos() = if (cantidad <= 100) {
		1
	} else {
		if (cantidad.between(101, 300)) 2 else 3
	}
	
	method sufrirAccidente() = if (cantidad >= 12) {
		cantidad -= 12
	} else {
		cantidad = 0
	}
}

object bateríaAntiaérea {
	var estado = misiles
	
	method estado() = estado
	
	method estado(_estado) {
		estado = _estado
	}
	
	method peso() = estado.peso()
	
	method nivelPeligrosidad() = estado.nivelPeligrosidad()
	
	method bultos() = estado.bultos()
	
	method sufrirAccidente() {
        estado = misilesAusentes
    }
}

object misiles {
	const nivelPeligrosidad = 100
	
	method peso() = 300
	
	method nivelPeligrosidad() = nivelPeligrosidad
	
	method bultos() = 2
}

object misilesAusentes {
	const nivelPeligrosidad = 0
	
	method peso() = 200
	
	method nivelPeligrosidad() = nivelPeligrosidad
	
	method bultos() = 1
}

object residuosRadiactivos {
	var peso = 0
	const nivelPeligrosidad = 200
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
	method nivelPeligrosidad() = nivelPeligrosidad
	
	method bultos() = 1
	
	method sufrirAccidente() {
		peso += 15
	}
}

object contenedorPortuario {
	const elementos = #{}
	const pesoBase = 100
	const bultoBase = 1
	
	method peso() = elementos.sum({ cosas => cosas.peso() }) + pesoBase
	
	method nivelPeligrosidad() = if (elementos.isEmpty()) 0
	                             else
	                             	self.elementoMasPeligroso().nivelPeligrosidad()
	
	method elementoMasPeligroso() = elementos.max(
		{ cosa => cosa.nivelPeligrosidad() }
	)
	
	method cargar(cosa) {
		elementos.add(cosa)
	}
	
	method descargar(cosa) {
		elementos.remove(cosa)
	}
	
	method vaciar() {
		elementos.clear()
	}
	
	method bultos() = elementos.sum({ cosas => cosas.bultos() }) + bultoBase
	
	method sufrirAccidente() = elementos.forEach(
		{ cosa => cosa.sufrirAccidente() }
	)
}

object embalajeDeSeguridad {
	var elementoEnvuelto = residuosRadiactivos
	
	method elementoEnvuelto() = elementoEnvuelto
	
	method elementoEnvuelto(_elemento) {
		elementoEnvuelto = _elemento
	}
	
	method peso() = elementoEnvuelto.peso()
	
	method nivelPeligrosidad() = elementoEnvuelto.nivelPeligrosidad() * 0.5
	
	method bultos() = 2
	
	method sufrirAccidente() {
		
	}
}