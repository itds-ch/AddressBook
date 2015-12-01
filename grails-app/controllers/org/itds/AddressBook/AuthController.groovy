package org.itds.AddressBook

class AuthController {

    def index() { }
	
	def login = {}
	
	// Authentification of users
	def authenticate = {
		  def benutzer = Benutzer.findByBenutzernameAndPasswort(params.benutzername, params.passwort)
		  if(benutzer){
			session.user = benutzer
			flash.message = "Welcome ${session.user.benutzername}!"
			redirect(controller:"addressBook", action:"index") 
		  }else{
			flash.message = "Please try again."
			redirect(action:"login")
		  }
	}
	

	def logout = {
	  flash.message = "Goodbye ${session.user.benutzername}"
	  session.user = null
	  redirect(controller:"addressBook", action:"index")
	}

	
	
}
