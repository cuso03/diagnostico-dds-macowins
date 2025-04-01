import ventas.*
class Prenda{
    var property estado
    const  precioBase
    method precio() = estado.precio(precioBase.max(0)) //el precio base debe ser mayor a cero 
}

class Saco inherits Prenda{
    
}

class Camisa inherits Prenda{

}

class Pantalon inherits Prenda{

}

class Estado{
    method precio(precioBase) 
}
object nuevo inherits Estado{
    override method precio(precioBase)= precioBase
}

class Promocion inherits Estado{
    const valorADescontar
    override method precio(precioBase) = precioBase- valorADescontar.max(-1*valorADescontar)
}
class Liquidacion inherits Estado{
    const descuento
    override method precio(precioBase) = precioBase - self.porcentaje(precioBase)
    method porcentaje(precioBase)= descuento.max(-1*descuento) *  precioBase /100 
}