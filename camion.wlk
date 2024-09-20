import cosas.*

object camion {
	const property cosas = #{}
	const pesoTara = 1000
		
	method cargar(cosa) {
		cosas.add(cosa)
		cosa.cargar()
	}

	method descargar(cosa) {
		cosas.remove(cosa)
	}

	method todoPesoPar() {
		return cosas.all({cosa => cosa.peso().even()})
	}

	method hayAlgunoQuePesa(peso) {
		return cosas.any({cosa => cosa.peso() == peso})
	}

	method elDeNivel(nivel) {
		return cosas.find({cosa => cosa.nivelDePeligrosidad() == nivel})
	}

	method pesoTotal() {
		return pesoTara + cosas.sum({cosa => cosa.peso()})
	}

	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({cosa => cosa.nivelDePeligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(cosa) {
		return cosas.filter({carga => carga.nivelDePeligrosidad() > cosa.nivelDePeligrosidad()})
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() and
		self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}

	method tienenAlgoPesadoEntre(min, max) {
		return cosas.any({cosa => self.cosaConPesoEntre(cosa, min, max) })
	}

	method cosaConPesoEntre(cosa, min, max) {
		return cosa.peso() > min and cosa.peso() < max 
	}

	method cosaMasPesada() {
		return cosas.max({cosa => cosa.peso()})
	}

	method pesos() {
		return cosas.map({cosa => cosa.peso()})
	}

	method totalBultos() {
		return cosas.sum({cosa => cosa.bulto()})
	}

	method pesoSuperaLimite(camino) {
		return self.pesoTotal() > camino.limiteDePeso()
	}

	method validarRuta(camino) {
		if(not self.puedeCircularEnRuta(camino.limiteDePeligrosidad()) and self.pesoSuperaLimite(camino)) {
			self.error("El camion no puede recorrer la ruta asignada")
		}
	}

	method validarDestino(destino) {
		if(self.totalBultos() > destino.limiteDeBultos()) {
			self.error("El numero de bultos del camion" + self.totalBultos() +
			"excede el limite de bultos del destino")
		}
	}

	method transportar(destino, camino) {
		self.validarRuta(camino)
		self.validarDestino(destino)
		destino.descargar(cosas)
		cosas.clear()
	}

}

object almacen {
	const property galpon = #{}
	var property limiteDeBultos = 3

	method descargar(cosas) {
		galpon.addAll(cosas)
	}
}
