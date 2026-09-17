object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10
}

object arenaAGranel {
	var peso = 0
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
	method nivelPeligrosidad() = 1
}

object bumblebee {
	var estado = auto
	
	method estado() = estado
	
	method estado(_estado) {
		estado = _estado
	}
	
	method peso() = 800
	
	method nivelPeligrosidad() = estado.peligrosidad()
}

object auto {
	method peligrosidad() = 15
}

object robot {
	method peligrosidad() = 30
}

object paqueteDeLadrillos {
	var cantidad = 0
	
	method cantidad(_cantidad) {
		cantidad = _cantidad
	}
	
	method cantidad() = cantidad
	
	method peso() = cantidad * 2
	
	method nivelPeligrosidad() = 2
}

object bateríaAntiaérea {
	var misiles = true
	
	method misiles() = misiles
	
	method misiles(_misiles) {
		misiles = _misiles
	}

	method peso() = if(misiles) 300 else 200
	
	method nivelPeligrosidad() = if(misiles) 100 else 0
}

object residuosRadiactivos {
	var peso = 0
	
	method peso(_peso) {
		peso = _peso
	}
	
	method peso() = peso
	
	
	method nivelPeligrosidad() = 200
}
