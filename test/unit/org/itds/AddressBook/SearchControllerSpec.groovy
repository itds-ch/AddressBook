package org.itds.AddressBook

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.web.ControllerUnitTestMixin} for usage instructions
 */
@TestFor(SearchController)
class SearchControllerSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

	def autocomplete() {
		render(contentType: 'text/json') {[
			'results': '["name1","name2"]'
		]}
	}
	
    void "test something"() {
    }
}
