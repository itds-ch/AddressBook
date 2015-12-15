package org.itds.AddressBook

class Benutzer {

	transient springSecurityService 
	
	static constraints = {
		benutzername(blank:false,unique:true,maxSize:100)
		passwort(blank:false,maxSize:100)
	}
	
	String benutzername
	String passwort
	static hasMany = [tags:Tag, addressBooks: AddressBook]
	

	//hashing BCrypt password
	
	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('passwort'))
			encodePassword()
	}

	protected encodePassword() {
		passwort = springSecurityService.encodePassword(passwort, benutzername)
	}
	
	
	String toString(){
		return "${benutzername}"
	}

    
}
