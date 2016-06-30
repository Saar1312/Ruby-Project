El objetivo de esta segunda etapa es usar conceptos que forman parte del paradigma
de orientación a objetos, como duck typing, despacho dinámico, despacho doble y
mixins; a consideración del estudiante. 


----> Es importante resaltar que el uso de introspección, reflexibidad, variables globales, variables de clase y variables de instancia de clase (particular de Ruby) no es necesario y está prohibido.


* Introspeccion (no usar b.instance_of? A o b.kind_of? A)

La introspección de tipos es una característica básica de Ruby. En Ruby, la clase Object (padre de toda clase) incluye los métodos Object#instance_of? y Object#kind_of? para comprobar la clase de cualquier instancia. La última devuelve true cuando la instancia particular a la que se le envió el mensaje era una instancia de un descendiente de esta clase en cuestión. Para clarificar, considérese seguir el siguiente código de ejemplo (que puede probarse inmediatamente con irb):

$ irb

irb(main):001:0> A=Class.new

=> A

irb(main):002:0> B=Class.new A

=> B

irb(main):003:0> a=A.new

=> #<A:0x2e44b78>

irb(main):004:0> b=B.send 'new'

=> #<B:0x2e431b0>

irb(main):005:0> a.instance_of? A

=> true

irb(main):006:0> b.instance_of? A

=> false

irb(main):007:0> b.kind_of? A

* Reflexión (informática)
Para otros usos de este término, véase Reflexión.
En informática, reflexión (o reflexión computacional) es la capacidad que tiene un programa para observar y opcionalmente modificar su estructura de alto nivel.

Normalmente, la reflexión es dinámica o en tiempo de ejecución, aunque algunos lenguajes de programación permiten reflexión estática o en tiempo de compilación. Es más común en lenguajes de programación de alto nivel ejecutándose sobre una máquina virtual, como Smalltalk o Java, y menos común en lenguajes como C.

En un sentido más amplio, la reflexión es una actividad computacional que razona sobre su propia computación.

Cuando el código fuente de un programa se compila, normalmente se pierde la información sobre la estructura del programa conforme se genera el código de bajo nivel (normalmente lenguaje ensamblador). Si un sistema permite reflexión, se preserva la estructura como metadatos en el código generado. Dependiendo de la implementación, el código con reflexión tiende a ser más lento que el que no lo tiene.

En los lenguajes que no distinguen entre tiempo de ejecución y tiempo de compilación (como las distintas variantes de Lisp), no hay diferencia entre compilación o interpretación de código y reflexión.

* Variable de clase y de instancia de clase

http://stackoverflow.com/questions/3802540/difference-between-class-variables-and-class-instance-variables

En programación orientada a objetos, una variable de clase o miembro de dato estático es una variable, al contrario que las variable de instancia, propia de la clase que la contiene, y no de instancias de la misma, esto quiere decir que todos los objetos que se creen de esta clase, comparten su valor, son llamadas variables estáticas.

Por ejemplo en Java, para invocar una variable de clase no es necesario crear un objeto de la clase pero si se quiere llamar desde otra clase es necesario escribir el nombre de la clase que la contiene seguido de un punto y el nombre de la variable, de esta forma:




IGNORAR 

class ArbolBin
	def initialize(valor,izquierdo=nil,derecho=nil)
		@val=valor
		@izq=izquierdo
		@der=derecho
	end
	def setVal(valor)
		@val=valor
	end
	def getVal()
		return @val
	end
	
end

arb ArbolBin. new