class Cliente {
	method puedeSerAtentidoPor(vendedor)
}

class Inseguro inherits Cliente {
	override method puedeSerAtentidoPor(vendedor)=
		vendedor.esVersatil() and vendedor.esFirme()	
}

class Detallista inherits Cliente {
	override method puedeSerAtentidoPor(vendedor)=
		vendedor.certificacionesDeProductos() >= 3
}

class Humanista inherits Cliente {
	override method puedeSerAtentidoPor(vendedor)=
		vendedor.esPersonaFisica()
}