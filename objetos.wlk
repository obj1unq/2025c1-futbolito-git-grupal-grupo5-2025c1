/** First Wollok example */
import wollok.game.*

object lionel {
/*
Camiseta Hacer que Lionel cambie su camiseta al apretar la tecla c. 
Si tiene la camiseta titular pasará a usar la suplente y viceversa. 
Validar que solo se puede realizar si lionel está sobre el borde izquierdo (El x de la posición debe ser 0)
*/
	var property position = game.at(3,5)

	var property camiseta = "lionel-titular.png"
	var property bocha = pelota

	method patear(){
		self.validarPatear()
		bocha.pateada()
	}
	method validarPatear(){
		if(! self.puedoPatear()){
			self.error("Tengo que estar sobre la pelota")
		}
	}

	method puedoPatear() = self.position() == bocha.position()

	method image() {
		return camiseta
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}

	method estaEnPosicion() {
	  return position == bocha.position()
	}

	method validarTaquito() {
		if(not self.estaEnPosicion()){
			self.error("Lionel no se encuentra donde la pelota")
		}
	}

	method taquito() {
	  self.validarTaquito()
	  bocha.serTaquito()
	}

	method cambiarCamiseta() {
		self.validarPosicion()
		if (camiseta != "lionel-titular.png") {
			camiseta = "lionel-titular.png"
		} else {
			camiseta = "lionel-suplente.png"
		}
	}

	method validarPosicion() {
		if (not self.estaEnBorde()) self.error("Lionel no se encuentra sobre el borde izquierdo")
	}

	method estaEnBorde() = self.position() == game.at(0, self.position().y())
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)

	method serTaquito() {
	  position = game.at(0.max(position.x() - 2), position.y())
	}
	
	method pateada(){

		position = game.at((game.width() -1 ).min(position.x()+3), position.y())
	}
}
