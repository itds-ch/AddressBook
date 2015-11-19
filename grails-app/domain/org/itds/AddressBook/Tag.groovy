package org.itds.AddressBook

class Tag {

	static constraints = {
		name(blank:false,unique:true,maxSize:100)
		iconName(blank:true,maxSize:100)
	}
	
	String name
	static belongsTo = [benutzer: Benutzer]
	String iconName
	
	String toString(){
		return name
	  }
	
}
