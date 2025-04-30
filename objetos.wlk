/** First Wollok example */
import wollok.game.*

object lionel {
	
	var property position = game.at(3,5)
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
		return "lionel-titular.png"
	}

	method retroceder() {
		position = game.at(0.max(position.x() - 1), position.y()) 
	}
	
	method avanzar() {
		position = game.at((game.width() - 1).min(position.x() + 1), position.y()) 
	}
	
}


object pelota {
	const property image="pelota.png"
	var property position = game.at(5,5)	

	method pateada(){

		position = game.at((game.width() -1 ).min(position.x()+3), position.y())
	}
}
