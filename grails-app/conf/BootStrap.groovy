import java.util.Date;

import org.itds.AddressBook.Address
import org.itds.AddressBook.Address.Adresstyp;
import org.itds.AddressBook.AddressBook
import org.itds.AddressBook.Benutzer
import org.itds.AddressBook.Person
import org.itds.AddressBook.Tag


class BootStrap {
	
	def init = { servletContext ->
		
		
		def benutzer1 = new Benutzer (benutzername: "benutzer1", passwort:"passwort1")
		def benutzer2 = new Benutzer (benutzername: "benutzer2", passwort:"passwort2")
		def benutzer3 = new Benutzer (benutzername: "benutzer3", passwort:"passwort3")
				
		def tag1 = new Tag(name: "friends", iconName: "iconFriends")
		def tag2 = new Tag(name: "family", iconName: "iconFamily")
		def tag3 = new Tag(name: "sport", iconName: "iconSport")
		def tag4 = new Tag(name: "study", iconName: "iconStudy")
		
		benutzer1.addToTags(tag1)
		benutzer1.addToTags(tag2)
		benutzer2.addToTags(tag3)
		benutzer3.addToTags(tag4)
		
		def addressBook1 = new AddressBook (name:"addressBookName1")
		def addressBook2 = new AddressBook (name:"addressBookName2")
		def addressBook3 = new AddressBook (name:"addressBookName3")
		
		benutzer1.addToAddressBooks(addressBook1)
		benutzer1.addToAddressBooks(addressBook2)
		benutzer3.addToAddressBooks(addressBook3)
			
		def hauptadresse1 = new Address (adresstyp: "WORK", bezeichnung: "bezeichnung1", firma: "firma1", strasse:"strasse1",plz:"09999", ort:"ort1", personalEmail:"test@1mail.com",tel:"+491759999999",mobile:"+491759999999",website:"http://test1.com")
		def hauptadresse2 = new Address (adresstyp: "HOME", bezeichnung: "bezeichnung2", firma: "firma2", strasse:"strasse2",plz:"", ort:"ort2", personalEmail:"test2@mail.com",tel:"",mobile:"+491759999999",website:"http://test2.com")
		def hauptadresse3 = new Address (adresstyp: "HOME", bezeichnung: "bezeichnung3", firma: "firma3", strasse:"strasse3",plz:"", ort:"ort3", personalEmail:"test3@mail.com",tel:"",mobile:"+491733333333",website:"http://test3.com")
		def hauptadresse4 = new Address (adresstyp: "HOME", bezeichnung: "bezeichnung4", firma: "firma4", strasse:"strasse4",plz:"", ort:"ort4", personalEmail:"test4@mail.com",tel:"",mobile:"+491744444444",website:"http://test4.com")
		def hauptadresse5 = new Address (adresstyp: "WORK", bezeichnung: "bezeichnung5", firma: "firma5", strasse:"strasse5",plz:"", ort:"ort5", personalEmail:"test5@mail.com",tel:"",mobile:"+491755555555",website:"http://test5.com")
		
		def person1 = new Person (name: "personName1", vorname: "vorname1", alias: "alias1", geburtsdatum: "", notizen:"notizenText1", adressbuch:addressBook1, hauptadresse: hauptadresse1, tags:tag1)
		def person2 = new Person (name: "personName2", vorname: "vorname2", alias: "alias2", geburtsdatum: "", notizen:"notizenText2", adressbuch:addressBook1, hauptadresse: hauptadresse2, tags:tag2)
		def person3 = new Person (name: "personName3", vorname: "vorname3", alias: "alias3", geburtsdatum: "", notizen:"notizenText3", adressbuch:addressBook2, hauptadresse: hauptadresse3, tags:tag3)
		def person4 = new Person (name: "personName4", vorname: "vorname4", alias: "alias4", geburtsdatum: "", notizen:"notizenText4", adressbuch:addressBook3, hauptadresse: hauptadresse4, tags:tag4)
		def person5 = new Person (name: "personName5", vorname: "vorname5", alias: "alias5", geburtsdatum: "", notizen:"notizenText5", adressbuch:addressBook3, hauptadresse: hauptadresse5, tags:tag2)
		
		benutzer1.save(failOnError:true)
		benutzer2.save(failOnError:true)
		benutzer3.save(failOnError:true)
		tag1.save(failOnError:true)
		tag2.save(failOnError:true)
		tag3.save(failOnError:true)
		tag4.save(failOnError:true)
		person1.save(failOnError:true)
		person2.save(failOnError:true)
		person3.save(failOnError:true)
		person4.save(failOnError:true)
		person5.save(failOnError:true)
		addressBook1.save(failOnError:true)
		addressBook2.save(failonError:true)
		addressBook3.save(failonError:true)
		hauptadresse1.save(failOnError:true)
		hauptadresse2.save(failOnError:true)
		hauptadresse3.save(failOnError:true)
		hauptadresse4.save(failOnError:true)
		hauptadresse5.save(failOnError:true)
											
	  }
	
	
    def destroy = {
    }
}
