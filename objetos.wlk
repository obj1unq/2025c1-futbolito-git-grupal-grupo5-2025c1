/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
	var property bocha = pelota
	
	method image() {
		return "lionel-titular.png"
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

}


object pelota {
	const property image="pelota.png"
	var property position = game.at(3,5)	

	method serTaquito() {
	  position = game.at(0.max(position.x() - 2), position.y())
	}
}
