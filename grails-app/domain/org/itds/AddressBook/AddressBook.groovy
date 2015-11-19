package org.itds.AddressBook

class AddressBook {

	static constraints = {
		name(blank:false,maxSize:100)
	}
	
	String name
	Benutzer benutzer
	
	String toString(){
		return name
	  }
	
 }
