package org.itds.AddressBook



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PersonController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["GET","DELETE"]]
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Person.list(params).grep{it.adressbuch.benutzer.id == session.userId}, model:[personInstanceCount: Person.count()]
    }

    def show(Person personInstance) {
        respond personInstance
    }

    def create() {
		def ownAddressBook = AddressBook.list().grep{it.benutzer.id == session.userId}
		def personTag = Tag.list().grep{it.benutzer.id == session.userId}
		[ownAddressBooks: ownAddressBook, personTags: personTag]
    }

    @Transactional
    def save(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view:'create'
            return
        }

        personInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.success = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.toString()])
                redirect personInstance
            }
            '*' { respond personInstance, [status: CREATED] }
        }
    }

    def edit(Person personInstance) {
		def ownAddressBook = AddressBook.list().grep{it.benutzer.id == session.userId}
		def personAddress = personInstance.hauptadresse
		def personTag = personInstance.tags
		[personInstance: personInstance, ownAddressBooks: ownAddressBook, personAddresses: personAddress, personTags:personTag]
    }

    @Transactional
    def update(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view:'edit'
            return
        }

        personInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.success = message(code: 'default.updated.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.toString()])
                redirect personInstance
            }
            '*'{ respond personInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Person personInstance) {

        if (personInstance == null) {
            notFound()
            return
        }

        switch ( request.method ){


            case "DELETE":

                def name = personInstance.toString()

                personInstance.delete flush:true

                request.withFormat {
                    form multipartForm {
                        flash.success = message(code: 'default.deleted.message', args: [message(code: 'Person.label', default: 'Person'), name])
                        redirect action:"index", method:"GET"
                     }
                    '*'{ render status: NO_CONTENT }
                }
                break;

            case "GET":
            default:
                [personInstance:personInstance]
            }

        }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.error = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
