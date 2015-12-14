package org.itds.AddressBook



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AddressBookController {

    static allowedMethods = [save: "POST", update: "PUT", delete: ["GET","DELETE"]]
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		respond AddressBook.list(params).grep{it.benutzer.id == session.userId}, model:[addressBookInstanceCount: AddressBook.count()]
    }

    def show(AddressBook addressBookInstance) {
		respond addressBookInstance
		
    }

    def create() {
		def loggedBenutzer = Benutzer.list().grep{it.id == session.userId}
		[loggedBenutzer: loggedBenutzer]
		//respond new AddressBook(params)
    }

    @Transactional
    def save(AddressBook addressBookInstance) {
        if (addressBookInstance == null) {
            notFound()
            return
        }

        if (addressBookInstance.hasErrors()) {
            respond addressBookInstance.errors, view:'create'
            return
        }

        addressBookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.success = message(code: 'default.created.message', args: [message(code: 'addressBook.label', default: 'AddressBook'), addressBookInstance.toString()])
                redirect addressBookInstance
            }
            '*' { respond addressBookInstance, [status: CREATED] }
        }
    }

    def edit(AddressBook addressBookInstance) {
		def loggedBenutzer = addressBookInstance.benutzer
		[addressBookInstance: addressBookInstance, loggedBenutzer: loggedBenutzer]
        //respond addressBookInstance
    }

    @Transactional
    def update(AddressBook addressBookInstance) {
        if (addressBookInstance == null) {
            notFound()
            return
        }

        if (addressBookInstance.hasErrors()) {
            respond addressBookInstance.errors, view:'edit'
            return
        }

        addressBookInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.success = message(code: 'default.updated.message', args: [message(code: 'AddressBook.label', default: 'AddressBook'), addressBookInstance.toString()])
                redirect addressBookInstance
            }
            '*'{ respond addressBookInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(AddressBook addressBookInstance) {

        if (addressBookInstance == null) {
            notFound()
            return
        }

        switch ( request.method ){


            case "DELETE":

                def name = addressBookInstance.toString()

                addressBookInstance.delete flush:true

                request.withFormat {
                    form multipartForm {
                        flash.success = message(code: 'default.deleted.message', args: [message(code: 'AddressBook.label', default: 'AddressBook'), name])
                        redirect action:"index", method:"GET"
                     }
                    '*'{ render status: NO_CONTENT }
                }
                break;

            case "GET":
            default:
                [addressBookInstance:addressBookInstance]
            }

        }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.error = message(code: 'default.not.found.message', args: [message(code: 'addressBook.label', default: 'AddressBook'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
