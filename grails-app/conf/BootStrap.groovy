import org.itds.AddressBook.AddressBook
import org.itds.AddressBook.Benutzer
import org.itds.AddressBook.Tag



class BootStrap {
	
	def init = { servletContext ->
		//def benutzer = new Benutzer (benutzername: "makwin", passwort:"12345")
		//if(benutzer.hasErrors()){
		//	println benutzer.errors
		//}
		//benutzer.save(failOnError: true)
		
		//def tag = new Tag(name: "mittwoch", iconName: "iconName" , Benutzer: benutzer)
		//tag.save(failOnError: true)
		
		//def addressBook = new AddressBook(name: "zentrales", Benutzer: benutzer)
		//tag.save(failOnError: true)
		
	  }
	
	
    def destroy = {
    }
}
