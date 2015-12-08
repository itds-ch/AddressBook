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
		
		benutzer1.addToTags(tag1)
		benutzer1.addToTags(tag2)
		
		def addressBook1 = new AddressBook (name:"addressBookName1")
		def addressBook2 = new AddressBook (name:"addressBookName2")
		benutzer1.addToAddressBooks(addressBook1)
		benutzer2.addToAddressBooks(addressBook2)
			
		def hauptadresse1 = new Address (adresstyp: "WORK", bezeichnung: "bezeichnung1", firma: "firma1", strasse:"strasse1",plz:"09999", ort:"ort1", personalEmail:"test@1mail.com",tel:"+491759999999",mobile:"+491759999999",website:"http://test1.com")
		def hauptadresse2 = new Address (adresstyp: "HOME", bezeichnung: "bezeichnung2", firma: "firma2", strasse:"strasse2",plz:"", ort:"ort2", personalEmail:"test2@mail.com",tel:"",mobile:"+491759999999",website:"http://test2.com")
		
		def person1 = new Person (name: "personName1", vorname: "vorname1", alias: "alias1", geburtsdatum: "", notizen:"notizenText1", adressbuch:addressBook1, hauptadresse: hauptadresse1, tags:tag1)
		def person2 = new Person (name: "personName2", vorname: "vorname2", alias: "alias2", geburtsdatum: "", notizen:"notizenText2", adressbuch:addressBook1, hauptadresse: hauptadresse2, tags:tag2)
		
		benutzer1.save(failOnError:true)
		benutzer2.save(failOnError:true)
		benutzer3.save(failOnError:true)
		tag1.save(failOnError:true)
		tag2.save(failOnError:true)
		person1.save(failOnError:true)
		person2.save(failOnError:true)
		addressBook1.save(failOnError:true)
		addressBook2.save(failonError:true)
		hauptadresse1.save(failOnError:true)
		hauptadresse2.save(failOnError:true)
		
											
	  }
	
	
    def destroy = {
    }
}
