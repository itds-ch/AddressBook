package org.itds.AddressBook

class SearchController {

    def index() { }
	
	def autocomplete(String term) {
		
		def searchPerson = Person.findAllByNameLike("%${term}%")
		def personNames = new ArrayList<String>()
		for (person in searchPerson)
			personNames.add(person.name)
		
		render(contentType: 'text/json') {[
			'results': personNames
		]}
	}
	
}
