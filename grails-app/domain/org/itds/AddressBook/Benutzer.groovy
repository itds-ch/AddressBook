package org.itds.AddressBook

class Benutzer {

	static constraints = {
		benutzername(blank:false,unique:true,maxSize:100)
		passwort(blank:false,maxSize:100)
	}
	
	String benutzername
	String passwort
	static hasMany = [tags:Tag, addressBooks: AddressBook]
		
	String toString(){
		return benutzername
	}

    
}
