Disculpen, ya sé que pedían q las explicaciones las haga dentro del archivo de pseudocódigo.

Requerimientos: 
-Saber el precio de venta de una prenda en función del estado en el que se encuentre ya sea en liquidación, promoción o nuevo
-Saber el tipo de prenda: sacos, pantalones y camisas 
-registrar las ventas de prendas 
-registrar las ganancias de un determinado día
-una venta debe estar compuesta por prendas , fecha y el medio de pago con el que se realizo ;y se debe obtener la cantidad de prendas y el consumidor final en base al medio de pago.

Explicación del modelado

Prendas
creamos la clase prenda de la cual viene dada por el precio base(que debe ser mayor a 0) y el estado en el que se encuentra. A partir de esto se debe calcular el precio en función del estado, se dice que se vinculan por medio de una composición. Las clsae prenda tiene sus subsclases de acuerdo al tipo de prenda, actualmente no hay ningún atributo o método que haga que se diferencien pero tomé está decisión para demostrar la naturaleza del dominio y a largo plazo si surge alguna diferencia en comportamiento o atributos poder agregarla.

El estado es una clase que calcula el precio "actual" que va adoptar la prenda dependiendo si es nueva, es promo o es liquidación. El estado es la clase padre y nuevo es un objeto hijo (es objeto porque no hay diferentes tipos de nuevo, existe un único nuevo en este dominio), mientras que liquidación y promción son clases hijos. Podría haber hecho que Liquidación sea un objeto pq en el enunciado me dicen que hace referencia al 50%, pero en el día a día existen diferentes liquidaciones y  es probable que en un futuro se pueda actualizar el sistema con más variantes de liquidaciones.Bueno, del método abstracto precio con el párametro precio base , cada hijo calcula polimorficamente el precio.

Me tomé la libertad de en el código agregarle a las propiedades de los diferentes tipos de estado "valor.max(-1*valor )" , por el simple hecho de que depende de como el usuario lo tome, cuando agregue un estado nuevo puede ir con valores negativos o no. Lo mismo se va a ver en los medios de pago para evitar que estos tomen valores negativos si es que se cargaron así.

Ventas
Los requerimientos me detallan cuales son atributos(que necesito si o si) y cuales voy a poder calcular u obtener gracias a estos(total y cantidad de prendas). La fecha y el medio de pago son clases que se vinculan por medio de la composición con la venta. 
El método de pago tiene sus hijos , la clase tarjeta que pueden instanciarse de multiples maneras y el objeto efectivo (pq hay una sola manera de pagar en efectivo), ambas calculan polimorficamente el recargo que se aplica al costo total de cada venta. 

El historial de ventas es un acumulador de ventas que en base al día te va a retornar las ganacias y las ventas del mismo, todo esto lo hace por medio de un filtrado de que si el dia a consultar es el mismo al dia con el que fue instanciado cierta venta.