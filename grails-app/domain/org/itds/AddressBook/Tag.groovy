package org.itds.AddressBook

class Tag {

	static constraints = {
		name(blank:false,unique:true,maxSize:100)
		iconName(blank:true,maxSize:100)
	}
	
	String name
	String iconName // later will be defined as image
	static belongsTo = [benutzer: Benutzer]
	
}
