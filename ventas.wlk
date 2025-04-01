import prendas.*
class Venta{
    const property fecha
    const prendas = []
    const medioDePago
    method total() = medioDePago.recargo(prendas) + prendas.sum({prenda=>prenda.precio()})
    method cantPrendas() = prendas.size()
   
}

class Fecha{
    const property dia
    const property mes 
    const property anio
}

class Pago{
    method recargo(prendas)
}
class Tarjeta inherits Pago{
    const nroCuotas 
    const coeficiente 
    override method recargo(prendas) = nroCuotas.max(-1*nroCuotas) * coeficiente.max(-1*coeficiente) + self.el1porciento(prendas)
    method el1porciento(prendas) = prendas.sum({prenda => prenda.precio()}) /100
}
object efectivo inherits Pago{
    override method recargo(prendas) = 0
}

object historialDeVentas{
    const ventas = []
    method ventasDelDia(fechaDeConsulta) = ventas.filter({venta => self.perteneceAlDia(fechaDeConsulta, venta)})
    method gananciaDelDia(fechaDeConsulta) = self.ventasDelDia(fechaDeConsulta).sum({venta => venta.total()})
    method agregar(venta) = ventas.add(venta)
    method perteneceAlDia(fechaDeConsulta,venta)= ( 
        fechaDeConsulta.dia() == venta.fecha().dia() && 
        fechaDeConsulta.mes() == venta.fecha().mes() && 
        fechaDeConsulta.anio()== venta.fecha().anio())
      
    
}