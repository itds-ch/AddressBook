package org.itds.AddressBook

class Address {

	static constraints = {
		//definition of order of input fields
		//input fields validation
		adresstyp(nullable:false) 
		bezeichnung(blank:false)
		firma(blank:true)
		strasse(blank:false)
		plz(nullable:true)
		ort(blank:false)
		personalEmail(blank:false, email:true)
		tel(blank:true, nullable:true)
		mobile(blank:false)
		website(blank:false,url:true)
		
	}
	
	enum Adresstyp {WORK, HOME, OTHER} 
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
	Adresstyp adresstyp

	String toString(){
		"${strasse} ${plz} ${ort}"
	  }

}
