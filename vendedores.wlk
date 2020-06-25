import geografia.*

class Vendedor {
	const property certificaciones = [] 
	const cantCertificaciones = certificaciones.size()
	const property certificacionesDeProductos = certificaciones.count({cert => cert.esSobreProductos()})
	const certificacionesDeNoProductos = cantCertificaciones - certificacionesDeProductos
	
	method puedeTrabajarEn(ciudad)
	
	method esVersatil()=
		cantCertificaciones == 3 and
		certificacionesDeProductos >=1 and
		certificacionesDeNoProductos >= 1
		
	method esGenerico()=
		certificacionesDeNoProductos >= 1
		
	method esFirme()=
		certificaciones.sum({cert => cert.puntos()}) >= 30
	
	method esInfluyente()
	
	method puntajeCertificaciones()=
		certificaciones.sum({c => c.puntos()})
	
	method agregar(certificacion){
		certificaciones.add(certificacion)
	}
	
	method tieneAfinidadCon(centro)=
		self.puedeTrabajarEn(centro.ciudad())
	
	method esCandidado(centro)=
		self.esVersatil() and self.tieneAfinidadCon(centro)
	
	method esPersonaFisica()
}

class Fijo inherits Vendedor {
	var property ciudad
	
	override method puedeTrabajarEn(esaCiudad)=
		ciudad == esaCiudad
	
	override method esInfluyente()= false
	
	override method esPersonaFisica()= true
		
}

class Viajante inherits Vendedor{
	const property provincias = []
	
	override method puedeTrabajarEn(esaCiudad)=
		provincias.contains(esaCiudad.provincia())
	
	override method esInfluyente()=
		provincias.sum({prov => prov.poblacion()}) > 10000000
	
	override method esPersonaFisica()= true
}

class ComercioCorresponsal inherits Vendedor{
	const property ciudades= []
	
	override method puedeTrabajarEn(esaCiudad)=
		ciudades.contains(esaCiudad)
	
	override method esInfluyente()=
		ciudades.size() >= 5 or
		ciudades.filter({ c => c.provincia() }).asSet().size() >=3
	
	override method tieneAfinidadCon(centro)=
		super(centro) and ciudades.any({c => not centro.puedeCubrir(c)})
	
	override method esPersonaFisica()= false
}


class Certificacion{
	var property puntos = 0
	var property esSobreProductos = true
}