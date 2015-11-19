package org.itds.AddressBook

class Person {

	static constraints = {
		//definition of order of input fields
		//input fields validation
		name(blank:false,maxSize:100)
		vorname(blank:false,maxSize:100)
		alias(blank:true)
		geburtsdatum(blank:false)
		notizen(blank:true,maxSize:1500)
		hauptadresse (unique: true)
	}
	
	String name
	String vorname
	String alias
	Date geburtsdatum
	String notizen
	static belongsTo = [adressbuch: AddressBook]
	static hasOne = [hauptadresse: Address]
	static hasMany = [tags: Tag]

	
	String toString(){
		return name
	  }
	

}
