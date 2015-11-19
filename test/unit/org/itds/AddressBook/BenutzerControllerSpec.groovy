package org.itds.AddressBook



import grails.test.mixin.*
import spock.lang.*

@TestFor(BenutzerController)
@Mock(Benutzer)
class BenutzerControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.benutzerInstanceList
            model.benutzerInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.benutzerInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            def benutzer = new Benutzer()
            benutzer.validate()
            controller.save(benutzer)

        then:"The create view is rendered again with the correct model"
            model.benutzerInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            benutzer = new Benutzer(params)

            controller.save(benutzer)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/benutzer/show/1'
            controller.flash.message != null
            Benutzer.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def benutzer = new Benutzer(params)
            controller.show(benutzer)

        then:"A model is populated containing the domain instance"
            model.benutzerInstance == benutzer
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def benutzer = new Benutzer(params)
            controller.edit(benutzer)

        then:"A model is populated containing the domain instance"
            model.benutzerInstance == benutzer
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/benutzer/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def benutzer = new Benutzer()
            benutzer.validate()
            controller.update(benutzer)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.benutzerInstance == benutzer

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            benutzer = new Benutzer(params).save(flush: true)
            controller.update(benutzer)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/benutzer/show/$benutzer.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/benutzer/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def benutzer = new Benutzer(params).save(flush: true)

        then:"It exists"
            Benutzer.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(benutzer)

        then:"The instance is deleted"
            Benutzer.count() == 0
            response.redirectedUrl == '/benutzer/index'
            flash.message != null
    }
}
