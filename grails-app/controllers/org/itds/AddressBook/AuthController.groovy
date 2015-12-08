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
			//commented code will be activated after implementing secured controller
			//def userId = springSecurityService.getCurrentUser()
			//session.setAttribute("id", userId)
			session.user = benutzer  
			//flash.message = "Welcome ${springSecurityService.currentUser?.username}!"
			redirect(controller:"addressBook", action:"index")
			
		  } else {
				flash.message = "Please try again."
				redirect(action:"login")
		  }
		   
	}
	

	def logout = {
	  flash.message = "Goodbye ${session.id}"
	  //session.id = null
	  session.user = null
	  redirect(controller:"addressBook", action:"index")
	}

	
	
}
