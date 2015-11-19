package org.itds.AddressBook

class Address {

	static constraints = {
		//definition of order of input fields
		//input fields validation
		//adresstyp() - will be defined later
		bezeichnung(blank:true)
		firma(blank:true)
		strasse(blank:true)
		plz(nullable: true)
		ort(blank:true)
		personalEmail(email:true)
		tel(blank:true)
		mobile(blank:true)
		website(url:true)
		
	}
	
	//enum Adresstyp {WORK, HOME, OTHER} - will be defined later
	String bezeichnung
	static belongsTo = [person: Person]
	String firma
	String strasse
	Integer plz
	String ort
	String personalEmail
	String tel
	String mobile
	String website



}
