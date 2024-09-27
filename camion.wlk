import cosas.*

class Camion{
	const property cosas = null
	const pesoTara = null
	var property pesoMaximo = null

	method cargar(cosa) {
		cosas.add(cosa)
		cosa.serCargada()
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

	method pesoCarga() {
		return cosas.sum({cosa => cosa.peso()})
	}

	method pesoTotal() {
		return pesoTara + self.pesoCarga()
	}

	method excedidoDePeso() {
		return self.pesoTotal() > pesoMaximo
	}

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({cosa => cosa.nivelDePeligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(cosa) {
		return self.objetosQueSuperanPeligrosidad(cosa.nivelDePeligrosidad())
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() and
		self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}

	method tienenAlgoPesadoEntre(min, max) {
		return cosas.any({cosa => cosa.peso().between(min, max) })
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

	method transportar(destino, camino) {
		camino.puedeCircular(self)
		destino.puedeDescargar(self)
		destino.descargar(cosas)
		cosas.clear()
	}

}

 

class Almacen {
	const property galpon = null
	var property limiteDeBultos = null

	method puedeDescargar(vehiculo) {
		return if(vehiculo.totalBultos() > limiteDeBultos) {
			self.error("El numero de bultos del camion: " + vehiculo.totalBultos() +
			"excede el limite de bultos del destino: " + limiteDeBultos)
		}
	}

	method descargar(cosas) {
		galpon.addAll(cosas)
	}
}


