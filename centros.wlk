class CentroDeDistribucion{
	var property ciudad
	const property vendedores= []
	
	method agregar(vendedor){	
		if (not vendedores.contains(vendedor)) { vendedores.add(vendedor) }
		else{	console.println("El vendedor ya ha sido cargado") }
	}
	
	method vendedorEstrella()=
		vendedores.max({vendedor => vendedor.puntajeCertificaciones()})
	
	
	method puedeCubrir(ciudadDada)=
		vendedores.any({vend => vend.puedeTrabajarEn(ciudadDada)})
	
	method vendedoresGenericos()=
		vendedores.filter({v => v.esGenerico()})
	
	method esRobusto()=
		vendedores.count({v => v.esFirme()}) >= 3
	
	method repartir(unaCertificacion){
		vendedores.apply({v => v.agregar(unaCertificacion)})
	}
}