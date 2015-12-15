package org.itds.AddressBook

class AuthController {
	
	def springSecurityService
	def passwordEncoder
	
    def index() {}
	
	def login = {}
	
	// Authentification of users
	def authenticate = {
		
		  def benutzer = Benutzer.findByBenutzername(params.benutzername)
				  
		  if(benutzer && passwordEncoder.isPasswordValid(benutzer.passwort, params.passwort, null)){
			session.userId = benutzer.id  
			redirect(controller:"addressBook", action:"index")
			
		  } else {
				flash.message = "Please try again."
				redirect(action:"login")
		  }
		   
	}
	

	def logout = {
	  flash.message = "Goodbye ${session.userId}"
	  session.userId = null
	  redirect(controller:"addressBook", action:"index")
	}

	
	
}
