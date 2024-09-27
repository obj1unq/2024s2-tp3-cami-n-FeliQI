object knightRider {
	method peso() { return 500 }
	method nivelDePeligrosidad() { return 10 }

	method bulto() {
		return 1
	}

	method serCargada() {

	}
}

object bumblebee {
	var property forma = formaAuto

	method peso() {
		return forma.peso()
	}

	method nivelDePeligrosidad() {
		return forma.nivelDePeligrosidad()
	}

	method bulto() {
		return 2
	}

	method serCargada() {
		forma = forma.serCargada()
	}

}

object formaAuto {

	method nivelDePeligrosidad() {
		return 15
	}

	method peso() {
		return 800
	}

	method serCargada() {
		return formaRobot
	}
}

object formaRobot {

	 method nivelDePeligrosidad() {
		return 30
	 }

	 method peso() {
		return 800
	}

	method serCargada() {
		return self
	}

}

class PaqueteDeLadrillos {
	var property cantidad = null

	method peso() {
		return cantidad * 2
	}

	method nivelDePeligrosidad() {
		return 2
	}

	method bulto() {
		return if (cantidad <= 100) {
			1
		}
		else if (cantidad < 301) {
			2
		}
		else 3
	}


	method serCargada() {
		cantidad += 12
	}
}


class ArenaGranel {
	var property peso = null

	method nivelDePeligrosidad() {
		return 1
	}

	method bulto() {
		return 1
	}

	method serCargada() {
		peso +=  20
	}
}

class BateriaAntiaerea {
	var tieneMisiles = null

	method tieneMisiles() {
	  return tieneMisiles
	}

	method cargarMisiles() {
		tieneMisiles = true
	}

	method descargarMisiles() {
		tieneMisiles = false
	}

	method peso() {
		return if(tieneMisiles) {
			300
		}
		else 200	
	} 

	method bulto() {
		return if(tieneMisiles) {
			2
		}
		else 1
	}

	method nivelDePeligrosidad() {
		if(tieneMisiles) {
			return 100
		}
		return 0
	}

	method serCargada() {
		self.cargarMisiles()
	}
}

class ContenedorPortuario {
	const property contenido = null

	method guardarEnContenedor(cosa) {
		contenido.add(cosa)
	}

	method sacarDeContenedor(cosa) {
		contenido.remove(cosa)
	}

	method peso() {
		return 100 + contenido.sum({cosa => cosa.peso()})
	}

	method validarContenido() {
		return if(contenido.isEmpty()){
			self.error("El contenedor se encuentra vacio")
		}
	}

	method nivelDePeligrosidad() {
		self.validarContenido()
		return contenido.max({cosa => cosa.nivelDePeligrosidad()})
	}

	method pesoContenido() {
		return contenido.sum({cosa => cosa.bulto()})
	}

	method bulto() {
		return 1 + self.pesoContenido()
	}
	
	method serCargada() {
		contenido.forEach({cosa => cosa.serCargada()})
	}
}

class ResiduosRadioactivos {
	var property peso = null

	method nivelDePeligrosidad() {
		return 200
	}

	method bulto() {
		return 1
	}

	method serCargada() {
		peso += 15
	}
}

class Embalaje {
	var property cosaEmbalada = null

	method peso() {
		return cosaEmbalada.peso()
	}

	method nivelDePeligrosidad() {
		return cosaEmbalada.nivelDePeligrosidad() / 2
	}

	method bulto() {
		return 2
	}

	method serCargada() {
		
	}
}

object ruta9 {

	method limiteDePeligrosidad() {
		return 11
	}

	method puedeCircular(vehiculo) {
		return if(not vehiculo.puedeCircularEnRuta(self.limiteDePeligrosidad())) {
			self.error("El vehiculo no puede recorrer el camino" + self)
		}
	}

}

class CaminosVecinales {
	var property limiteDePeso = null

	method superaPesoLimite(vehiculo) {
		return vehiculo.pesoTotal() > limiteDePeso
	}

	method puedeCircular(vehiculo) {
		return if(self.superaPesoLimite(vehiculo) or vehiculo.excedidoDePeso()) {
			self.error("El vehiculo no puede recorrer el camino" + self)
		}
	}

}

