package org.itds.AddressBook

class AddressBook {

	static constraints = {
		name(blank:false, maxSize:50)
	}
	
	String name
	static belongsTo = [benutzer: Benutzer]
	
	String toString(){
		return "${name}"
	  }
	
 }
