object knightRider {
	method peso() { return 500 }
	method nivelDePeligrosidad() { return 10 }

	method bulto() {
		return 1
	}

	method cargar() {

	}
}

object bumblebee {
	var property forma = bumblebeeAuto

	method peso() {
		return 800
	}

	method nivelDePeligrosidad() {
		return forma.nivelDePeligrosidad()
	}

	method bulto() {
		return 2
	}

	method cargar() {
		forma = self.formaOpuesta()
	}

	method formaOpuesta() {
		if(self.nivelDePeligrosidad() == 15) {
			return bumblebeeRobot
		}
		return bumblebeeAuto
	}
}

object bumblebeeAuto {

	method nivelDePeligrosidad() {
		return 15
	}
}

object bumblebeeRobot {

	 method nivelDePeligrosidad() {
		return 30
	 }
}

object paqueteDeLadrillos {
	var property cantidad = 0

	method peso() {
		return cantidad * 2
	}

	method nivelDePeligrosidad() {
		return 2
	}

	method bulto() {
		if (cantidad <= 100) {
			return 1
		}
		if (cantidad > 100 and cantidad < 301) {
			return 2
		}
		return 3
	}


	method cargar() {
		cantidad += 12
	}
}

object arenaGranel {
	var property peso = 0

	method nivelDePeligrosidad() {
		return 1
	}

	method bulto() {
		return 1
	}

	method cargar() {
		peso +=  20
	}
}

object bateriaAntiaerea {
	var tieneMisiles = false

	method tieneMisiles() {
	  return tieneMisiles
	}

	method cambiarEstadoDeMisiles() {
		tieneMisiles = not tieneMisiles
	}

	method peso() {
		if(tieneMisiles) {
			return 300
		}
		return 200	
	} 

	method bulto() {
		if(tieneMisiles) {
			return 2
		}
		return 1
	}

	method nivelDePeligrosidad() {
		if(tieneMisiles) {
			return 100
		}
		return 0
	}

	method cargar() {
		self.cambiarEstadoDeMisiles()
	}
}

object contenedorPortuario {
	const property contenido = #{}

	method guardarEnContenedor(cosa) {
		contenido.add(cosa)
	}

	method sacarDeContenedor(cosa) {
		contenido.remove(cosa)
	}

	method peso() {
		return 100 + contenido.sum({cosa => cosa.peso()})
	}

	method nivelDePeligrosidad() {
		return contenido.max({cosa => cosa.nivelDePeligrosidad()})
	}

	method bulto() {
		return 1 + contenido.sum({cosa => cosa.bulto()})
	}
	
	method cargar() {
		contenido.forEach({cosa => cosa.cargar()})
	}
}

object residuosRadioactivos {
	var property peso = 0

	method nivelDePeligrosidad() {
		return 200
	}

	method bulto() {
		return 1
	}

	method cargar() {
		peso += 15
	}
}

object embalaje {
	var property objetoEmbalado = knightRider

	method peso() {
		return objetoEmbalado.peso()
	}

	method nivelDePeligrosidad() {
		return objetoEmbalado.nivelDePeligrosidad() / 2
	}

	method bulto() {
		return 2
	}

	method cargar() {
		
	}
}

object ruta9 {

	method limiteDePeligrosidad() {
		return 11
	}

	method limiteDePeso() {
		return 0
	}

}

object caminosVecinales {
	var property limiteDePeso = 0

	method limiteDePeligrosidad() {
		return 0
	}

}

