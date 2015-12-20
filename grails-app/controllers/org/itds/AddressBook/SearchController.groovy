package org.itds.AddressBook

class SearchController {

    def index() { }
	
	def autocomplete(String searchTerm) {

		def searchPerson = Person.findAllByNameIlike("%${searchTerm}%").name
		render(contentType: 'text/json') {
			//['results': "name1"]}
			['results': searchPerson]}
	}
	
}
